#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: ./instrument_wrapper.sh <path to php root directory>"
    exit 1
fi

logfile="./builtin.log"

if [ -f $logfile ]; then
    rm $logfile
fi

numFiles=`find $1 -name "*.php" | wc -l`
i=0
for f in `find $1 -name "*.php"`
do
    i=$(($i+1))
    echo $i/$numFiles: $f
    hhvm -vEval.DumpBytecode=1 $f 2>&1 | grep -i fcallbuiltin >> $logfile
done
