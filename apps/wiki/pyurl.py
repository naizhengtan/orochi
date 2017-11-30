#!/usr/bin/python

import urllib2, sys

def main(argv):
    if len(argv) != 2:
        print("Error usage!")
        exit(-1)

    try:
        f = urllib2.urlopen(argv[1])
    except Exception:
        exit(-1)

if __name__ == '__main__':
    main(sys.argv)
