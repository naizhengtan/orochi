#! /usr/bin/python
import re, os, glob, time
import sys
import argparse
from shutil import copyfile

last = -1
log = list()
indir = ''
outfile = ''

def byfirstindex(t):
    return t[0]

def dump_to_file():
    global log
    global last

    log = sorted(log, key = byfirstindex)
    with open(outfile, 'ab') as f:
        for index, v in log:
            if index <= last:
                continue
            if index - last > 1:
                break
            else:
                last = index
                f.write((v + '|]|').encode('latin1'))
        log = log[index:]
        f.write('END|]|')
    print('max merged: {}, max seen: {}'.format(last, len(log)>0 and log[-1][0] or last))

def CheckAndMerge():
    global last
    global log
    for filename in glob.glob(os.path.join(indir, '*.log')):
        with open(filename, 'rb') as f:
            s = f.read().decode('latin1')
            res = re.findall(r'\|\[\|(.*?)::(.*?)\|\]\|', s, re.S)
            for v in res:
                log.append((int(v[0]), v[1]))
        if s[-3:] == 'END':
            os.rename(filename, filename+'.bak')
#            copyfile(filename, filename+'.bak')
 #           os.remove(filename)
    if len(log)>0:
        dump_to_file()

def read_old(s):
    global log
    res = re.findall(r'(.*?)\|\]\|', s, re.S)
    assert(res[-1] == 'END')
    log = list(enumerate(res[:-1]))
    dump_to_file()
    print('{} log entries read from old file'.format(last))

def main():
    global indir
    global outfile

    parser = argparse.ArgumentParser(description = 'MySQL Log Merger')
    parser.add_argument('--indir', type=str, default='/tmp/sql_log/', help = 'path of input directory (default /tmp/sql_log/)')
    parser.add_argument('--daemon', action='store_true', default = False, help='enable daemon mode (default False)')
#    parser.add_argument('--last', type=int, default=-1, metavar='SEQ', help='max consecutive sequence number seen (default -1)')
    parser.add_argument('--output', type=str, default='/tmp/sql.log', metavar='PATH', help='output merged file path (default /tmp/sql.log)')
    parser.add_argument('--read-old', action='store_true', default = False, help='read old output file if exists (default False')
    parser.add_argument('--old-path', type=str, default = '/tmp/sql.log', metavar = 'PATH', help='path to old output file (default /tmp/sql.log)')
    parser.add_argument('--revert', action='store_true', default = False, help='rename all *.log.bak back to *.log')

    args = parser.parse_args()

    indir = args.indir
    outfile = args.output

    if args.revert:
        for filename in glob.glob(os.path.join(indir, '*.log.bak')):
            os.rename(filename, filename[:-4])
        exit(0)


    if args.read_old:
        with open(args.old_path, 'rb') as f:
            old = f.read().decode('latin1')

# remove old output ?????
    if os.path.isfile(args.output):
        os.remove(args.output)

    if args.read_old:
        read_old(old)

    CheckAndMerge()
    while args.daemon:
        time.sleep(3)
#FIXME: need to remove END in order to make daemon mode work
        CheckAndMerge(args.output, args.output)

if __name__ == "__main__":
    main()
