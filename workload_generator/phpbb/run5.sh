#!/bin/bash

# Usage: ./local_workload_gen.sh [prepare|normal|small|large|centos] [prof_normal|veri_workload|prof_oro]

./local_workload_gen.sh centos prof_normal > /tmp/phpbbonline.log
./local_workload_gen.sh centos prof_normal >> /tmp/phpbbonline.log
./local_workload_gen.sh centos prof_normal >> /tmp/phpbbonline.log
./local_workload_gen.sh centos prof_normal >> /tmp/phpbbonline.log
./local_workload_gen.sh centos prof_normal >> /tmp/phpbbonline.log
