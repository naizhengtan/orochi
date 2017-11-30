#!/bin/bash

# MySQL config
DB_USER="phpbb"
DB_PASSWD="123456"
DB_NAME="phpbb"
DB_INIT_FILE="./db_new.sql"

# PHPBB url
URL="http://216.165.71.216:8089/"

# scripts
CREATE_USERS_JS="./create-users.js"
USERS_JS="./users.js"

# parameters
NUM_USER=10
NUM_GUEST=20000 #`expr $NUM_USER \* 10`
NUM_POST=2
NUM_REPLY=0
NUM_READ=$(( ( $NUM_POST + $NUM_REPLY ) * 1000 ))
NUM_THREAD=$(( $NUM_POST * $NUM_USER + 1 ))

# files
RANDOM_LOG="random.log"
BRANCH="/tmp/branch/"
READ_FILE="readFile"

# main

# cleanup
if [ -d $BRANCH ]; then
    sudo rm -rf $BRANCH
fi
if [ -f $RANDOM_LOG ]; then
    rm $RANDOM_LOG
fi
if [ -f $READ_FILE ]; then
    rm $READ_FILE
fi
mkdir -p $BRANCH/non_determ
mkdir -p $BRANCH/output
mkdir -p $BRANCH/session
mkdir -p $BRANCH/submission
# mkdir -p /var/run/mysqld
# ln -s /tmp/mysql.sock /var/run/mysqld/mysqld.sock

# init
DIV=$((NUM_USER+NUM_GUEST))
RANDOM=1703

# reinit mysql
mysql -u$DB_USER -p$DB_PASSWD $DB_NAME < $DB_INIT_FILE

# create user
for ((i=0;i<$NUM_USER;i++))
do
    casperjs $CREATE_USERS_JS --url=$URL --user=user$i
done
echo


# post
for ((i=0;i<$NUM_POST;i++))
do
    echo post round $i
    for ((k=0;k<$NUM_USER;k++))
    do
        casperjs $USERS_JS --url=$URL --user=user$k --action=post
    done
    echo
done

# reply
for ((i=0;i<$NUM_REPLY;i++))
do
    echo reply round $i
    for ((k=0;k<$NUM_USER;k++))
    do
        R=$RANDOM
        echo $R >> $RANDOM_LOG
        thread=$(( $R % $NUM_THREAD + 1))
        echo $thread >> $READ_FILE
        casperjs $USERS_JS --url=$URL --user=user$k --action=reply --readFile=$READ_FILE
        rm $READ_FILE
    done
    echo
done

# user read

for ((i=0;i<$NUM_USER;i++))
do
    for ((k=0;k<$NUM_READ;k++))
    do
        R=$RANDOM
        echo $R >> $RANDOM_LOG
        thread=$(( $R % $NUM_THREAD + 1))
#        thread=$(( $k % 21 + 1))
        echo $thread >> $READ_FILE
    done
    echo user$i read
    casperjs $USERS_JS --url=$URL --user=user$i --action=read --readFile=$READ_FILE
    rm $READ_FILE
    echo
done

# guest read
for ((i=0;i<$NUM_GUEST;i++))
do
    R=$RANDOM
    echo $R >> $RANDOM_LOG
    thread=$(( $R % $NUM_THREAD + 1))
    echo $thread >> $READ_FILE
done
echo guest read
casperjs $USERS_JS --url=$URL --readFile=$READ_FILE
