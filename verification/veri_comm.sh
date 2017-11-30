#!/bin/sh
if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: environment ORO_HOME is not defined"
  exit 1
fi

source $ORO_HOME/env.sh

# verification information (output): VERI_
# workload information (input): WORK_
# profiling information: PROF_
# web server related: WEB_
# database related: DB_
# APC related: APC_
# trace realted: TRAC_

COMM_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#========Check Scripts==============

WORK_NON_CHECK_SCRIPT="$ORO_HOME/veri_tools/odiff/nondet_check/check_nondet.php"
WORK_SESS_CHECK_SCRIPT="$ORO_HOME/veri_tools/odiff/sess_check/check_session.php"
WORK_SQL_CHECK_SCRIPT="$ORO_HOME/veri_tools/odiff/sql_check/check_sql.php" 
WORK_CPY_FILES="$COMM_DIR/scripts/cp_rid_php.php"

#========DB information===============

DB_HOTCRP_NAME=hotcrp
DB_TT_HOTCRP_NAME=hotcrp
DB_PHPBB_NAME=phpbb
DB_TT_PHPBB_NAME=phpbb
DB_WIKI_NAME=wiki_labs
DB_TT_WIKI_NAME=wiki_labs_ttdb

DB_VERI_LOG=$VERI_FD/"sql-verify-1.log"
DB_VERI_LOG2=$VERI_FD/"sql-verify-2.log"
DB_TABLE_UPDATE_LOG="/tmp/table_update.log"

SQLITE_FD="$ORO_HOME/veri_tools/sqlite-in-memory/"
SQLITE_CONFIG="$SQLITE_FD/config.txt"
SQLITE_HOTCRP_INIT_SQL="$SQLITE_FD/hotcrp.sql"
SQLITE_HOTCRP_TT_INIT_SQL="$SQLITE_FD/tt_hotcrp.sql"
SQLITE_PHPBB_INIT_SQL="$SQLITE_FD/phpbb.sql"
SQLITE_PHPBB_TT_INIT_SQL="$SQLITE_FD/tt_phpbb.sql"
SQLITE_WIKI_INIT_SQL="$SQLITE_FD/wiki.sql"
SQLITE_WIKI_TT_INIT_SQL="$SQLITE_FD/tt_wiki.sql"

#DB_TTDB_INIT_SCRIPT=$COMM_DIR/../TTdb/TTdb_create.php
#DB_TTDB_REPLAY_SCRIPT=$COMM_DIR/../TTdb/replay_tt_updates.php
#DB_TTDB_DUMP_SCRIPT=$COMM_DIR/../TTdb/dump_updates.php
#DB_TRANS_SCRIPT=$COMM_DIR/../TTdb/gen_ttdb_mapping.php
#DB_TTDB_HOTCRP_REBUILD_SCRIPT=$COMM_DIR/../TTdb/db_rebuilt/hotcrp_dbrebuilt.php
#DB_TTDB_WIKI_REBUILD_SCRIPT=$COMM_DIR/../TTdb/db_rebuilt/wiki_dbrebuilt.php
#DB_TTDB_SELECT_SCRIPT=$COMM_DIR/../TTdb/replay_tt_select.php
#DB_NORMAL_SQL_SCRIPT=$COMM_DIR/../TTdb/replay_normal_sql.php

#APC_TRANS_SCRIPT=$COMM_DIR/../ttapc/apc_translator.php
#APC_FETCH_SCRIPT=$COMM_DIR/../ttapc/gen_fetch_result.php
#APC_TTAPC_FETCH_SCRIPT=$COMM_DIR/../ttapc/gen_ttapc_fetch_result.php

#===========Programs====================

DB_TTDB_INMEM_EXE="$SQLITE_FD/sqlite_ttdb_build"
SQL_CHECK_EXE="$ORO_HOME/veri_tools/odiff/sql_check/check_sql"
SESS_CHECK_EXE="$ORO_HOME/veri_tools/odiff/sess_check/check_session"
TRAC_INPUT_GEN="$ORO_HOME/veri_tools/trace_input/gen_input.sh"
MERGE_SCRIPT="$COMM_DIR/funcs/merge.js"
COLLECT_TIME_SCRIPT="$ORO_HOME/veri_tools/utils/collect_time.py"
COLLECT_TIME_SCRIPT2="$ORO_HOME/veri_tools/utils/collect_time_v2.py"

#=========Rerun&other scripts=================
RERUN_ANALYZE="$COMM_DIR/scripts/from_fail_group_to_fail_file.php"
RERUN_SCRIPT="$COMM_DIR/scripts/run_fail_rollback.py"
NSG_SCRIPT="$COMM_DIR/scripts/get_nsg.php"
UURL_SCRIPT="$COMM_DIR/scripts/unique_url.php"

#========================================
#==========TTdb Functions================
#========================================

# run the script of recreate HotCRP database
function hotcrp_ttdb_clear_and_create {
  echo "Create Time Travel Table"
  PWD=$(pwd)
  cd $WEB_HOTCRP_PATH || fail "cd hotcrp dir"
  ./lib/createdb.sh --tt-mode --replace --dbuser=$HOTCRP_DBUSER,$HOTCRP_DBPASS -u$DB_USER -p$DB_PASS $DB_TT_HOTCRP_NAME || fail "create ttdb"
  cd $PWD 
}

# clear the cache in the wiki database 
function wiki_ttdb_clear {
  mysql -u$DB_USER -p$DB_PASS $DB_TT_WIKI_NAME < $COMM_DIR/funcs/wiki_clear_cache.sql || fail "clear cache"
}

function wiki_db_clear {
  mysql -u$DB_USER -p$DB_PASS $DB_WIKI_NAME < $COMM_DIR/funcs/wiki_clear_cache.sql || fail "clear cache"
}

# rebuild the in-memory sqlite versioned database
function remake_sqlite {
  APP=$1
  if [ $APP == $HOTCRP ]; then
    # this is the original (not TT) table creat sqls
    CREATE_SQL=$SQLITE_HOTCRP_INIT_SQL
  elif [ "$APP" == $PHPBB ]; then
    # this is the original (not TT) table creat sqls
    CREATE_SQL=$SQLITE_PHPBB_INIT_SQL
  elif [ "$APP" == $WIKI ]; then
    # this is the original (not TT) table creat sqls
    CREATE_SQL=$SQLITE_WIKI_INIT_SQL
  else
    fail "do not support app $APP, when creating sqlite"
  fi

  # jump to sqlite folder and build
  CWD=$(pwd)
  cd $SQLITE_FD
  # ??? --discard-insert 
  ./rewrite.py --input $CREATE_SQL --output ./init_query.h --generate-config || fail "generate sqlite init table"
  make || fail "make in-memory database"
  cd $CWD
}

# generate TTdb tables and insert into database 
function prepare_ttdb_rebuild {
  DB_NAME=$1
  APP=$2

  if [ $APP == $HOTCRP ]; then
    # this is the TT version of table create sqls
    TT_CREATE_SQL=$SQLITE_HOTCRP_TT_INIT_SQL
  elif [ $APP == $PHPBB ]; then
    # this is the TT version of table create sqls
    TT_CREATE_SQL=$SQLITE_PHPBB_TT_INIT_SQL
  elif [ $APP == $WIKI ]; then
    # this is the TT version of table create sqls
    TT_CREATE_SQL=$SQLITE_WIKI_TT_INIT_SQL
  else
    fail "$APP doesn't exist"
  fi

  # feed into db, create the tables for ttdb
  mysql $DB_NAME --max_allowed_packet=128M -u$DB_USER -p$DB_PASS < $TT_CREATE_SQL || fail "regenerate db"
}


# generate the upate SQLs from access logs
function inmem_ttdb_rebuild {
  DB_NAME=$1
  APP=$2

  # run sqlite in memory 
  $DB_TTDB_INMEM_EXE --config=$SQLITE_CONFIG --output=./dump.sql || fail "run sqlite in memory"

  # feed into db
  mysql $DB_NAME --max_allowed_packet=128M -u$DB_USER -p$DB_PASS < dump.sql || fail "regenerate db"
}

#====================================
#=========Trace Functions============
#====================================

function trace_input_gen {
  APP=$1
  if [ "$APP" == "$PHPBB" ]; then
    $TRAC_INPUT_GEN $WEB_PHPBB_URL $VERI_GEN_REQ_FD $APP 2>&1 >> $PROF_MISC_LOG || fail "fail the trace input gen for phpBB"
  elif [ "$APP" == "$HOTCRP" ]; then
    $TRAC_INPUT_GEN $WEB_HOTCRP_URL $VERI_GEN_REQ_FD $APP 2>&1 >> $PROF_MISC_LOG || fail "fail the trace input gen for HotCRP"
  elif [ "$APP" == "$WIKI" ]; then
    $TRAC_INPUT_GEN $WEB_WIKI_URL $VERI_GEN_REQ_FD $APP 2>&1 >> $PROF_MISC_LOG || fail "fail the trace input gen for HotCRP"
  else
    fail "$APP is not supported yet"
  fi
}

#====================================
#=======Hints check functions========
#====================================

function check_nondet {
  echo "========nondeterminism checking=======" >> $PROF_MISC_LOG
  $NORM_HHVM_BIN $WORK_NON_CHECK_SCRIPT $WORK_NON_DET_FD >> $PROF_MISC_LOG || fail "nondeterminism sanity check fail"
}

function check_session {
  echo "========session checking=======" >> $PROF_MISC_LOG
  #$NORM_HHVM_BIN $WORK_SESS_CHECK_SCRIPT $WORK_SESS_FD $VERI_SESS_FD >> $PROF_MISC_LOG || fail "session check fail"
  $SESS_CHECK_EXE $WORK_SESS_FD $VERI_SESS_FD >> $PROF_MISC_LOG || fail "session check fail"
}

function check_sql {
  echo "========SQL checking=======" >> $PROF_MISC_LOG
  $NORM_HHVM_BIN $WORK_SQL_CHECK_SCRIPT $HINT_DB_RAW_LOG $DB_VERI_LOG $DB_VERI_LOG2 >> $PROF_MISC_LOG || fail "sql check fail"
  #$SQL_CHECK_EXE $HINT_DB_RAW_LOG $DB_VERI_LOG $DB_VERI_LOG2 >> $PROF_MISC_LOG
}

#===================================
#======Staled functions=============
#===================================

TRAC_LUA_EXTENTION=$COMM_DIR/parser.lua
TRAC_LUA_EXTENTION_HOTCRP=$COMM_DIR/parser_hotcrp.lua

# input: {wiki, hotcrp}
function parse_trace {
  if [ $1 == "wiki" ]; then
    CUR_PORT=$WEB_WIKI_PORT
    TRAC_LUA_EXTENTION=$TRAC_LUA_EXTENTION_HOTCRP
  elif [ $1 == $HOTCRP ]; then
    CUR_PORT=$WEB_HOTCRP_PORT
    TRAC_LUA_EXTENTION=$TRAC_LUA_EXTENTION_HOTCRP
  elif [ $1 == $PHPBB ]; then
    CUR_PORT=$WEB_PHPBB_PORT
    #TRAC_LUA_EXTENTION=$TRAC_LUA_EXTENTION
    TRAC_LUA_EXTENTION=$TRAC_LUA_EXTENTION_HOTCRP
  else 
    fail "trace parser workload is unkonwn: $1"
  fi

  # FIXME:
  # NOTE!!: this ctshark is my own compiled version!!!
  ctshark -r $TRAC_RAW_LOG -d tcp.port==$CUR_PORT,http -w /dev/null -X lua_script:$TRAC_LUA_EXTENTION >> $PROF_MISC_LOG || fail "trace parsing"
}

# input:
#  DB_NAME: {hotcrp, wiki_labs_ttdb}
function ttdb_replay {
  DB_NAME=$1
  $NORM_HHVM_BIN $DB_TTDB_REPLAY_SCRIPT $HINT_DB_RAW_LOG tt $DB_NAME || fail "replay normal batch"
}
