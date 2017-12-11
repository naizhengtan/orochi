#!/bin/bash
if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: environemnt variable ORO_HOME is empty"
  exit 1
fi

source $ORO_HOME/env.sh
DEBUG_PRINT="true"

#=========helper functions================

function dprint {
  if [ $DEBUG_PRINT == "true" ]; then
    echo "[INFO]: $1"
  fi
}

function usage {
  echo "start_online_server.sh [orochi|legacy]"
  echo "   orochi : hhvm-record  + proxy-logging. This is default."
  echo "   legacy : hhvm-vanilla + proxy-normal"
}


# main
if [ $# == 1 ]; then
  TASK=$1
elif [ $# == 0 ]; then
  TASK="orochi"
else
  usage
  exit 1
fi

if [ "$TASK" != "legacy" ] && [ "$TASK" != "orochi" ]; then
  usage
  exit 1
fi

# clear 
sudo_invisible_rabbit

clear_logging_fd
clear_oro_hints
clear_normal_profiling
clear_tmp_files

# regenerate the $PROF_EXE_TIME_LOG
atool_web_restart || fail "web restart stop"

atool_hhvm_stop # will try to stop all, may return fail 
if [ "$TASK" == "legacy" ]; then
  dprint "Normal profiling, start normal hhvm"
  atool_hhvm_start || fail "hhvm start"
else 
  dprint "start hhvm record"
  atool_hhvm_record_start || fail "hhvmt restart"
fi

# start the trace collector
if [ "$TASK" == "legacy" ]; then
  start_normal_proxy
else 
  start_loggin_proxy 
fi

# mmysql
atool_mmysql_stop
if [ "$TASK" == "legacy" ]; then
  dprint "start original-mysql"
  atool_omysql_default_start || fail "start omysql"
else
  dprint "start logging-mysql"
  atool_mmysql_start || fail "start mmysql"
fi

# clear all the cpu files
# NOTE: must rm after all the daemons are ready!!!
clear_clock_logs
