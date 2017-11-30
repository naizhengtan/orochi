#!/bin/bash

# mysql database
DB_USER="root"
DB_PASSWD="715715"
ORIGIN_DB="webapp"
TTDB="ttdb_webapp"

# sqlite tmp file name
TTDB_INIT="dump.sql"
CONFIG="config.txt"
LAST="last.txt"
REWRITE_LOG="rewrite.log"
TEST_FD="test/"

# scripts
SPILIT_SCRIPT="./split.py"
REWRITE_SCRIPT="./rewrite.py"

# header file main.cc need
HEADER_FILE="init_query.h"

# mode
MODE="normal"

if [ "$#" -ne 2 ] || [ "$1" != "hotcrp" ] && [ "$1" != "phpbb" ] && [ "$1" != "wiki" ]; then
    echo "Usage: $0 [hotcrp|phpbb|wiki] N_BATCH"
    exit 1
fi



if [ "$1" == "phpbb" ]; then
    MYSQL_LOG_FILE="/tmp/phpbb.sql.log"
    CREATE_TABLE="tt_phpbb.sql"
    ORIGIN_DB_INIT="phpbb.sql"
elif [ "$1" == "hotcrp" ]; then
    MYSQL_LOG_FILE="/tmp/hotcrp.sql.log"
    CREATE_TABLE="tt_hotcrp.sql"
    ORIGIN_DB_INIT="hotcrp.sql"
elif [ "$1" == "wiki" ]; then
    MYSQL_LOG_FILE="/tmp/wiki.sql.log"
    CREATE_TABLE="tt_wiki.sql"
    ORIGIN_DB_INIT="wiki.sql"
    WIKI_TTDB_INIT="wiki_tt_tables.sql"
    mysql -u$DB_USER -p$DB_PASSWD $TTDB < $WIKI_TTDB_INIT
fi

NBATCH=$2

# clean up
if [ -f $TEST_FD ]; 
then
    rm -rf $TEST_FD/*.log
else
    mkdir -p $TEST_FD
fi
if [ -f $REWRITE_LOG ];
then
    rm $REWRITE_LOG
fi;
mysql -u$DB_USER -p$DB_PASSWD $ORIGIN_DB < $ORIGIN_DB_INIT
if [ -f $LAST ];
then 
    rm $LAST
fi;
if [ -f $REWRITE_LOG ];
then 
    rm $REWRITE_LOG
fi;


# main

# run split script
$SPILIT_SCRIPT --infile=$MYSQL_LOG_FILE --outdir=$TEST_FD --nbatch=$NBATCH || exit 1

# run rewrite script
$REWRITE_SCRIPT --input=$ORIGIN_DB_INIT --output=$HEADER_FILE --generate-config || exit 1

# compile
make || exit 1

# run ttdb rebuild
for (( i = 0; i < $NBATCH; i++ ))
do
    ./main --mode=$MODE --config=$CONFIG --input=$TEST_FD$i.log --output=$TTDB_INIT --last=$LAST --create_table=$CREATE_TABLE --dbname=$TTDB ||  exit 1
    mysql -u$DB_USER -p$DB_PASSWD $TTDB < $TTDB_INIT || exit 1
done
# check result
./check --input=$MYSQL_LOG_FILE --dbuser=$DB_USER --dbpass=$DB_PASSWD --origindb=$ORIGIN_DB --ttdb=$TTDB $EXTRA_CHECK_FLAGS || exit 1

make clean
rm -rf $TEST_FD
