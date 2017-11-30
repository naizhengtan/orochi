#!/bin/bash

if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: ORO_HOME is not set"
  exit 1
fi

source $ORO_HOME/env.sh

if [ $# != 1 ]; then
  echo "Usage: clear_and_run.sh [normal|logging]"
  exit 1
fi

MODE=$1
if [ "$MODE" != "normal" ] && [ "$MODE" != "logging" ]; then
  echo "Usage: clear_and_run.sh [normal|logging]"
  exit 1
fi

# kill the old one
echo "[INFO] using sudo to kill existing <$ORO_PROXY_BIN>"
sudo killall $ORO_PROXY_BIN 2>/dev/null
sleep 1

# prepare the folders
rm /tmp/trace_seq.log
rm -rf /tmp/branch/proxy_output/ 2> /dev/null
rm -rf /tmp/branch/requests/ 2> /dev/null
mkdir -p /tmp/branch/proxy_output/
mkdir -p /tmp/branch/requests/
chmod o+w /tmp/branch/
chmod o+w /tmp/branch/proxy_output/
chmod o+w /tmp/branch/requests/

# restart
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CUR_PATH=$( pwd )
cd $SCRIPT_DIR
if [ "$MODE" == "normal" ]; then
  echo "[INFO] openresty starts as norml mode"
  $ORO_PROXY_BIN -p $(pwd) -c conf/clean.conf
fi
if [ "$MODE" == "logging" ]; then
  echo "[INFO] openresty starts as logging mode"
  $ORO_PROXY_BIN -p $(pwd) -c conf/nginx.conf
fi
cd $CUR_PATH 
