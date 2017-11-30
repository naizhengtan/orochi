#!/bin/bash

REMOTE_SERVER="http://yak-cheng.duckdns.org:8614/orochi/benchmark"
SUFFIX=".tar.gz"
BENCH_NAME=("hotcrp" "phpbb" "wiki")
INFO_LOG=info.log

if [ "$1" != "" ]; then
  BENCH_NAME=( $1 )
fi

if [ -e $INFO_LOG ]; then
  rm $INFO_LOG
fi

for name in ${BENCH_NAME[@]}; do
  echo "[INFO] start to download $name"
  # download
  wget $REMOTE_SERVER/$name$SUFFIX >> $INFO_LOG 2>&1\
    && echo "       Succeed downloading [$name]"\
    || echo "       FAIL downloading [$name]"
  # unzip and remove
  echo "[INFO] unzip $name$SUFFIX"
  tar xzf $name$SUFFIX >> $INFO_LOG 2>&1 && rm $name$SUFFIX\
    && echo "       Succeed unziping [$name]"\
    || echo "       FAIL unziping [$name]"
done

