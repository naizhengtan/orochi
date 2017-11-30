#!/bin/bash

# MySQL config
DB_USER="phpbb"
DB_PASSWD="123456"
DB_NAME="phpbb"
DB_INIT_FILE="./db_new.sql"
DB_PREPARE_FILE="./db_prepare.sql"

# PHPBB url
URL="http://216.165.71.216:8089/"

# scripts
CREATE_USERS_JS="./create-users.js"
USERS_JS="./users.js"

# parameters
NUM_USER=10
NUM_POST=100

# files
CFG_LOG="cfg.log"
BRANCH="/tmp/branch/"
USER_ZIPF="user_zipf"
GUEST_ZIPF="guest_zipf"

# configs
HHVM_INI="/home/ylf/orochi/setup/hhvm.ini"
NGINX_CONFIG="/etc/nginx/nginx.conf"

function usage {
    echo "Usage: $0 [prepare|workload]"
    exit 1
}

# main
if [ $# -eq 0 ] || [ $# -gt 2 ] || [ "$1" != "prepare" ] && [ "$1" != "workload" ]; then
    usage
fi
if [ $# -eq 2 ] && [ "$2" == "small" ]; then
    USER_ZIPF="small_user_zipf"
    GUEST_ZIPF="small_guest_zipf"
fi

# restart nginx and hhvmt
sudo service nginx stop
killall -9 hhvm
killall -9 hhvmt
killall -9 hhvmm
hhvmt -m daemon -vEval.Jit=0 -vServer.Type=fastcgi -c $HHVM_INI
sudo nginx -c $NGINX_CONFIG

# cleanup
if [ -d $BRANCH ]; then
    sudo rm -rf $BRANCH
fi
if [ -f $CFG_LOG ]; then
    rm $CFG_LOG
fi
mkdir -p $BRANCH/non_determ
mkdir -p $BRANCH/output
mkdir -p $BRANCH/session
mkdir -p $BRANCH/submission
# mkdir -p /var/run/mysqld
# ln -s /tmp/mysql.sock /var/run/mysqld/mysqld.sock

# init

if [ $1 == "prepare" ]; then

    # reinit mysql
    mysql -u$DB_USER -p$DB_PASSWD $DB_NAME < $DB_INIT_FILE

    # create user
    echo create $NUM_USER users
    for ((i=0;i<$NUM_USER;i++))
    do
        casperjs $CREATE_USERS_JS --url=$URL --user=user$i
    done
    echo

    echo post $NUM_POST threads
    # post
    for ((i=1;i<$NUM_POST;i++)) # already one thread there
    do
        echo post $i
        casperjs $USERS_JS --url=$URL --user=admin --action=post
    done
    echo

    # dump mysql
    mysqldump -u$DB_USER -p$DB_PASSWD $DB_NAME > $DB_PREPARE_FILE

else
    if [ ! -f $DB_PREPARE_FILE ]; then
        echo $DB_PREPARE_FILE not exist, run "$0 prepare" first
        exit
    fi
    mysql -u$DB_USER -p$DB_PASSWD $DB_NAME < $DB_PREPARE_FILE

    # user read

    for ((i=0;i<$NUM_USER;i++))
    do
        echo user$i read
        casperjs $USERS_JS --url=$URL --user=user$i --action=read --readFile=$USER_ZIPF
        echo
        echo user$i >> $CFG_LOG
        ./stat.py >> $CFG_LOG
        echo >> $CFG_LOG
    done

    # guest read
    echo guest read
    casperjs $USERS_JS --url=$URL --readFile=$GUEST_ZIPF
    echo >> $CFG_LOG
    echo guest >> $CFG_LOG
    ./stat.py >> $CFG_LOG
fi
