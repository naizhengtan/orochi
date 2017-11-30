#!/bin/bash

INS_CMD="/home/ylf/Documents/realphp/phpBB3/workload_gen/instrument_php.py"

function fail {
  echo "FATAL ERROR when: $1"
  exit 1
}

function fail_instrument_php {
# Keep class
class="mysqli"
# TODO: check if there is "declare" keyword 
  for f in $( ls *.php ); do
    sed -i "2s/^/use \\\\$class as $class;\n/" $f  || fail "use class mysqli in $f"
    sed -i '2s/^/namespace cheng_instrument;\n/' $f  || fail "instrument $f"
    echo "Instrumented $f"
  done
}

function instrument_php {
  for f in $( ls *.php ); do
    python $INS_CMD $f || fail "instrument $f"
  done
}

function do_on_fd {
(
  cd $1 || fail "cd $1"
  echo "cd $1 ..."
  for fd in $( ls ); do
    if [ -d $fd ]; then
      do_on_fd $fd
    fi
  done
  instrument_php
  echo "leave $1 ..."
)
}

if [ $# != 1 ]; then
  echo "Usage: record-instument.sh <php-file-folder>"
  exit 1
fi

PHP_PATH=$1
do_on_fd $PHP_PATH
