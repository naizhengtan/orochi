#!/usr/bin/python

from __future__ import print_function
import re, sys

def main():
    filename = '/tmp/mysql_log_cpu_time.log'
    if len(sys.argv) > 1:
        filename= sys.argv[1]
    try:
        with open(filename, 'r') as f:
            s = f.read()
        res = re.findall(r'^.+$', s, re.M)
        time = sorted(map(float, res))
        print( int(time[-1] - time[0]), end='')
    except:
        print (0, end='') 

if __name__ == '__main__':
    main()
