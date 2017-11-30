#!/bin/bash

BRANCH_FD="/tmp/branch/"
OUTPUT_FD="/tmp/branch/output/"
SESSION_FD="/tmp/branch/session/"
UPLOAD_FD="/tmp/branch/submission/"
ND_FD="/tmp/branch/non_determ/"
DB_FILE="/tmp/sql.log"
APC_LOG="/tmp/apc.log"

USR="root"
PSWD="news123"

#TRACE_FILE="./uniq_traces.txt"
#TRACE_FILE="./zipf_urls_100_10000_0-53.txt"
#TRACE_FILE="./debug_traces.txt"
#TRACE_FILE="./zipf_urls_1000.txt"
TRACE_FILE="./zipf_urls_1000_100000_0-53.txt"

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

function init {
  clean_session

  rm $DB_FILE
  rm $APC_LOG || fail "cannot find apc.log"

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
}

# (0) init
init
cp /home/cheng/software/wiki/LocalSettings_normal.php /home/cheng/software/wiki/LocalSettings.php
sleep 1 # wait hhvmt ready

# (1) clear the cache on the server
mysql -u$USR -p$PSWD < ./clear_cache.sql


# (2) run script
python run_trace.py $TRACE_FILE
