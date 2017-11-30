#!/bin/bash

#===========================
# Assumption:
#  - this script must be invoked in this folder
#===========================

MYSQL_HACK=true

BRANCH_FD="/tmp/branch/"
OUTPUT_FD="/tmp/branch/output/"
SESSION_FD="/tmp/branch/session/"
UPLOAD_FD="/tmp/branch/submission/"
ND_FD="/tmp/branch/non_determ/"

PORT=5000
TRACE_FD="/home/cheng/orochi/tests/trace-parser/"

if [ $MYSQL_HACK == true ]; then
  DB_FILE="/tmp/sqlR.log"
else 
  DB_FILE="/tmp/sql.log"
fi
APC_FILE="/tmp/apc.log"
TRAC_FILE="/tmp/trace.log"

USR="root"
PSWD="news123"

NUM_THRD=2

#RAW_URL_FILE="./uniq_traces.txt"
#RAW_URL_FILE="./zipf_urls_100_10000_0-53.txt"
#RAW_URL_FILE="./zipf_urls_200_20000_0-53.txt"
#RAW_URL_FILE="./debug_traces.txt"
RAW_URL_FILE="./zipf_urls_1000.txt"
#RAW_URL_FILE="./zipf_urls_1000_100000_0-53.txt"

DB_MERGE_SCRIPT="/home/cheng/orochi/mysql-log/merge.py"

function usage {
  echo "workload_gen.sh"
}

function fail {
  echo "FAIL: $1"
  exit 1
}

function clean_session {
  rm /tmp/sess_*
}

function start_tracer {
  # invisible rabbit!!
  RABBIT=$(tempfile)
  # trigger sudo
  sudo touch $RABBIT
  sudo rm $RABBIT

  # run in background (not passwd needed)
  $TRACE_FD/trace_collector.sh lo $PORT $TRAC_FILE || fail "tracer start" &
  
  # check if the tracer still alive
  pid=$!
  sleep 1
  kill -0 $pid || fail "tracer not active"
}

function end_tracer {
  killall trace_collector.sh || fail "tracer end"
}

function init {
  clean_session

  rm $DB_FILE
  rm $APC_FILE
  rm $TRAC_FILE

  rm -rf $BRANCH_FD
  if [ ! -d $BRANCH_FD ]; then
    mkdir $BRANCH_FD 
  fi
  if [ ! -d $OUTPUT_FD ]; then
    mkdir $OUTPUT_FD
  fi
  if [ ! -d $SESSION_FD ]; then
    mkdir $SESSION_FD
  fi
  if [ ! -d $ND_FD ]; then
    mkdir $ND_FD
  fi
  if [ ! -d $UPLOAD_FD ]; then
    mkdir $UPLOAD_FD
  fi
  
  #atool web restart || fail "web restart"
  atool hhvm stop
  atool hhvm_record start || fail "hhvmt restart"

  # start mmysql
  if [ $MYSQL_HACK == true ]; then
    atool mmysql start
  fi

  # start the trace collector
  start_tracer
}

# (0) init
init
cp /home/cheng/software/wiki/LocalSettings_normal.php /home/cheng/software/wiki/LocalSettings.php
sleep 1 # wait hhvmt ready

# (1) clear the cache on the server
mysql -u$USR -p$PSWD < ./clear_cache.sql

# (2) run script
HHVMPID=$(pidof hhvmt)
if [ $HHVMPID == "" ]; then
  fail "Get HHVM pid failed"
fi

UTIME_START=$(cat /proc/$HHVMPID/stat | cut -d " " -f 14)
KTIME_START=$(cat /proc/$HHVMPID/stat | cut -d " " -f 15)

# run the real script
python ./multi_run_trace.py $RAW_URL_FILE $NUM_THRD

UTIME_END=$(cat /proc/$HHVMPID/stat | cut -d " " -f 14)
KTIME_END=$(cat /proc/$HHVMPID/stat | cut -d " " -f 15)

# (3) stop the tracer
python $DB_MERGE_SCRIPT
sleep 1 # wait the tracer
atool tracer stop

# (4) dump output
UTIME_TOTAL=$(($UTIME_END - $UTIME_START))
KTIME_TOTAL=$(($KTIME_END - $KTIME_START))
TIME_TOTAL=$(( ($KTIME_TOTAL + $UTIME_TOTAL) * 10))
echo "proc CPU time: $TIME_TOTAL ms"
