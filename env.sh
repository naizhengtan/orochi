#!/bin/bash
if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: environment ORO_HOME is not defined"
  exit 1
fi

function versioncheck {
  VERSION=$( lsb_release -r | cut -d: -f2 | xargs )
  if [ "$VERSION" != "14.04" ]; then
    echo "WARNING: current linux distribution has not been evaluated."
    echo "         Packages/libraries/commands might not work properly."
    echo "         Please see detailed_instructions.txt to build Orochi on your own."
    exit
  fi
}

# version check
versioncheck

#==========================================
#=======Declare Global Variables===========
#==========================================

# global executables
ORO_PROXY_BIN=openresty

NORM_HHVM_BIN=hhvm
HHVM_LOG_BIN=hhvmt
ACCPHP_BIN=hhvmm

WEB_SERVER_BIN=nginx
DBMS_BIN=mysqld
CASPERJS=casperjs

#=========System Settings=========

export DB_USER="root"
export DB_PASS="news123"

CPU_JIFFY_TIME=10

SECRET_PASS="~/.ssh/passwd"

MYSQL_GRACE_PERIOD=5 # in sec

#========Database Locations=======

MYSQL_LOG_BIN_FD="$ORO_HOME/mysql-log-bin/bin/"
MYSQL_LOG_BASE_FD="$ORO_HOME/mysql-log-bin/"

MYSQL_ORIG_BIN_FD="$ORO_HOME/mysql-vanilla-bin/bin"
MYSQL_ORIG_BASE_FD="$ORO_HOME/mysql-vanilla-bin/"

#========App information==========

# app
HOTCRP="hotcrp"
PHPBB="phpbb"
WIKI="wiki"

# server and ports 
export SERVER_LOC="127.0.0.1"
export SERVER_URL="http://$SERVER_LOC"

export WEB_HOTCRP_PORT=4000
export WEB_WIKI_PORT=5000
export WEB_PHPBB_PORT=4996

WEB_HOTCRP_PROXY_PORT=3999
WEB_WIKI_PROXY_PORT=4999
WEB_PHPBB_PROXY_PORT=4995
REPLAY_PORT=4000 # FIXME

# HotCRP
HOTCRP_DB_NAME="hotcrp"
HOTCRP_DBUSER="hotcrp_dbuser"
HOTCRP_DBPASS="123456"
export WEB_HOTCRP_PATH="$ORO_HOME/apps/hotcrp/"
export WEB_HOTCRP_URL="$SERVER_URL:$WEB_HOTCRP_PORT"
export WEB_HOTCRP_PROXY_URL="$SERVER_URL:$WEB_HOTCRP_PROXY_PORT"
HOTCRP_LIB_CRDB="$WEB_HOTCRP_PATH/lib/createdb.sh"

# wiki
export WEB_WIKI_PATH="$ORO_HOME/apps/wiki/"
export WEB_WIKI_URL="$SERVER_URL:$WEB_WIKI_PORT"
export WEB_WIKI_PROXY_URL="$SERVER_URL:$WEB_WIKI_PROXY_PORT"
export WIKI_DB_NAME="wiki_labs"
export WIKI_TTDB_NAME="wiki_labs_ttdb"

# phpBB
PHPBB_DB_NAME="phpbb"
PHPBB_DB_USER=$DB_USER
PHPBB_DB_PASS=$DB_PASS
export WEB_PHPBB_PATH="$ORO_HOME/apps/phpbb/"
export WEB_PHPBB_URL="$SERVER_URL:$WEB_PHPBB_PORT"
export WEB_PHPBB_PROXY_URL="$SERVER_URL:$WEB_PHPBB_PROXY_PORT"
PHPBB_DATABASE_FILE="$ORO_HOME/veri_tools/sqlite-in-memory/phpbb.sql"

# verification
WEB_SINGLE_URL="$SERVER_URL:$REPLAY_PORT/replay/veri/request/"
WEB_MERG_URL="$SERVER_URL:$REPLAY_PORT/replay/veri/merge/"

#========Verification information========

WORK_DATA_FD="/tmp/branch/"
WORK_ORIG_OUTPUT_FD="/tmp/branch/output/"
WORK_ORIG_PROXY_OUTPUT_FD="/tmp/branch/proxy_output/"
WORK_NON_DET_FD="/tmp/branch/non_determ/"
WORK_SESS_FD="/tmp/branch/session/"
WORK_REQ_FD="/tmp/branch/requests/"
WORK_UPLOAD_FD="/tmp/branch/submission/"

VERI_FD="/tmp/veri/"
VERI_MERG_FD="/tmp/veri/merge/"
VERI_REQ_FD="/tmp/veri/request/"
VERI_OUTPUT_FD="/tmp/veri/output/"
VERI_DIFF_FD="/tmp/veri/differ/";
VERI_SESS_FD="/tmp/veri/veri_sess/"
VERI_GEN_REQ_FD="/tmp/veri/gen_request"


#=========Profiling information=============

PROF_EXE_TIME_LOG="/tmp/normal_exe.log"
PROF_HOTCRP_RUN_TIME_LOG="/tmp/total_time"
PROF_PHP_RUN_TIME_LOG=$VERI_FD/"php_runtime.log"
#PROF_PY_RUN_TIME_LOG=$VERI_FD/"veri_runtime.log"
PROF_MULTI_TIME_LOG=$VERI_FD/"multi_runtime.log"
PROF_DB_RUN_TIME_LOG=$VERI_FD/"db_runtime.log"
PROF_MISC_LOG=$VERI_FD/"misc.log"

PROF_DB_DEDUP_TIME_LOG=$VERI_FD/"db_dedup.log"
PROF_DB_TRANS_TIME_LOG=$VERI_FD/"db_trans.log"
PROF_APC_TIME_LOG=$VERI_FD/"apc_time.log"
PROF_OPMAP_TIME_LOG=$VERI_FD/"opmap_time.log"

# fail request generated from hhvm-batch mode
PROF_FAIL_REQ_LOG=$VERI_FD/"batch_fail_req.log"
PROF_REWRITE_LOG=$VERI_FD/"sql_rewrite.log"
PROF_FAIL_LOG="/tmp/fail-php.txt"

# CPU time using clock
GET_CPU_TIME_SCRIPT="$ORO_HOME/veri_tools/utils/get_runtime.py"
PROF_HHVM_CPU_LOG="/tmp/hhvm_cpu_time.log"
PROF_HHVM_LOG_CPU_LOG="/tmp/hhvmt_cpu_time.log"
PROF_HHVM_VERI_CPU_LOG="/tmp/hhvmm_cpu_time.log"
PROF_MYSQL_ORIG_CPU_LOG="/tmp/mysql_orig_cpu_time.log"
PROF_MYSQL_LOG_CPU_LOG="/tmp/mysql_log_cpu_time.log"

# normal mode profiling logs
PROF_EXE_TIME_LOG="/tmp/normal_exe.log"
PROF_WHOLE_PHP_TIME_LOG="/tmp/normal_wphp.log"
PROF_DB_TIME_LOG="/tmp/normal_db.log"
PROF_REQ_TIME_LOG="/tmp/normal_wreq.log"

# db debug
DEBUG_DB_LOG="/tmp/db-debug.log"

#==========Verification hints============

HINT_APC_RAW_LOG="/tmp/apc.log"
HINT_TRAC_SEQ_LOG="/tmp/trace_seq.log"
HINT_SESS_LOG="/tmp/sess.log"
HINT_MAX_OP="/tmp/maxop.log"
HINT_DB_RAW_LOG="/tmp/sql.log"
HINT_CF_LOG="/tmp/cf_tags.log"
OPMAP_MEM="/tmp/opmap.mem"
#APC_TT_LOG="/tmp/tt_apc.log"
#APC_TS_MAPPING="/tmp/apc_ts.log"
#TRAC_RAW_LOG="/tmp/trace.log"

#========Util Scripts===============

DB_MERGE_SCRIPT="$ORO_HOME/veri_tools/utils/stitch_sql_log.py"
POH_PROGM="$ORO_HOME/veri_tools/process_hint/hintprocess"
OUTPUT_DIFF_PROGRM="$ORO_HOME/veri_tools/odiff/odiff"

#====================================
#=========Global Functions===========
#====================================

#========Util Functions==============

function fail {
  echo "FATAL ERROR: during $1"
  exit 1
}


function sudo_invisible_rabbit {
  # invisible rabbit!!
  RABBIT=$(tempfile)
  # trigger sudo
  if [ "$SECRET_PASS" == "" ]; then
    echo "No SECRET_PASS file, please input the passwd for invisible rabbit."
    echo "If you don't want invisible rabbit, you can skip this."
    echo "However, you have to input passwd whenever needed sudo (e.g. rm database log)"
    sudo touch $RABBIT && sudo rm $RABBIT
  else 
    echo "SECRET_PASS file enabled, automatically start sudo"
    cat $SECRET_PASS | sudo -S touch $RABBIT && sudo rm $RABBIT 
  fi
}

#========Clear Functions=============

function clear_logging_fd {
  rm -rf $WORK_DATA_FD
  mkdir $WORK_DATA_FD                &&
  mkdir $WORK_ORIG_OUTPUT_FD         &&
  mkdir $WORK_ORIG_PROXY_OUTPUT_FD   &&
  mkdir $WORK_NON_DET_FD             &&
  mkdir $WORK_SESS_FD                &&
  mkdir $WORK_REQ_FD                 &&
  mkdir $WORK_UPLOAD_FD   || fail "clear logging fd"
}

function clear_prof_logs {
  rm -f $PROF_HOTCRP_RUN_TIME_LOG
  rm -f $PROF_DB_RUN_TIME_LOG
  rm -f $PROF_FAIL_REQ_LOG
  rm -f $VERI_FD/*.log

  rm -f $PROF_DB_DEDUP_TIME_LOG
  rm -f $PROF_DB_TRANS_TIME_LOG
  rm -f $PROF_APC_TIME_LOG
  rm -f $PROF_OPMAP_TIME_LOG
}

function clear_veri_fd {
  rm -rf $VERI_FD
  mkdir $VERI_FD           &&
  mkdir -p $VERI_MERG_FD   &&
  mkdir -p $VERI_REQ_FD    &&
  mkdir -p $VERI_DIFF_FD   &&
  mkdir -p $VERI_OUTPUT_FD &&
  mkdir -p $VERI_SESS_FD   &&
  mkdir -p $VERI_GEN_REQ_FD  || fail "clear verification fd"
}

function clear_tmp_files {
  # clear the random files beneath /tmp/
  rm -f /tmp/sess_*
  rm -f /tmp/hotcrptmp.*
  rm -f /tmp/hotcrp-.*
  rm -f /tmp/perf-* 
  rm -f /tmp/stacktrace*
  rm -f /tmp/hoho*.png 
}

function clear_oro_hints {
  rm -f $HINT_APC_RAW_LOG
  rm -f $HINT_TRAC_SEQ_LOG
  rm -f $HINT_SESS_LOG
  rm -f $HINT_MAX_OP
  rm -f $HINT_CF_LOG
  rm -f $OPMAP_MEM
  # in case some apps do not generate
  touch $HINT_APC_RAW_LOG
  touch $HINT_SESS_LOG
  # need sudo
  echo "Need sudo to remove file $HINT_DB_RAW_LOG"
  sudo rm -f $HINT_DB_RAW_LOG
}

function clear_normal_profiling {
  echo "[INFO] will use sudo to rm the old $PROF_EXE_TIME_LOG, $PROF_DB_TIME_LOG"
  sudo rm -f $PROF_EXE_TIME_LOG  
  sudo rm -f $PROF_DB_TIME_LOG   
  rm -f $PROF_WHOLE_PHP_TIME_LOG 
  rm -f $PROF_REQ_TIME_LOG       
}

function clear_clock_logs {
  # clear all the cpu files
  # NOTE: must rm after all the daemons are ready!!!
  rm -f $PROF_HHVM_CPU_LOG
  rm -f $PROF_HHVM_LOG_CPU_LOG
  rm -f $PROF_HHVM_VERI_CPU_LOG
  sudo rm -f $PROF_MYSQL_ORIG_CPU_LOG
  sudo rm -f $PROF_MYSQL_LOG_CPU_LOG
}

#=========Proxy====================

PROXY_FD="$ORO_HOME/veri_tools/openresty/"

function start_loggin_proxy {
  # run in background (no passwd needed)
  $PROXY_FD/clear_and_run.sh logging || fail "start logging proxy"
}

function start_normal_proxy {
  # run in background (no passwd needed)
  $PROXY_FD/clear_and_run.sh normal  || fail "start normal proxy"
}

function stop_proxy {
  killall $ORO_PROXY_BIN 2>/dev/null
}

#=========CPU TIME===================
HHVMPID=""
NGINXPID_ARR=""
MYSQLPID=""

# shouldn't have any output
function get_hhvm_pid {
  RET=$(pidof $NORM_HHVM_BIN)
  if [ "$RET" == "" ]; then
    # fail "Get HHVM pid failed"
    echo "ERROR"
  else 
    echo $RET
  fi
}

# shouldn't have any output
function get_hhvm_log_pid {
  RET=$(pidof $HHVM_LOG_BIN)
  if [ "$RET" == "" ]; then
    # fail "Get HHVM-log pid failed"
    echo "ERROR"
  else
    echo $RET
  fi
}

# shouldn't have any output
function get_hhvmm_pid {
  RET=$(pidof $ACCPHP_BIN)
  if [ "$RET" == "" ]; then
    # fail "Get HHVM-verify pid failed"
    echo "ERROR"
  else
    echo $RET
  fi
}

# shouldn't have any output
function get_nginx_pid_arr {
  PID_ARR=$(pidof $WEB_SERVER_BIN)
  if [ "$PID_ARR" == "" ]; then
    # fail "Get NGINX pid failed"
    echo "ERROR"
  else
    echo $PID_ARR
  fi
}

# shouldn't have any output
function get_mysql_pid {
  RET=$(pidof $DBMS_BIN)
  if [ "$RET" == "" ]; then
    # fail "Get mysql pid failed"
    echo "ERROR"
  else
    echo $RET
  fi
}

# shouldn't have any output
function get_hhvm_cpu {
  if [ $1 == "utime" ]; then
    cat /proc/$HHVMPID/stat | cut -d " " -f 14 || fail "get utime from hhvm"
  elif [ $1 == "ktime" ]; then
    cat /proc/$HHVMPID/stat | cut -d " " -f 15 || fail "get ktime from hhvm"
  else
    echo 0
  fi
}

function get_nginx_cpu {
  RET=0
  for i in "${NGINXPID_ARR[@]}"
  do
    if [ $1 == "utime" ]; then
      TMP_TIME=$(cat /proc/$i/stat | cut -d " " -f 14)
    elif [ $1 == "ktime" ]; then
      TMP_TIME=$(cat /proc/$i/stat | cut -d " " -f 15)
    else
      fail "wrong paramter: $1" 
    fi
    RET=$(($RET+$TMP_TIME))
  done

  echo $RET
}

function get_mysql_cpu {
  if [ $1 == "utime" ]; then
    cat /proc/$MYSQLPID/stat | cut -d " " -f 14 || fail "get utime from mysql"
  elif [ $1 == "ktime" ]; then
    cat /proc/$MYSQLPID/stat | cut -d " " -f 15 || fail "get ktime from mysql"
  else
    echo 0
  fi
}

function get_cur_cpu_time {
  SOFTWARE=$1

  if [ "$SOFTWARE" == "hhvm" ]; then
    HHVM_UTIME=$(get_hhvm_cpu "utime")
    HHVM_KTIME=$(get_hhvm_cpu "ktime")
    HHVM_CPU_TIME=$(( ($HHVM_KTIME + $HHVM_UTIME) * $CPU_JIFFY_TIME))
    echo $HHVM_CPU_TIME
  fi

  if [ "$SOFTWARE" == "nginx" ]; then
    NGINX_UTIME=$(get_nginx_cpu "utime")
    NGINX_KTIME=$(get_nginx_cpu "ktime")
    NGINX_CPU_TIME=$(( ($NGINX_KTIME + $NGINX_UTIME) * $CPU_JIFFY_TIME))
    echo $NGINX_CPU_TIME
  fi

  if [ "$SOFTWARE" == "mysql" ]; then
    MYSQL_UTIME=$(get_mysql_cpu "utime")
    MYSQL_KTIME=$(get_mysql_cpu "ktime")
    MYSQL_CPU_TIME=$(( ($MYSQL_KTIME + $MYSQL_UTIME) * $CPU_JIFFY_TIME))
    echo $MYSQL_CPU_TIME
  fi
}

# get_cpu_cost (start_time_arr, end_time_arr, [hhvm|nginx|mysql|all])
function get_cpu_cost {
  START_TIME_ARR=$1
  END_TIME_ARR=$2
  PIECE=$3

  CPU_TIME_TOTAL=0

  if [ "$PIECE" == "all" ]; then
    for i in $(seq 0 2) 
    do
      START_TIME=${START_TIME_ARR[$i]}
      END_TIME=${END_TIME_ARR[$i]}
      CPU_TIME=$(( $END_TIME - $START_TIME ))
      CPU_TIME_TOTAL=$(( $CPU_TIME_TOTAL + $CPU_TIME ))
    done
  fi

  if [ "$PIECE" == "hhvm" ]; then
    START_TIME=${START_TIME_ARR[0]}
    END_TIME=${END_TIME_ARR[0]}
    CPU_TIME_TOTAL=$(( $END_TIME - $START_TIME ))
  fi
  if [ "$PIECE" == "nginx" ]; then
    START_TIME=${START_TIME_ARR[1]}
    END_TIME=${END_TIME_ARR[1]}
    CPU_TIME_TOTAL=$(( $END_TIME - $START_TIME ))
  fi
  if [ "$PIECE" == "mysql" ]; then
    START_TIME=${START_TIME_ARR[2]}
    END_TIME=${END_TIME_ARR[2]}
    CPU_TIME_TOTAL=$(( $END_TIME - $START_TIME ))
  fi
  
  echo $CPU_TIME_TOTAL
}

#====================================
# prepare atool helper functions
#====================================
export LD_ENV_VARS=true
source "$ORO_HOME/veri_tools/utils/atool.sh"
