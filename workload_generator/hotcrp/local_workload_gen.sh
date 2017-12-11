#!/bin/bash
if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: environemnt variable ORO_HOME is empty"
  exit 1
fi

source $ORO_HOME/env.sh
STAND_ALONE_RUN="false"

#======Configuration Variables==========

# workload related
NUM_USER=269    #269
AVG_NUM_EDIT=10 #10
USER_PAGES=100  #100
NUM_PC=58       #58
NUM_REVIEW=2    #2
PC_PAGES=100    #100

NUM_THRD=1 # for staled casperjs workload generator
DEBUG_PRINT=true
PYTHON=true # use python workload generator or casperjs

#=======Global Variables==============

USER_FILE="users.txt"
SUBMISSION_FD="./submissions/"
WORKLOAD="./scripts/new_hotcrp_workgen.py"
TEMP_PASSWD_FILE=$(mktemp /tmp/hotcrp-password-XXXXXX)
TEMP_USER_LIST=$(mktemp /tmp/hotcrp-userlist-XXXXXX)

#=========helper functions================

function dprint {
  if [ $DEBUG_PRINT == "true" ]; then
    echo "[INFO]: $1"
  fi
}

function usage {
  echo "local_workload_gen.sh [prof_normal|veri_workload|prof_oro]"
}

function finish {
    rm -f $TEMP_USER_LIST
    rm -f $TEMP_PASSWD_FILE
}

function init {
  sudo_invisible_rabbit

  clear_logging_fd
  clear_oro_hints
  clear_normal_profiling
  clear_tmp_files
  
  # regenerate the $PROF_EXE_TIME_LOG
  atool_web_restart || fail "web restart stop"

  atool_hhvm_stop # will try to stop all, may return fail 
  if [ "$TASK" == "prof_normal" ]; then
    dprint "Normal profiling, start normal hhvm"
    atool_hhvm_start || fail "hhvm start"
  else 
    dprint "start hhvm record"
    atool_hhvm_record_start || fail "hhvmt restart"
  fi

  if [ "$TASK" != "prof_normal" ]; then
    # start the trace collector
    start_loggin_proxy 
  else 
    start_normal_proxy
  fi

  # mmysql
  atool_mmysql_stop
  if [ "$TASK" == "prof_normal" ]; then
    dprint "start original-mysql"
    atool_omysql_default_start || fail "start omysql"
  else
    dprint "start logging-mysql"
    atool_mmysql_start || fail "start mmysql"
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

if [ "$TASK" != "veri_workload" ] && [ "$TASK" != "prof_normal" ] && [ "$TASK" != "prof_oro" ]; then
  usage
  exit 1
fi

# (0) init
if [ $STAND_ALONE_RUN == "true" ]; then
  init
fi

if [ "$TASK" != "prof_normal" ]; then
  URL=$WEB_HOTCRP_PROXY_URL
else
  URL=$WEB_HOTCRP_URL
fi

# (1) create hotcrp database 
$HOTCRP_LIB_CRDB --replace --dbuser=$HOTCRP_DBUSER,$HOTCRP_DBPASS -u$DB_USER -p$DB_PASS $HOTCRP_DB_NAME || fail "recreate the database"

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

trap finish EXIT

if [ $PYTHON == true ]; then
  # (2.1) create admin
  echo "admin@nyu.edu" > $TEMP_USER_LIST
  $WORKLOAD --url=$URL --module=register --users=$TEMP_USER_LIST|| fail "create admin"

  # (2.2) creating users
  $WORKLOAD --url=$URL --module=register --action=create-user --num-user=$NUM_USER --users=$TEMP_USER_LIST || fail "create users"

  # (3) update password
  echo 'update ContactInfo set password="123"' > $TEMP_PASSWD_FILE
  mysql -u$DB_USER -p$DB_PASS $HOTCRP_DB_NAME < $TEMP_PASSWD_FILE || fail "update password"

  # (4) admin open conference
  $WORKLOAD --url=$URL --module=admin --action=open-conf || fail "open conference"

  # (5) user submit and edit
  $WORKLOAD --url=$URL --module=users --users=$TEMP_USER_LIST --action=submit --papers=$SUBMISSION_FD --repeat=$AVG_NUM_EDIT || fail "submit edit papers"

  # (6) create PC accounts & update passwords
  $CASPERJS ./scripts/admin-setting.js --url=$URL --action=create-pc --num=$NUM_PC || fail "create pc"
  mysql -u$DB_USER -p$DB_PASS $HOTCRP_DB_NAME < $TEMP_PASSWD_FILE || fail "update password"
  rm -f $TEMP_PASSWD_FILE

  # (7) open review & assign papers
  $CASPERJS ./scripts/admin-setting.js --url=$URL --action=open-review || fail "open review"
  $CASPERJS ./scripts/admin-setting.js --url=$URL --action=assign-paper || fail "assign paper"

  # (8) login as PC and review
  $WORKLOAD --url=$URL --module=pc --num-user=$NUM_PC --action=review --repeat=$NUM_REVIEW || fail "review papers"

#  #========================
#  # Sequential version
#  echo "[INFO] Sequential viewing"
#  # (9.1) user view pages
#  $WORKLOAD --url=$URL --module=users --users=$TEMP_USER_LIST --action=view --repeat=$USER_PAGES || fail "view pages"
#
#  # (9.2) pc read
#  $WORKLOAD --url=$URL --module=pc --num-user=$NUM_PC --action=view --repeat=$PC_PAGES || fail "view pages"
#
#  echo "[INFO] end of sequential viewing"
#  #========================

  #========================
  # Concurrent version
  echo "[INFO] concurrent viewing"
  # (9.1) user view pages
  $WORKLOAD --url=$URL --module=users --users=$TEMP_USER_LIST --action=view --repeat=$USER_PAGES & #|| fail "view pages"
  PID_LIST[1]=$!

  # (9.2) pc read
  $WORKLOAD --url=$URL --module=pc --num-user=$NUM_PC --action=view --repeat=$PC_PAGES & #|| fail "view pages"
  PID_LIST[2]=$!

  # wait the worker theads
  for pid in "${PID_LIST[@]}"; do
    wait $pid 
  done

  echo "[INFO] end of concurrent viewing"
  #========================

else 
  # (2) create users
  # admin
  echo "admin@nyu.edu" > /tmp/admin.hotcrp
  $CASPERJS ./scripts/create-users.js --url=$URL --users="/tmp/admin.hotcrp" || fail "create admin"
  rm -f /tmp/admin.hotcrp
  # other users
  $CASPERJS ./scripts/create-users.js --url=$URL --num=$NUM_USER || fail "create users"

  # (3) modify the passwords
  #ssh cheng@yak.nyu.systems 'bash -s' < ./update_pass.sh || fail "update passwords"
  ./scripts/update_pass.sh || fail "update passwords"

  # (4) using admin to open the conference
  $CASPERJS ./scripts/admin-setting.js --url=$URL --action=open-conf || fail "open conference"

  # (5) generate paper submission
  # NOTE: there is a vairable: editing_number in script which will decide the number of submissions
  $CASPERJS ./scripts/users.js --url=$URL --users=$USER_FILE --action=submission || fail "user submission"

  # (6) create PC accounts & update passwords 
  $CASPERJS ./scripts/admin-setting.js --url=$URL --action=create-pc --num=$NUM_PC || fail "create pc"
  ./update_pass.sh || fail "update passwords"

  # (7) open review & assign papers
  $CASPERJS ./scripts/admin-setting.js --url=$URL --action=open-review || fail "open review"
  $CASPERJS ./scripts/admin-setting.js --url=$URL --action=assign-paper || fail "assign paper"

  # (8) login as PC and review
  # NOTE: there is a vairable: review_times in script which will decide the number of submissions
  $CASPERJS ./scripts/pc.js --url=$URL --num=$NUM_PC --action=review || fail "pc review papers $i times"
  #clean_session

  # (9) reads
  # I need concurency here!
  echo "[INFO] start to run concurrent viewing"
  #$CASPERJS users.js --url=$URL --users=$USER_FILE --action=crawl --pages=$USER_PAGES || fail "user crawl"
  for i in $(seq 0 $(($NUM_THRD-1))); do
    $CASPERJS ./scripts/users.js --url=$URL --users=$USER_FILE --action=crawl --pages=$USER_PAGES --num_thrd=$NUM_THRD --tid=$i &
    # echo "end starting thread $i"
    PID_LIST[i]=$!
  done
  # wait the worker theads
  for pid in "${PID_LIST[@]}"; do
    wait $pid 
  done
  echo "[INFO] end of concurrent viewing"

  #clean_session
  $CASPERJS ./scripts/pc.js --url=$URL --num=$NUM_PC --action=crawl --pages=$PC_PAGES || fail "pc crawl"
  #clean_session
fi

HHVM_VERI_CPU_END=$(get_cur_cpu_time "hhvm")
NGINX_VERI_CPU_END=$(get_cur_cpu_time "nginx")
MYSQL_VERI_CPU_END=$(get_cur_cpu_time "mysql")

# (10) collect db query to gnerate sql.log and stop tracer
if [ $TASK != "prof_normal" ]; then
  sudo python $DB_MERGE_SCRIPT
  sleep 1 # wait tcpdump to flush 
  stop_proxy
  # stop polluting the workload
  atool_hhvm_stop
fi

sleep 1

FAIL=false
if [ $TASK == "veri_workload" ]; then
  $POH_PROGM $HINT_TRAC_SEQ_LOG $HINT_SESS_LOG $HINT_APC_RAW_LOG $HINT_DB_RAW_LOG $HINT_MAX_OP $OPMAP_MEM || FAIL=true 
fi

# (10.1) number of requests
NUM_REQ=$(cat $PROF_EXE_TIME_LOG | wc -l)
echo "Number of requests: $NUM_REQ"

# (10.2) the cpu time from /proc/
HHVM_CPU_TIME_TOTAL=$(( $HHVM_VERI_CPU_END - $HHVM_VERI_CPU_START ))
NGINX_CPU_TIME_TOTAL=$(( $NGINX_VERI_CPU_END - $NGINX_VERI_CPU_START ))
MYSQL_CPU_TIME_TOTAL=$(( $MYSQL_VERI_CPU_END - $MYSQL_VERI_CPU_START ))
CPU_TIME_TOTAL=$(( $HHVM_CPU_TIME_TOTAL + $NGINX_CPU_TIME_TOTAL + $MYSQL_CPU_TIME_TOTAL ))

echo "proc CPU time: $CPU_TIME_TOTAL ms"
echo "  proc hhvm CPU time: $HHVM_CPU_TIME_TOTAL ms"
echo "  proc nginx CPU time: $NGINX_CPU_TIME_TOTAL ms"
echo "  proc mysql CPU time: $MYSQL_CPU_TIME_TOTAL ms"

if [ $FAIL == true ]; then
  fail "trace parsing fails"
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
if [ "$TASK" == "prof_oro" ]; then
  exit
fi

# (10.3) running time from logs
WHOLE_PHP_TIME=$(python $COLLECT_TIME_SCRIPT2 comma $PROF_WHOLE_PHP_TIME_LOG 2> /dev/null || echo 0) # from php
REQ_TIME=$(python $COLLECT_TIME_SCRIPT2 comma $PROF_REQ_TIME_LOG 2> /dev/null || echo 0) # from php
DB_TIME=$(python $COLLECT_TIME_SCRIPT2 comma $PROF_DB_TIME_LOG 2> /dev/null || echo 0) # from php 
PHP_TIME=$(($WHOLE_PHP_TIME - $DB_TIME))
echo "  req time: $REQ_TIME ms"
echo "  php time: $PHP_TIME ms"
echo "  db query time: $DB_TIME ms"
