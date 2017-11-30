#!/bin/bash

function fail {
  echo "FATAL ERROR: $1"
  exit 1
}

function usage {
  echo "deploy.sh <name>"
}


if [ $# != 1 ]; then
  usage
  exit 1
fi

FD=$1

if [ ! -e $FD ];then
  echo "$FD doesn't exist! quit."
  exit 1
fi

(
  cd $FD
  echo "start to copy branch"
  rm -rf /tmp/branch            || fail "rm branch fail"
  cp -r ./branch /tmp/branch    || fail "copy branch fail"
  echo "start to copy trace"
  cp ./trace_seq.log /tmp/trace_seq.log    || fail "copy trace_seq.log"
  echo "start to copy sql"
  cp ./sql.log   /tmp/sql.log      || fail "copy sql.log"
  echo "start to copy apc"
  cp ./apc.log  /tmp/apc.log       || fail "copy apc.log"
  echo "start to copy sess" 
  cp ./sess.log /tmp/sess.log      || fail "copy sess.log"
  echo "start to copy maxop" 
  cp ./maxop.log /tmp/maxop.log    || fail "copy maxop.log"
  echo "start to copy cf_tags" 
  cp ./cf_tags.log /tmp/cf_tags.log    || fail "copy maxop.log"
  echo "start to copy fail-php.txt" 
  rm -f /tmp/fail-php.txt
  cp ./fail-php.txt /tmp/fail-php.txt || echo "no fail-php.txt, good"
) || fail "copy fail"

chmod +w /tmp/sql.log || fail "chmod on logs"
chmod +w /tmp/apc.log || fail "chmod on logs"
chmod +w /tmp/sess.log || fail "chmod on logs"
chmod +w /tmp/maxop.log || fail "chmod on logs"
chmod +w /tmp/cf_tags.log || fail "chmod on logs"
echo "DONE"
