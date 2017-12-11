#!/bin/bash
if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: environment ORO_HOME is not defined"
  exit 1
fi

source $ORO_HOME/env.sh
STAND_ALONE_RUN="false"

#=========================================

# MySQL config
DB_INIT_FILE="./db_new.sql"
DB_PREPARE_FILE=$PHPBB_DATABASE_FILE

PHPBB_CACHE_FD="$WEB_PHPBB_PATH/cache/production/"

# scripts
CREATE_USERS_JS="./scripts/create-users.js"
USERS_JS="./scripts/users.js"
MULTI_USERS_JS="./scripts/multi_users.js"

# files
NORMAL_ZIPF_FD="./workload/normal_zipf/"
SMALL_ZIPF_FD="./workload/small_zipf/"
LARGE_ZIPF_FD="./workload/large_zipf/"
CENTOS_FD="./workload/centos/"
USER_ZIPF_NAME="user_zipf"
GUEST_ZIPF_NAME="guest"

# centos workload

NUM_THRD=2
DEBUG_PRINT=true

#============helper functions=========

function usage {
    echo "Usage: $0 [prepare|normal|small|large|centos] [prof_normal|veri_workload|prof_oro]"
}

function dprint {
  if [ $DEBUG_PRINT == "true" ]; then
    echo "[INFO]: $1"
  fi
}

function init {

  # invisible rabbit!!
  sudo_invisible_rabbit

  clear_tmp_files 
  clear_oro_hints
  clear_logging_fd
  clear_prof_logs
  clear_normal_profiling

  # remove cache folder
  #rm -rf $PHPBB_CACHE_FD
  
  # regenerate the $PROF_EXE_TIME_LOG
  atool_web_restart || fail "web restart"

  atool_hhvm_stop
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

# ==========main==============
if [ $# != 2 ] && [ $# != 0 ]; then
  usage
  exit 1
fi

# parameters
NUM_USER=10  #83 for centos
NUM_POST=100 #100

# default values are "centos veri_workload"
if [ $# == 0 ]; then
  WORKLOAD="centos"
  TASK="veri_workload"
else
  WORKLOAD=$1
  TASK=$2
fi

if [ "$WORKLOAD" != "small" ] && [ "$WORKLOAD" != "large" ] && [ "$WORKLOAD" != "prepare" ] \
  && [ "$WORKLOAD" != "normal" ] && [ "$WORKLOAD" != "centos" ]; then
  echo "$WORKLOAD is not supported"
  exit 1
fi

if [ "$TASK" != "prof_normal" ] && [ "$TASK" != "veri_workload" ] && [ "$TASK" != "prof_oro" ]; then
  usage
  exit 1
fi

dprint "workload: $WORKLOAD, task: $TASK"

if [ "$WORKLOAD" == "small" ]; then 
    USER_ZIPF_FD=$SMALL_ZIPF_FD
elif [ "$WORKLOAD" == "large" ]; then 
    USER_ZIPF_FD=$LARGE_ZIPF_FD
elif [ "$WORKLOAD" == "centos" ]; then 
    USER_ZIPF_FD=$CENTOS_FD
    NUM_USER=83  #83 for centos
else
    USER_ZIPF_FD=$NORMAL_ZIPF_FD
fi

USER_ZIPF=$USER_ZIPF_FD$USER_ZIPF_NAME
GUEST_ZIPF=$USER_ZIPF_FD$GUEST_ZIPF_NAME


# (1) init
if [ $STAND_ALONE_RUN == "true" ]; then
  init
fi

# set the correct URL
if [ "$TASK" == "veri_workload" ]; then
  URL=$WEB_PHPBB_PROXY_URL
else
  URL=$WEB_PHPBB_URL
fi

# (2) collect data
if [ $TASK == "prof_normal" ]; then
  HHVMPID=$(get_hhvm_pid)
else 
  HHVMPID=$(get_hhvm_log_pid)
fi
dprint "hhvm pid=$HHVMPID"
if [ "$HHVMPID" == "ERROR" ]; then
  fail "Cannot start/find HHVM process"
fi

# this is multiple pids
NGINXPID_ARR=($(get_nginx_pid_arr))
dprint "nginx pid=[ ${NGINXPID_ARR[*]} ]"
if [ "$NGINXPID_ARR" == "ERROR" ]; then
  fail "Cannot start/find nignx process"
fi
  
MYSQLPID=$(get_mysql_pid)
dprint "mysql pid=$MYSQLPID"
if [ "$MYSQLPID" == "ERROR" ]; then
  fail "Cannot start/find mysql process"
fi

HHVM_VERI_CPU_START=$(get_cur_cpu_time "hhvm")
NGINX_VERI_CPU_START=$(get_cur_cpu_time "nginx")
MYSQL_VERI_CPU_START=$(get_cur_cpu_time "mysql")

# (3) run workload
if [ "$WORKLOAD" == "prepare" ]; then

    # reinit mysql
    mysql -u$DB_USER -p$DB_PASS $PHPBB_DB_NAME < $DB_INIT_FILE

    # create user
    echo create $NUM_USER users
    for ((i=0;i<$NUM_USER;i++))
    do
        $CASPERJS $CREATE_USERS_JS --url=$URL --user=user$i
    done
    echo

    echo post $NUM_POST threads
    # post
    for ((i=1;i<$NUM_POST;i++)) # already one thread there
    do
        echo post $i
        $CASPERJS $USERS_JS --url=$URL --user=admin --action=post
    done
    echo

    # dump mysql
    mysqldump -u$DB_USER -p$DB_PASS $PHPBB_DB_NAME > $DB_PREPARE_FILE

else
  # run real workloads
    if [ ! -f $DB_PREPARE_FILE ]; then
        echo $DB_PREPARE_FILE not exist, run "$0 prepare" first
        exit
    fi
    echo "[INFO] prepare initial database"
    mysql -u$DB_USER -p$DB_PASS $PHPBB_DB_NAME < $DB_PREPARE_FILE

    # ======================================
    # =======Centos website workload========
    # ======================================
    if [ "$WORKLOAD" == "centos" ]; then
      # there are two steps: (1) user reply and (2) user read posts
      # (1) user reply
      echo "[INFO] centos workload"
      echo "[INFO] start to reply"
      for ((i=0;i<$NUM_USER;i++))
      do
        echo user$i read
        python ./scripts/phpbb_workgen.py --action reply --user user$i --url $URL --zipfian $USER_ZIPF_FD/user$i"_reply" || fail "run reply"
        echo
      done

      # (2) user read

      ##=========Sequential version=================
      #echo "[INFO] about to start $NUM_USER users"
      #for ((i=0;i<$NUM_USER;i++))
      #do
      #  echo user$i read
      #  python ./scripts/phpbb_workgen.py --url $URL --user user$i --zipfian $USER_ZIPF_FD/user$i"_view" || fail "run user$i"
      #  echo
      #done

      #echo "guest read"
      #python ./scripts/phpbb_workgen.py --url $URL --zipfian $GUEST_ZIPF || fail "run guest"

      #==========Multithread version===============
      echo "[INFO] guest read"
      python ./scripts/phpbb_workgen.py --url $URL --zipfian $GUEST_ZIPF & #|| fail "run guest"
      GUEST_THRD=$!

      echo "[INFO] about to start $NUM_USER users"
      for ((i=0;i<$NUM_USER;i++))
      do
        echo user$i read
        python ./scripts/phpbb_workgen.py --url $URL --user user$i --zipfian $USER_ZIPF_FD/user$i"_view" || fail "run user$i"
        echo
      done

      wait $GUEST_THRD
      echo "[INFO] end of concurrent read"

    else
      # ======================================
      # =======Zipf distribution workload=====
      # ======================================
      echo "[INFO] zipf $WORKLOAD workload"
      # Option 1:
      # Usage: casperjs user.js --url=<url> --numuser=<num_user> --user_file_folder=ufile --guest_read_file=gfile
      # $CASPERJS $MULTI_USERS_JS --url=$URL --numuser=$NUM_USER --user_file_folder=$USER_ZIPF_FD --guest_read_file=$GUEST_ZIPF || fail "run user$i"

      # Option 2:
      for ((i=0;i<$NUM_USER;i++))
      do
        echo user$i read
        python ./scripts/phpbb_workgen.py --url $URL --user user$i --zipfian $USER_ZIPF_FD/user$i || fail "run user$i"
        echo
      done

      echo "guest read"
      python ./scripts/phpbb_workgen.py --url $URL --zipfian $GUEST_ZIPF || fail "run guest"

      # Option 3:
      #for ((i=0;i<$NUM_USER;i++))
      #do
      #    echo user$i read
      #    $CASPERJS $USERS_JS --url=$URL --user=user$i --action=read --readFile=$USER_ZIPF  || fail "run user$i"
      #    echo
      #done
      # guest read
      # echo guest read
      # $CASPERJS $USERS_JS --url=$URL --readFile=$GUEST_ZIPF || fail "run guest"
    fi
fi

# (4) collect data
HHVM_VERI_CPU_END=$(get_cur_cpu_time "hhvm")
NGINX_VERI_CPU_END=$(get_cur_cpu_time "nginx")
MYSQL_VERI_CPU_END=$(get_cur_cpu_time "mysql")

# (5) collect db query to gnerate sql.log and stop tracer
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

# (10.4) running time from logs
EXE_TIME=$(python $COLLECT_TIME_SCRIPT2 newline $PROF_EXE_TIME_LOG 2> /dev/null || echo 0) # from Nginx
echo "execution time: $EXE_TIME ms"

# profiling orochi doesn't have the latter profiling files
if [ "$TASK" != "prof_normal" ]; then
  exit
fi


WHOLE_PHP_TIME=$(python $COLLECT_TIME_SCRIPT2 comma $PROF_WHOLE_PHP_TIME_LOG 2> /dev/null || echo 0) # from php
REQ_TIME=$(python $COLLECT_TIME_SCRIPT2 comma $PROF_REQ_TIME_LOG 2> /dev/null || echo 0) # from php
DB_TIME=$(python $COLLECT_TIME_SCRIPT2 comma $PROF_DB_TIME_LOG 2> /dev/null || echo 0) # from php 
PHP_TIME=$(($WHOLE_PHP_TIME - $DB_TIME))
echo "  req time: $REQ_TIME ms"
echo "  php time: $PHP_TIME ms"
echo "  db query time: $DB_TIME ms"
