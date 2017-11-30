#!/usr/bin/python3
import argparse
import re
import sys

def main():
    parser = argparse.ArgumentParser(description = 'MySQL Log Merger')
    parser.add_argument('--infile', type=str, default='/tmp/sql.log', help = 'path of input file (default /tmp/sql.log)')
    parser.add_argument('--outdir', type=str, default='./test/', help = 'path of output directory (default ./test/)')
    parser.add_argument('--nbatch', type=int, default=100, help = 'number of batches (default 100)')
    args = parser.parse_args()
    with open(args.infile, 'r', encoding = 'latin1') as f:
        s = f.read()
    res = re.findall(r'(.*?\|\]\|)', s, re.S)
    res = res[:-1]
    n_batch = args.nbatch
    batch_size = int(len(res)/n_batch)
    for i in range(n_batch):
        if i == n_batch - 1:
            n = len(res) - batch_size*i
        else:
            n = batch_size
        with open(args.outdir + '/' + str(i) + '.log', 'w', encoding = 'latin1') as f:
            for k in range(n):
                f.write(res[i*batch_size + k])
            f.write("END|]|")

if __name__ == '__main__':
    main()
