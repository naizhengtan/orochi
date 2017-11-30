#!/bin/bash
if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: environment ORO_HOME is not defined"
  exit 1
fi

source $ORO_HOME/env.sh

function usage {
  echo "gen_input.sh <base_url> <gen_req_folder> <app>"
}

if [ $# != 3 ]; then
  usage;
  exit 1;
fi

URL=$1
DST_FD=$2
APP=$3
CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# NORE: this "php" needs the HTTP module
#php /home/cheng/orochi/tests/trace_input/gen_req.php /tmp/trace_req.log /tmp/trace_seq.log $URL $DST_FD $APP 
php $CUR_DIR/gen_req2.php /tmp/branch/requests /tmp/trace_seq.log $URL $DST_FD $APP 
