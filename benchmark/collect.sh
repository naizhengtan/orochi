#!/bin/bash

function fail {
  echo "FATAL ERROR: $1"
  exit 1
}

function usage {
  echo "collect.sh <name>"
}


if [ $# != 1 ]; then
  usage
  exit 1
fi

FD=$1

if [ -e $FD ];then
  echo "$FD exists! choose another name, quit."
  exit 1
fi

mkdir $FD
(
  cd $FD
  echo "start to copy branch"
  cp -r /tmp/branch  ./branch || fail "copy branch fail"
  echo "start to copy trace"
  cp /tmp/trace_seq.log ./trace_seq.log    || fail "copy trace_seq.log"
  echo "start to copy sql"
  cp /tmp/sql.log ./sql.log        || fail "copy sql.log"
  echo "start to copy apc"
  cp /tmp/apc.log  ./apc.log       || fail "copy apc.log"
  echo "start to copy sess" 
  cp /tmp/sess.log ./sess.log      || fail "copy sess.log"
  echo "start to copy maxop" 
  cp /tmp/maxop.log  ./maxop.log   || fail "copy maxop.log"
  echo "start to copy cf_tags" 
  cp /tmp/cf_tags.log  ./cf_tags.log || fail "copy maxop.log"
  echo "start to copy fail-php.txt" 
  cp /tmp/fail-php.txt fail-php.txt || echo "no fail-php.txt good"
) || fail "copy fail"

echo "DONE"
