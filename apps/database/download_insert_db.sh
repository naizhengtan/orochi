#!/bin/bash
if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: environment ORO_HOME is not defined"
  exit 1
fi

source $ORO_HOME/env.sh

REMOTE_SERVER="http://yak-cheng.duckdns.org:8614/orochi/database"
SUFFIX=".tar.gz"
SQL_SUFFIX=".sql"
BENCH_NAME=("wiki_labs_ttdb")
INFO_LOG=info.log

if [ "$1" != "" ]; then
  BENCH_NAME=( $1 )
fi

if [ -e $INFO_LOG ]; then
  rm $INFO_LOG
fi

for name in ${BENCH_NAME[@]}; do
  echo "[INFO] start to download database $name"
  # download
  wget $REMOTE_SERVER/$name$SUFFIX >> $INFO_LOG 2>&1\
    && echo "       Succeed downloading [$name]"\
    || echo "       FAIL downloading [$name]"
  # unzip and remove
  echo "[INFO] unzip $name$SUFFIX"
  tar xzf $name$SUFFIX >> $INFO_LOG 2>&1 && rm $name$SUFFIX\
    && echo "       Succeed unziping [$name]"\
    || echo "       FAIL unziping [$name]"
  # insert the database into mysql
  echo "[INFO] insert database $name"
  echo "CREATE DATABASE IF NOT EXISTS $name" | mysql -u$DB_USER -p$DB_PASS
  mysql -u$DB_USER -p$DB_PASS $name < $name$SQL_SUFFIX\
    && echo "       Succeed inserting database [$name]"\
    || echo "       FAIL inserting database [$name]"
done

