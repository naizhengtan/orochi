#!/bin/bash
if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: environment ORO_HOME is not defined"
  exit 1
fi

source $ORO_HOME/env.sh
STAND_ALONE_RUN="false"

#===========================
# Assumption:
#  - this script must be invoked in this folder
#===========================

#RAW_URL_FILE="./zipfian/zipf_urls_20.txt"
#RAW_URL_FILE="./zipfian/zipf_urls_test.txt"
#RAW_URL_FILE="./zipfian/zipf_oourls_1000.txt"
RAW_URL_FILE="./zipfian/zipf_20000.txt"

#RAW_URL_FILE="./zipfian/uniq_traces.txt"
#RAW_URL_FILE="./zipfian/zipf_urls_100_10000_0-53.txt"
#RAW_URL_FILE="./zipfian/zipf_urls_100_50000.txt"
#RAW_URL_FILE="./zipfian/zipf_15000.txt"
#RAW_URL_FILE="./zipfian/debug_traces.txt"
#RAW_URL_FILE="./zipfian/zipf_urls_20.txt"
#RAW_URL_FILE="./zipfian/zipf_urls_1000_100000_0-53.txt"

DEBUG_PRINT=true

function dprint {
  if [ $DEBUG_PRINT == "true" ]; then
    echo "[INFO]: $1"
  fi
}

function usage {
  echo "workload_gen.sh [prof_normal|prof_oro|veri_workload]"
}


function init {
  # invisible rabbit!!
  sudo_invisible_rabbit

  clear_tmp_files 

  # rm /home/cheng/.hhvm.hhbc

  clear_oro_hints
  clear_normal_profiling
  clear_logging_fd

  # regenerate the $PROF_EXE_TIME_LOG
  atool_web_restart || fail "web restart"
  
  atool_hhvm_stop
  if [ $TASK == "prof_normal" ]; then
    dprint "Normal profiling, start normal hhvm"
    atool_hhvm_start || fail "hhvm start"
  else 
    dprint "start hhvm record"
    atool_hhvm_record_start || fail "hhvmt restart"
  fi

  if [ $TASK != "prof_normal" ]; then
    # start the trace collector
    start_loggin_proxy 
  else 
    start_normal_proxy
  fi

  # mmysql
  atool_mmysql_stop
  if [ $TASK == "prof_normal" ]; then
    dprint "start original-mysql"
    atool_omysql_default_start || fail "omysql start"
  else
    dprint "start logging-mysql"
    atool_mmysql_start || fail "mmysql start"
  fi

  # clear all the cpu files
  # NOTE: must rm after all the daemons are ready!!!
  clear_clock_logs
}

# main
if [ $# == 1 ]; then
  TASK=$1
elif [ $# == 0 ]; then
  TASK="veri_workload"
else
  usage
  exit 1
fi

if [ "$TASK" != "prof_normal" ] && [ "$TASK" != "prof_oro" ] && [ "$TASK" != "veri_workload" ]; then
  fail "task $TASK is not supported"
fi

# (0) init
if [ $STAND_ALONE_RUN == "true" ]; then
  init
fi
cp $WEB_WIKI_PATH/LocalSettings_normal.php $WEB_WIKI_PATH/LocalSettings.php

if [ "$TASK" != "prof_normal" ]; then
  URL=$WEB_WIKI_PROXY_URL
else
  URL=$WEB_WIKI_URL
fi

# (1) clear the cache on the server
mysql -u$DB_USER -p$DB_PASS < ./scripts/clear_cache.sql

# (1.5) collect CPU time for HHVM, Nginx, MySQL
if [ $TASK == "prof_normal" ]; then
  HHVMPID=$(get_hhvm_pid)
else 
  HHVMPID=$(get_hhvm_log_pid)
fi
dprint "hhvm pid=$HHVMPID"

# this is multiple pids
NGINXPID_ARR=($(get_nginx_pid_arr))
dprint "nginx pid=[ ${NGINXPID_ARR[*]} ]"
  
MYSQLPID=$(get_mysql_pid)
dprint "mysql pid=$MYSQLPID"

HHVM_VERI_CPU_START=$(get_cur_cpu_time "hhvm")
NGINX_VERI_CPU_START=$(get_cur_cpu_time "nginx")
MYSQL_VERI_CPU_START=$(get_cur_cpu_time "mysql")

# (2) run the real script

# # Sequential version
#python run_trace.py $URL $RAW_URL_FILE

# Concurrent version
python ./multi_run_trace.py $URL $RAW_URL_FILE 2

HHVM_VERI_CPU_END=$(get_cur_cpu_time "hhvm")
NGINX_VERI_CPU_END=$(get_cur_cpu_time "nginx")
MYSQL_VERI_CPU_END=$(get_cur_cpu_time "mysql")

# (3) stop the tracer
if [ $TASK != "prof_normal" ]; then
  sleep 1 # wait tcpdump to flush 
  stop_proxy
  # stop polluting the workload
  atool_hhvm_stop
  sudo python $DB_MERGE_SCRIPT
fi

sleep 1

FAIL=false
if [ $TASK == "veri_workload" ]; then
  $POH_PROGM $HINT_TRAC_SEQ_LOG $HINT_SESS_LOG $HINT_APC_RAW_LOG $HINT_DB_RAW_LOG $HINT_MAX_OP $OPMAP_MEM || FAIL=true 
fi

# (4) dump output
# (4.1) number of requests
NUM_REQ=$(cat $PROF_EXE_TIME_LOG | wc -l)
echo "Number of requests: $NUM_REQ"

# (4.2) the cpu time from /proc/
HHVM_CPU_TIME_TOTAL=$(( $HHVM_VERI_CPU_END - $HHVM_VERI_CPU_START ))
NGINX_CPU_TIME_TOTAL=$(( $NGINX_VERI_CPU_END - $NGINX_VERI_CPU_START ))
MYSQL_CPU_TIME_TOTAL=$(( $MYSQL_VERI_CPU_END - $MYSQL_VERI_CPU_START ))
CPU_TIME_TOTAL=$(( $HHVM_CPU_TIME_TOTAL + $NGINX_CPU_TIME_TOTAL + $MYSQL_CPU_TIME_TOTAL ))

echo "proc CPU time: $CPU_TIME_TOTAL ms"
echo "  proc hhvm CPU time: $HHVM_CPU_TIME_TOTAL ms"
echo "  proc nginx CPU time: $NGINX_CPU_TIME_TOTAL ms"
echo "  proc mysql CPU time: $MYSQL_CPU_TIME_TOTAL ms"

if [ $FAIL == true ]; then
  fail "trace collecting"
fi

# (10.3) the cpu time from clock()
if [ $TASK == "prof_normal" ]; then
  CLOCK_HHVM_CPU_TIME_TOTAL=$($GET_CPU_TIME_SCRIPT $PROF_HHVM_CPU_LOG)
else
  CLOCK_HHVM_CPU_TIME_TOTAL=$($GET_CPU_TIME_SCRIPT $PROF_HHVM_LOG_CPU_LOG)
fi

if [ $TASK == "prof_normal" ]; then
  CLOCK_MYSQL_CPU_TIME_TOTAL=$($GET_CPU_TIME_SCRIPT $PROF_MYSQL_ORIG_CPU_LOG)
else
  CLOCK_MYSQL_CPU_TIME_TOTAL=$($GET_CPU_TIME_SCRIPT $PROF_MYSQL_LOG_CPU_LOG)
fi

CLOCK_CPU_TIME_TOTAL=$(( $CLOCK_HHVM_CPU_TIME_TOTAL + $NGINX_CPU_TIME_TOTAL + $CLOCK_MYSQL_CPU_TIME_TOTAL ))
echo "clock CPU time: $CLOCK_CPU_TIME_TOTAL ms"
echo "  clock hhvm CPU time: $CLOCK_HHVM_CPU_TIME_TOTAL ms"
echo "  clock mysql CPU time: $CLOCK_MYSQL_CPU_TIME_TOTAL ms"

EXE_TIME=$(python $COLLECT_TIME_SCRIPT2 newline $PROF_EXE_TIME_LOG 2> /dev/null || echo 0) # from Nginx
echo "execution time: $EXE_TIME ms"

# profiling orochi doesn't have the latter profiling files
if [ "$TASK" != "prof_normal" ]; then
  exit
fi

# (4.3) running time from logs
WHOLE_PHP_TIME=$(python $COLLECT_TIME_SCRIPT2 comma $PROF_WHOLE_PHP_TIME_LOG 2> /dev/null || echo 0) # from php
REQ_TIME=$(python $COLLECT_TIME_SCRIPT2 comma $PROF_REQ_TIME_LOG 2> /dev/null || echo 0) # from php
DB_TIME=$(python $COLLECT_TIME_SCRIPT2 comma $PROF_DB_TIME_LOG 2> /dev/null || echo 0) # from php 
PHP_TIME=$(($WHOLE_PHP_TIME - $DB_TIME))
echo "  req time: $REQ_TIME ms"
echo "  php time: $PHP_TIME ms"
echo "  db query time: $DB_TIME ms"
