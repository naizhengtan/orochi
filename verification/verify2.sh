#!/bin/bash

# TODO
# - implicit timing files

# -----------------
# profiling time
# -----------------
# init
# db rebuild       => BUILD_TTDB_START/BUILD_TTDB_END
# copy reqs
# merge scripts    => MERGE_REQ_START/MERGE_REQ_END
# Verification     => VERI_START/VERI_END
#   AccPHP           => ACCPHP_VERI_START/ACCPHP_VERI_END
#   diff             => DIFF_VERI_START/DIFF_VERI_END
#   rerun            => RERUN_VERI_START/RERUN_VERI_END
# ---------
# PHP_TIME       : from AccPHP
# DB_QUERY_TIME  : from record_lib
# MULTI_TIME     : from AccPHP
# ---------

source "veri_comm.sh"

#=========================================
#========Config Variables=================
#=========================================

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# whether rerun the failed CFG
RERUN_FAIL=true

SKIP_VALIDATION=false
STATE_CONTENT_CHECK=true

#=========================================
#=======Helper Functions==================
#=========================================

function usage {
  echo "Usage: verify.sh -m [single|batch-hhvm|batch-web] [-c] [-d] [-s] <hotcrp|phpbb|wiki>"
  echo "          -m: choose a mode from [single|batch-hhvm|batch-web]" 
  echo "          -c: skip the copy and merge stage"
  echo "          -d: skip the database rebuild stage"
  echo "          -s: sudo profiling (using nginx)"
}

function init {
  echo "[start init]"
  if [ $SUDO_PROFILING == true ]; then
    # invisible rabbit!!
    RABBIT=$(tempfile)
    # trigger sudo
    cat $SECRET_PASS 2>/dev/null | sudo -S touch $RABBIT
    sudo rm $RABBIT

    sudo rm $PROF_EXE_TIME_LOG
  fi

  if [ $COPY_MERGE_REQ == true ]; then
    echo "[remove old requests and merge files]"
    clear_veri_fd
    echo "[done removing]"
  fi

  # clear code cache
  #rm /home/cheng/.hhvm.hhbc 2>/dev/null

  # remove profiling files
  clear_prof_logs

  # remove tmp logs
  clear_tmp_files

  echo "[finish init]"

  # make sure nginx regenerate the $PROF_EXE_TIME_LOG log
  # $PROF_EXE_TIME_LOG location is defined in veri_comm.sh and nginx config
  atool_web_restart || fail "web restart"

  # restart mysql
  echo "[INFO] restart omysql"
  atool_omysql_restart || fail "omysql restart"
  sleep 2 
  DB_ALIVE=$( atool_omysql_alive )
  if [ "$DB_ALIVE" != "0" ]; then
    fail "omysql is not alive"
  fi
}

function init_hhvm_oro {
  # hhvmm
  atool_hhvm_stop
  atool_hhvm_orochi_start || fail "hhvm orochi start"
}

function copy_request_files {
  APP=$1
  # why separate? easy to roll back to original method
  if [ "$APP" == "$HOTCRP" ]; then
    $NORM_HHVM_BIN $WORK_CPY_FILES $VERI_GEN_REQ_FD $VERI_REQ_FD || fail "copy $WORK_DATA_FD to $VERI_REQ_FD"
  elif [ "$APP" == "$PHPBB" ]; then
    $NORM_HHVM_BIN $WORK_CPY_FILES $VERI_GEN_REQ_FD $VERI_REQ_FD || fail "copy $WORK_DATA_FD to $VERI_REQ_FD"
  elif [ "$APP" == "$WIKI" ]; then
    $NORM_HHVM_BIN $WORK_CPY_FILES $VERI_GEN_REQ_FD $VERI_REQ_FD || fail "copy $WORK_DATA_FD to $VERI_REQ_FD"
  fi
}

function merge_request_files {
  APP=$1
  if [ $VERI_MODE == "batch-hhvm" ] || [ $VERI_MODE == "batch-web" ]; then
    echo "Start merge files"

    if [ "$APP" == "$HOTCRP" ]; then
      nodejs $MERGE_SCRIPT $VERI_GEN_REQ_FD >> $PROF_MISC_LOG || fail "merge file"
    elif [ "$APP" == "$PHPBB" ]; then
      nodejs $MERGE_SCRIPT $VERI_GEN_REQ_FD >> $PROF_MISC_LOG || fail "merge file"
    elif [ "$APP" == "$WIKI" ]; then
      nodejs $MERGE_SCRIPT $VERI_GEN_REQ_FD >> $PROF_MISC_LOG || fail "merge file"
      #nodejs $MERGE_SCRIPT $WORK_DATA_FD >> $PROF_MISC_LOG || fail "merge file"
    else
      fail "doesn't support $APP"
    fi

    echo "DONE merge file"
  fi
}

#=======================================
#========Main Logic=====================
#=======================================

# VERI_MODE={single, batch-hhvm, batch-web}
VERI_MODE="batch-web"
COPY_MERGE_REQ=true
DO_DB_REBUILD=true
SUDO_PROFILING=true

OPTIND=1         # Reset in case getopts has been used previously in the shell.

while getopts "hm:cds" opt; do
  case "$opt" in
    h|\?)
      usage
      exit 0
      ;;
    m)
      VERI_MODE=$OPTARG
      if [ "$VERI_MODE" != "single" ] && [ "$VERI_MODE" != "batch-hhvm" ] && [ "$VERI_MODE" != "batch-web" ]; then
        echo "mode $VERI_MODE is unknown"
        exit 1
      fi
      ;;
    c)
      COPY_MERGE_REQ=false
      ;;
    d)
      DO_DB_REBUILD=false
      ;;
    s)
      SUDO_PROFILING=true
      ;;
  esac
done

shift $((OPTIND - 1))

# should only variable app left
if [ $# != 1 ]; then
  echo "Don't understand: $@"
  usage
  exit 0
fi

APP=$@
if [ "$APP" != "hotcrp" ] && [ "$APP" != "phpbb" ] && [ "$APP" != "wiki" ]; then
  echo "app $APP is unknown"
  exit 1
fi

# (0): init 
init

# init global variables
BUILD_TTDB_START=0
BUILD_TTDB_END=0
MERGE_REQ_START=0
MERGE_REQ_END=0
VERI_START=0
VERI_END=0
ACCPHP_VERI_START=0
ACCPHP_VERI_END=0
DIFF_VERI_START=0
DIFF_VERI_END=0
RERUN_VERI_START=0
RERUN_VERI_END=0
PROCESS_OP_HINTS_START=0
PROCESS_OP_HINTS_END=0
NON_DET_START=0
NON_DET_END=0
SESSION_CHECK_START=0
SESSION_CHECK_END=0
SQL_CHECK_START=0
SQL_CHECK_END=0
REQ_GEN_START=0
REQ_GEN_END=0


# (1) ProcessOpHints
echo "[INFO] start ProcessOpHints"
PROCESS_OP_HINTS_START=$( date +%s%N )
if [ $SKIP_VALIDATION == "true" ]; then
  LD_PRELOAD="/usr/lib/libtcmalloc.so" $POH_PROGM $HINT_TRAC_SEQ_LOG $HINT_SESS_LOG $HINT_APC_RAW_LOG $HINT_DB_RAW_LOG $HINT_MAX_OP $OPMAP_MEM >> $PROF_MISC_LOG || echo "order validation FAIL!!"
else
  LD_PRELOAD="/usr/lib/libtcmalloc.so" $POH_PROGM $HINT_TRAC_SEQ_LOG $HINT_SESS_LOG $HINT_APC_RAW_LOG $HINT_DB_RAW_LOG $HINT_MAX_OP $OPMAP_MEM >> $PROF_MISC_LOG || fail "order validation"
fi
PROCESS_OP_HINTS_END=$( date +%s%N )

# (2) check whether skip the preparations
if [ $DO_DB_REBUILD == true ]; then

  echo "[INFO] start to TTdb.build"
  # (2.1) create time-travel database
  if [ $APP == $HOTCRP ]; then
    hotcrp_ttdb_clear_and_create
    remake_sqlite $HOTCRP
  
    prepare_ttdb_rebuild $DB_TT_HOTCRP_NAME $HOTCRP
    BUILD_TTDB_START=$( date +%s%N )
    inmem_ttdb_rebuild $DB_TT_HOTCRP_NAME $HOTCRP
    BUILD_TTDB_END=$( date +%s%N )

  elif [ "$APP" == $PHPBB ]; then
    remake_sqlite $PHPBB

    prepare_ttdb_rebuild $DB_TT_PHPBB_NAME $PHPBB
    BUILD_TTDB_START=$( date +%s%N )
    inmem_ttdb_rebuild $DB_TT_PHPBB_NAME $PHPBB
    BUILD_TTDB_END=$( date +%s%N )

  elif [ "$APP" == $WIKI ]; then
    # change the database
    cp $WEB_WIKI_PATH/LocalSettings_ttdb.php $WEB_WIKI_PATH/LocalSettings.php || fail "covering local setting"
    # clear the cache tables in tt_wiki_db
    wiki_ttdb_clear
    remake_sqlite $WIKI

    prepare_ttdb_rebuild $DB_TT_WIKI_NAME $WIKI
    BUILD_TTDB_START=$( date +%s%N )
    inmem_ttdb_rebuild $DB_TT_WIKI_NAME $WIKI
    BUILD_TTDB_END=$( date +%s%N )

  else
    fail "$APP doesn't exist"
  fi

  echo "[INFO] finish TTdb.build"
fi # end of $DO_DB_REBUILD


# (3) generate requests from trace
REQ_GEN_START=$( date +%s%N )
trace_input_gen $APP
REQ_GEN_END=$( date +%s%N )


# (4) copy the request out to VERI_REQ_FD
if [ $COPY_MERGE_REQ == true ]; then
  echo "[INFO] copy requests"
  copy_request_files $APP

  # (4): merge the scripts
  echo "[INFO] start merge reqs"
  MERGE_REQ_START=$( date +%s%N )
  merge_request_files $APP
  MERGE_REQ_END=$( date +%s%N )
fi

# (5) nondeterminism checking
echo "[INFO] Nondeterminism sanity checking"
NON_DET_START=$( date +%s%N )
check_nondet
NON_DET_END=$( date +%s%N )

# revoke the insert/update/delete privilege from $HOTCRP_DBUSER
#if [ $APP == $HOTCRP ]; then
#    echo "revoke insert,update,delete on $DB_HOTCRP_NAME.* from '$HOTCRP_DBUSER'@'localhost'" | mysql -u$DB_USR -p$DB_PASSWD $DB_HOTCRP_NAME || fail "revoke write privilege"
#fi

# (6) call by batch-engine
# since hhvm is reset by trace input test
if [ $VERI_MODE == "batch-web" ]; then
  init_hhvm_oro
fi

# change database to read-only mode
echo "[INFO] restart omysql to RO!!!!"
atool_omysql_stop
sleep 2 
atool_omysql_ro_start || fail "omysql ro start"
sleep 2 
DB_ALIVE=$( atool_omysql_alive )
if [ "$DB_ALIVE" != "0" ]; then
  fail "omysql RO is not alive"
fi

# collect CPU time for HHVM, Nginx, MySQL
# clear all the cpu files
# NOTE: must rm after all the daemons are ready!!!
clear_clock_logs

# NOTE: here we use get_hhvm*m*_pid
HHVMPID=$(get_hhvmm_pid)
if [ "$HHVMPID" == "" ]; then
  fail "Get HHVM pid failed"
fi

NGINXPID_ARR=($(get_nginx_pid_arr))
if [ "$NGINXPID_ARR" == "" ]; then
  fail "Get NGINX pid failed"
fi

MYSQLPID=$(get_mysql_pid)
if [ "$MYSQLPID" == "" ]; then
  fail "Get MySQL pid failed"
fi

echo "PIDs: HHVM $HHVMPID, Nginx: $NGINXPID_ARR, MySQL: $MYSQLPID"

HHVM_VERI_CPU_START=$(get_cur_cpu_time "hhvm")
NGINX_VERI_CPU_START=$(get_cur_cpu_time "nginx")
MYSQL_VERI_CPU_START=$(get_cur_cpu_time "mysql")

# (7) start verifying the requests 
VERI_START=$( date +%s%N )

ACCPHP_VERI_START=$( date +%s%N )
if [ $VERI_MODE == "batch-hhvm" ]; then
  NUM_REQ=$( ls $VERI_MERG_FD/m*.php | wc -l )
  # clear the failed batch log from previous run 
  rm $PROF_FAIL_LOG
  (
  RUN_FAIL_COUNTER=0
  RUN_COUNTER=0
  cd $VERI_MERG_FD || fail "cd merge folder"
  for php in $( ls *.php ); do
    $ACCPHP_BIN -m v -vEval.Jit=0 -c $HHVM_CONF $php > /dev/null && echo "pass $php"
    if [ $? != 0 ]; then
      echo "fail on running $php"
      let "RUN_FAIL_COUNTER=$RUN_FAIL_COUNTER+1"
      echo "$php" >> $PROF_FAIL_LOG 
    fi
    let "RUN_COUNTER=$RUN_COUNTER+1"
  done
  echo "Fail Run: $RUN_FAIL_COUNTER/$RUN_COUNTER"
  )
elif [ $VERI_MODE == "batch-web" ]; then
  NUM_REQ=$( ls $VERI_MERG_FD/m*.php | wc -l )
  python $SCRIPT_DIR/funcs/run_verify.py m $WEB_MERG_URL 0 $NUM_REQ
elif [ $VERI_MODE == "single" ]; then
  NUM_REQ=$( ls $VERI_REQ_FD/r*.php | wc -l )
  python $SCRIPT_DIR/funcsrun_verify.py r $WEB_SINGLE_URL 0 $NUM_REQ
  #(
  #RUN_FAIL_COUNTER=0
  #RUN_COUNTER=0
  #cd $VERI_REQ_FD || fail "cd merge folder"
  #for php in $( ls *.php ); do
  #  hhvmm -m v -vEval.Jit=0 $php > /dev/null && echo "pass $php" 
  #  if [ $? != 0 ]; then
  #    echo "fail on running $php"
  #    let "RUN_FAIL_COUNTER=$RUN_FAIL_COUNTER+1"
  #    echo "$php" >> $PROF_FAIL_LOG 
  #  fi
  #  let "RUN_COUNTER=$RUN_COUNTER+1"
  #done
  #echo "Fail Run: $RUN_FAIL_COUNTER/$RUN_COUNTER"
  #)
fi

ACCPHP_VERI_END=$( date +%s%N )

# (8) verify the result
#  There can be difference, log them down
FAIL_COUNTER=0
TOTAL_COUNTER=0
echo "Start to compare the output..."

sleep 1
# Naive diff, for comparison
NAV_DIFF_START=$( date +%s%N )
$OUTPUT_DIFF_PROGRM single $WORK_ORIG_PROXY_OUTPUT_FD $WORK_ORIG_PROXY_OUTPUT_FD
NAV_DIFF_END=$( date +%s%N )

# Batch diff
DIFF_VERI_START=$( date +%s%N )
if [ $VERI_MODE == "single" ]; then
  $OUTPUT_DIFF_PROGRM single $VERI_OUTPUT_FD $WORK_ORIG_PROXY_OUTPUT_FD || fail "fail on single comparing the output"
else
  $OUTPUT_DIFF_PROGRM batch $VERI_OUTPUT_FD $WORK_ORIG_PROXY_OUTPUT_FD || fail "fail on batch comparing the output"
fi
DIFF_VERI_END=$( date +%s%N )


# (9) re-run by naive replay
# rerun time is included in cpu time
RERUN_VERI_START=$( date +%s%N )
if [ $VERI_MODE == "batch-web" ] && [ $RERUN_FAIL == true ]; then
  $NORM_HHVM_BIN $RERUN_ANALYZE
  echo "====Start to run failed request=====" >> $PROF_MISC_LOG
  python $RERUN_SCRIPT $WEB_SINGLE_URL $PROF_FAIL_REQ_LOG
fi
RERUN_VERI_END=$( date +%s%N )

echo "PIDs: HHVM $HHVMPID, Nginx: $NGINXPID_ARR, MySQL: $MYSQLPID"

HHVM_VERI_CPU_END=$(get_cur_cpu_time "hhvm")
NGINX_VERI_CPU_END=$(get_cur_cpu_time "nginx")
MYSQL_VERI_CPU_END=$(get_cur_cpu_time "mysql")

# (10) check session and db

if [ $STATE_CONTENT_CHECK == true ]; then
  SESSION_CHECK_START=$( date +%s%N )
  check_session
  SESSION_CHECK_END=$( date +%s%N )
  #echo "PASS session check"

  SQL_CHECK_START=$( date +%s%N )
  check_sql
  SQL_CHECK_END=$( date +%s%N )
  #echo "PASS SQL check"
fi

VERI_END=$( date +%s%N )
echo "===========ALL PASS==============";

# (11) collect php running time
PHP_TIME=$(python $COLLECT_TIME_SCRIPT $PROF_PHP_RUN_TIME_LOG 2> /dev/null || echo 0) # from AccPHP
DB_QUERY_TIME=$(python $COLLECT_TIME_SCRIPT $PROF_DB_RUN_TIME_LOG 2> /dev/null || echo 0)   # from record_lib
#PY_TIME=$(python $COLLECT_TIME_SCRIPT $PROF_PY_RUN_TIME_LOG 2> /dev/null || echo 0)  # from run_verify.py
MULTI_TIME=$(python $COLLECT_TIME_SCRIPT $PROF_MULTI_TIME_LOG 2> /dev/null || echo 0) # from AccPHP

DB_DEDUP_TIME=$(python $COLLECT_TIME_SCRIPT $PROF_DB_DEDUP_TIME_LOG 2> /dev/null || echo 0) # from AccPHP
DB_TRANS_TIME=$(python $COLLECT_TIME_SCRIPT $PROF_DB_TRANS_TIME_LOG 2> /dev/null || echo 0) # from AccPHP
APC_TIME=$(python $COLLECT_TIME_SCRIPT $PROF_APC_TIME_LOG 2> /dev/null || echo 0) # from AccPHP
OPMAP_TIME=$(python $COLLECT_TIME_SCRIPT $PROF_OPMAP_TIME_LOG 2> /dev/null || echo 0) # from AccPHP

# how many orig requests
ORIG_NUM_REQ=$(ls $VERI_REQ_FD | wc -w)

let "TTDB=($BUILD_TTDB_END - $BUILD_TTDB_START)/1000000"
let "VERI=($VERI_END - $VERI_START)/1000000"
let "ACCPHP=($ACCPHP_VERI_END - $ACCPHP_VERI_START)/1000000"
let "DIFF=($DIFF_VERI_END - $DIFF_VERI_START)/1000000"
let "RERUN=($RERUN_VERI_END - $RERUN_VERI_START)/1000000"
let "MERGE=($MERGE_REQ_END - $MERGE_REQ_START)/1000000"
let "PROCHINTS=($PROCESS_OP_HINTS_END - $PROCESS_OP_HINTS_START)/1000000"
let "NONDET=($NON_DET_END - $NON_DET_START)/1000000"
let "SESS_CHECK=($SESSION_CHECK_END - $SESSION_CHECK_START)/1000000"
let "SQL_CHECK=($SQL_CHECK_END - $SQL_CHECK_START)/1000000"
let "REQ_GEN=($REQ_GEN_END - $REQ_GEN_START)/1000000"
let "NAVDIFF_TIME=($NAV_DIFF_END - $NAV_DIFF_START) / 1000000"

echo "Number of orig requests: $ORIG_NUM_REQ"
echo "Number of requests: $NUM_REQ"
echo "Request generate time: $REQ_GEN ms"
echo "Merge req time: $MERGE ms"
echo "ProcessOpHints time: $PROCHINTS ms"
echo "TTdb rebuilt: $TTDB ms"
echo "Verify time: $VERI ms"
echo "  AccPHP time: $ACCPHP ms"
echo "  Diff time: $DIFF ms"
echo "  Nondet time: $NONDET ms"
echo "  RERUN time: $RERUN ms"
echo "  Sess_check time: $SESS_CHECK ms"
echo "  Sql_check time: $SQL_CHECK ms"
echo "PHP time: $PHP_TIME ms"
echo "Multi-ins time: $MULTI_TIME ms"
echo "DB query time: $DB_QUERY_TIME ms"
echo "naive diff time: $NAVDIFF_TIME ms"
#echo "PYTHON time: $PY_TIME ms"
echo ""
echo "db dedup: $DB_DEDUP_TIME ms"
echo "db trans: $DB_TRANS_TIME ms"
echo "apc time: $APC_TIME ms"
echo "opmap time: $OPMAP_TIME ms"

EXE_TIME=$(python $COLLECT_TIME_SCRIPT2 newline $PROF_EXE_TIME_LOG 2> /dev/null || echo 0) # from Nginx
echo "execution time: $EXE_TIME ms"

# the cpu time from clock()
CLOCK_HHVM_CPU_TIME_TOTAL=$($GET_CPU_TIME_SCRIPT $PROF_HHVM_VERI_CPU_LOG)
CLOCK_MYSQL_CPU_TIME_TOTAL=$($GET_CPU_TIME_SCRIPT $PROF_MYSQL_ORIG_CPU_LOG)
CLOCK_CPU_TIME_TOTAL=$(( $CLOCK_HHVM_CPU_TIME_TOTAL + $NGINX_CPU_TIME_TOTAL + $CLOCK_MYSQL_CPU_TIME_TOTAL ))
echo "clock CPU time: $CLOCK_CPU_TIME_TOTAL ms"
echo "  clock hhvm CPU time: $CLOCK_HHVM_CPU_TIME_TOTAL ms"
echo "  clock mysql CPU time: $CLOCK_MYSQL_CPU_TIME_TOTAL ms"


if [ $VERI_MODE == "single" ] || [ $VERI_MODE == "batch-web" ]; then
  HHVM_CPU_TIME_TOTAL=$(( $HHVM_VERI_CPU_END - $HHVM_VERI_CPU_START ))
  NGINX_CPU_TIME_TOTAL=$(( $NGINX_VERI_CPU_END - $NGINX_VERI_CPU_START ))
  MYSQL_CPU_TIME_TOTAL=$(( $MYSQL_VERI_CPU_END - $MYSQL_VERI_CPU_START ))
  CPU_TIME_TOTAL=$(( $HHVM_CPU_TIME_TOTAL + $NGINX_CPU_TIME_TOTAL + $MYSQL_CPU_TIME_TOTAL ))
  
  echo "proc CPU time: $CPU_TIME_TOTAL ms"
  echo "  proc hhvm CPU time: $HHVM_CPU_TIME_TOTAL ms"
  echo "  proc nginx CPU time: $NGINX_CPU_TIME_TOTAL ms"
  echo "  proc mysql CPU time: $MYSQL_CPU_TIME_TOTAL ms"
fi

# (9) misc info here
echo "==========misc info collection===========" >> $PROF_MISC_LOG
# print "Number of NSG:"
$NORM_HHVM_BIN $NSG_SCRIPT $WORK_DATA_FD 2>> $PROF_MISC_LOG
# print "Number of unique url:"
$NORM_HHVM_BIN $UURL_SCRIPT $VERI_REQ_FD 2>> $PROF_MISC_LOG
