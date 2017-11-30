#!/usr/bin/python

import sys, re

def main(argv):
    if len(argv) > 2:
        print('Error usage!\n')
        exit(-1)
    if len(argv) == 2:
        fname = argv[1]
    else:
        fname = '/tmp/access.log'
    with open(fname, "r") as f:
        s = f.read()
    res = re.findall(r'^(.*?)$', s, re.M)
    in_trx = 0
    for v in res:
        v = v.lower()
        if v[:3] == "apc":
            if in_trx > 0:
                print("apc in trx!!!!!!!!")
                exit(-1)
        elif v == "begin":
            in_trx = in_trx + 1
        elif v == "commit" or v == "rollback":
            in_trx = in_trx - 1
        else:
            pass

if __name__ == '__main__':
    main(sys.argv)
