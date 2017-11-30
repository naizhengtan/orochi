#!/bin/bash

if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: environment ORO_HOME is empty"
  exit 1
fi

function fail {
  echo "ERROR: $1"
  exit 1
}

LIB_PATH="$ORO_HOME/veri_tools/record_lib/"

RECORD_LIB_NAME="record_lib.php"
SESSION_LIB_NAME="sess_lib.php"
TTAPC_LIB_NAME="ttapc_lib.php"
TTDB_LIB_NAME="ttdb_lib.php"
NONDET_LIB_NAME="nondet_lib.php"
PROFILER_LIB_NAME="profiler.php"

RECORD_LIB="$LIB_PATH/$RECORD_LIB_NAME"
SESSION_LIB="$LIB_PATH/$SESSION_LIB_NAME"
TTAPC_LIB="$LIB_PATH/$TTAPC_LIB_NAME"
TTDB_LIB="$LIB_PATH/$TTDB_LIB_NAME"
NONDET_LIB="$LIB_PATH/$NONDET_LIB_NAME"
PROFILER_LIB="$LIB_PATH/$PROFILER_LIB_NAME"

# clear current links
rm -f $RECORD_LIB_NAME
rm -f $SESSION_LIB_NAME
rm -f $TTAPC_LIB_NAME
rm -f $TTDB_LIB_NAME
rm -f $NONDET_LIB_NAME
rm -f $PROFILER_LIB_NAME

# create new links
ln -s $RECORD_LIB   $RECORD_LIB_NAME  || fail "ln $RECORD_LIB_NAME"
ln -s $SESSION_LIB  $SESSION_LIB_NAME || fail "ln $SESSION_LIB_NAME"
ln -s $TTAPC_LIB    $TTAPC_LIB_NAME   || fail "ln $TTAPC_LIB_NAME"
ln -s $TTDB_LIB     $TTDB_LIB_NAME    || fail "ln $TTDB_LIB_NAME"
ln -s $NONDET_LIB   $NONDET_LIB_NAME  || fail "ln $NONDET_LIB_NAME"
ln -s $PROFILER_LIB $PROFILER_LIB_NAME || fail "ln $PROFILER_LIB_NAME"
echo "[DONE]"
