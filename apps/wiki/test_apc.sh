#!/bin/bash

CHECK_SCRIPT="./check_apc_in_trx.py"
#VISIT_SCRIPT="./pyurl.py"
VISIT_SCRIPT="curl"
LOG_FILE="/tmp/access.log"
#URL_FILE="/home/ylf/orochi/repo/webapp-test/wiki-workload/zipf_urls_1000.txt"
URL_FILE="/home/ylf/orochi/repo/webapp-test/wiki-workload/zipf_urls_1000_100000_0-53.txt"
APC_FILE_1="/tmp/fetch_fail.log"
APC_FILE_2="/tmp/init_fail.log"
DB_CLEAR_FILE="/home/ylf/orochi/repo/webapp-test/wiki-workload/clear_cache.sql"
DB_USER="root"
DB_NAME="my_wiki"
DB_PASS="715715"
TMP_FILE="lingfan_test_tttttemp"
MISSING_LOG="/tmp/missing.log"

function fail {
    if [ $# -gt 0 ]; then
        echo $@
    fi
    exit 1
}

function remove {
    if [ -f $1 ]; then
        rm $1
    fi
}

# clearing
remove $LOG_FILE
remove $TMP_FILE
remove $APC_FILE_1
remove $APC_FILE_2

cat $URL_FILE | sort | uniq > $TMP_FILE

while read LINE
do
    mysql -u$DB_USER -p$DB_PASS $DB_NAME < $DB_CLEAR_FILE > /dev/null 2>&1
    URL=`echo "$LINE" | sed -e "s/yak.nyu.systems:5000/216.165.71.216:8085/g"`
    echo $URL
    $VISIT_SCRIPT $URL > /dev/null 2>&1 || fail "unable to access url"
    if [ ! -f $LOG_FILE ]; then
        fail $LOG_FILE "does not exist" $URL
    fi
    $CHECK_SCRIPT $LOG_FILE || fail "fucked" $URL
    NUM=`cat $MISSING_LOG | sort | uniq | wc -l`
    if [ $NUM -gt 0 ]; then
        break
    fi
    rm $LOG_FILE
done < $TMP_FILE

rm $TMP_FILE


