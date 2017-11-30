#!/bin/bash

function fail {
  echo "ERROR $1"
  exit 1
}

make perf ||  fail "make"
./check_sql ./data/sql.log ./data/sql-verify-1.log ./data/sql-verify-2.log || fail "run"
gprof ./check_sql gmon.out > analysis.txt || fail "gen"

echo "DONE"
