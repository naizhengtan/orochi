#!/bin/bash
DB_USER="phpbb"
DB_PASSWD="123456"
DB_NAME="phpbb"
DB_PREPARE_FILE="/home/ylf/Documents/realphp/phpBB3/workload_gen/db_prepare.sql"
URL="http://216.165.71.216:8089"
WORKLOAD="/home/ylf/orochi/lingfan_workload/latency/scripts/phpbb_workgen.py"

NUM_USER=10
NUM_POST=100
USER_ZIPF="/home/ylf/Documents/realphp/phpBB3/workload_gen/small_user_zipf"
GUEST_ZIPF="/home/ylf/Documents/realphp/phpBB3/workload_gen/small_guest_zipf"
HHVM_CLOCK="/tmp/hhvm_clock.log"

lingfan restart hhvmt

if [ -f $HHVM_CLOCK ]; then
    rm $HHVM_CLOCK
fi


if [ ! -f $DB_PREPARE_FILE ]; then
    echo $DB_PREPARE_FILE not exist, run "$0 prepare" first
    exit
fi
mysql -u$DB_USER -p$DB_PASSWD $DB_NAME < $DB_PREPARE_FILE

# user read

for ((i=0;i<$NUM_USER;i++))
do
    echo user$i read
    $WORKLOAD --user=user$i --url=$URL --zipfian=$USER_ZIPF
done

# guest read
echo guest read
$WORKLOAD --url=$URL --zipfian=$GUEST_ZIPF
./calc.py
