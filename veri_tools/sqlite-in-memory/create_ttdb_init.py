#!/usr/bin/python3

import re

def is_letter(s):
    return s >= 'A' and s<='Z' or s>='a' and s<='z'

def main():
    with open('/home/ylf/orochi/wiki/wiki.sql','r') as f:
        s = f.read()
    lines = re.findall(r'^.*?$', s, re.M)
    s = ''
    column = []
    key_seen = False
    unique_seen = False
    for v in lines:
        if len(v) == 0 or v[0:2] == '--' or v[0:2] == '/*'\
                or v[0:4].lower() == 'lock' or v[0:6].lower() == 'unlock'\
                or v[0:6].lower() == 'insert':
            continue
        old = v[:]
        if is_letter(v[0]):
            if v[0] == 'c' or v[0] == 'C':
                column = []
                res = re.findall(r'create table `?(.*?)`? ', v, re.I)
                table_name = res[0]
                s = s + v + '\n'
            elif v[0] == 'd' or v[0] == 'D':
                s = s + v + '\n\n'
            else:
                print(v)
                print('not handled case')
                exit(-1)
        elif v[-1] == ';':
            if s[-2] != ',':
                s = s[:-1] + ',\n'
            if not key_seen:
                s = s + '  `start_ts` bigint(20) NOT NULL DEFAULT \'0\',\n  `end_ts` bigint(20) DEFAULT NULL,\n'
            key_seen = False
            if not unique_seen:
                key = '`start_ts`'
                for k in column:
                    key = key + ', `{}`'.format(k)
                s = s + '  UNIQUE KEY `{}` ({}),\n'.format(table_name+'_unique', key)
            column = []
            unique_seen = False
            s = s + '  KEY `end_ts` (`end_ts`)\n'
            s = s + v + '\n\n'
        else:
            res = re.findall('(.*?)(\t| )+#', v)
            if len(res) > 0:
                v = res[0][0]
            if len(v) == 0:
                continue
            if v.find(' KEY ') != -1:
                if not key_seen:
                    s = s + '  `start_ts` bigint(20) NOT NULL DEFAULT \'0\',\n  `end_ts` bigint(20) DEFAULT NULL,\n'
                    key_seen = True
                res = re.findall(r' *(primary|unique) key (.*?)? ?\((.*?)\).*', v, re.I)
                if len(res) > 0:
                    unique_seen = True
                    if res[0][0].lower() == 'primary':
                        s = s + '  KEY `{}_old_primary` ({}),\n'.format(table_name, res[0][2])
                        s = s + '  PRIMARY KEY (`start_ts`, {}),\n'.format(res[0][2])
                    else:
                        s = s + '  UNIQUE KEY {} (`start_ts`, {}),\n'.format(res[0][1], res[0][2])
                else:
                    s = s + v + '\n'
            else:
                res = re.findall(r'  `(.*?)` ', v)
                column.append(res[0])
                s = s + v + '\n'
    print(s)


if __name__ == '__main__':
    main()
