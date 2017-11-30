#!/bin/bash

TRIES=3

for i in 1 2 4 8; do
  echo "=======================";
  echo "====== $i clients ======";
  echo "=======================";
  for j in $(seq 1 $TRIES); do
    echo "====== Attempt $j ======";
    /bin/bash workload_gen.sh $i 2>&1 > /dev/null
    sleep 1;
  done
  echo "====== Averages  ======";
  echo -e "real\t0m0.000s";
  echo -e "throughput\t0r/s\n";
done
