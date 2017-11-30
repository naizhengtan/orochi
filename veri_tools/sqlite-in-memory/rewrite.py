#!/usr/bin/python3

import re, sys
import argparse

in_create = False
key_seen = False
table_name = ''
last_create = False

def is_letter(s):
    return s >= 'A' and s<= 'Z' or s >= 'a' and s <= 'z'

def convert(v):
    global in_create
    global key_seen
    global table_name
    global last_create
# the following seq is important
    v = v.replace('\\"', '"')
    v = v.replace('\\', '\\\\')
    v = v.replace('"', '\\"')
    last_create = False
    if is_letter(v[0]):
        if v[0] == 'c' or v[0] == 'C':
            in_create = True
            res = re.findall(r'create table (.*?) ', v, re.I)
            table_name = res[0]
            if (table_name[0] == '`'):
                table_name = table_name[1:-1]
            last_create = True
        if v[-1] != ';':
            return '"' + v + '\\\n'
        else:
            return '"' + v + '",\n'
    elif v[-1] == ';':
        in_create = False
        key_seen = False
        return ');",\n'
    else:
        res = re.findall('(.*?)(\t| )+#', v)
        if len(res) > 0:
            v = res[0][0]
        if len(v) == 0:
            return ''
        if v.find(' KEY ') != -1:
            tmp = ''
            if not key_seen:
                tmp = '  `start_ts` bigint(20) NOT NULL DEFAULT \'0\',\\\n  `end_ts` bigint(20) DEFAULT NULL,\\\n'
                key_seen = True
            res = re.findall(r' *(primary|unique) key (.*?)? ?\((.*?)\).*', v, re.I)
            if len(res) > 0:
                tmp+='  CONSTRAINT {} UNIQUE (`start_ts`, {}),\\\n'.format(len(res[0][1])>0 and res[0][1] or ('`'+table_name+'_primary`'), res[0][2])
            return tmp
        else:
            return v + '\\\n'

def main():
    global in_create

    parser = argparse.ArgumentParser(description = 'SQLite init file rewriter')
    parser.add_argument('--input', type=str, default = './schema.sql', help='input sql file (default ./schema.sql)')
    parser.add_argument('--output', type=str, default = '', help='output file (default stdout)')
    parser.add_argument('--discard-insert', action='store_true', default=False, help='throw away inserts (default false)')
    parser.add_argument('--generate-config', action='store_true', default=False, help='generate config file containing auto-increment info (default false)')
    parser.add_argument('--config', type=str, default = './config.txt', help='where to store config file (default ./config.txt)')
    args = parser.parse_args()

    with open(args.input, 'r') as f:
        s = f.read()
#   s = s.replace(' AUTO_INCREMENT', '',)
    res = re.findall(r'^.*?$', s, re.M)
    s = ''
    config=dict()
    for v in res:
        #FIXME:do not support block comment!!!
        if len(v) == 0 or v[0:2] == '--' or v[0:2] == '/*' or v[0:4].lower() == 'drop'\
            or v[0:4].lower() == 'lock' or v[0:6].lower() == 'unlock'\
            or args.discard_insert and v[0:6].lower() == 'insert':
            continue
        old = v[:]
        last_is_create = last_create
        last_key_seen = key_seen
        last_in_create = in_create
        conv = convert(old)
        if not in_create and last_in_create and not last_key_seen:
            s = s[:-2] + ',\\\n  `start_ts` bigint(20) NOT NULL DEFAULT \'0\',\\\n  `end_ts` bigint(20) DEFAULT NULL\\\n'

        if in_create:
            conv = conv.replace(' unsigned', '')
            conv = conv.replace('COLLATE utf8_bin', 'COLLATE BINARY')
            conv = conv.replace('CHARACTER SET utf8 COLLATE utf8_unicode_ci', 'COLLATE NOCASE')
        if in_create and v.find("AUTO_INCREMENT") != -1:
            if not last_is_create:
                print('autoincrement not first column!!!!')
                assert(0)
            if config.get(table_name) != None:
                print(config[table_name])
                print(v)
                assert(0)
            id_col = re.findall(r'`(.*?)`', v)
            config[table_name] = id_col[0]
        if not in_create and s[-3] == ',':
            s = s[:-3] + '\\\n'
        s += conv

    s = s.replace(' AUTO_INCREMENT,', ',')
# FIXME this is not good, should use trigger, for now it's ok because only wiki has this table but wiki does not use it...
    s = s.replace(' ON UPDATE CURRENT_TIMESTAMP', '')
    s = re.sub(r'enum\(.*?\)', 'VARCHAR(32)', s, flags=re.I)
# sqlite does not support `column`(number), this will be interpreted as function call
    s = s.replace('`(255', '`')
    output = 'const char* init[] = {\n'+s[:-2]+'\n};'
    if len(args.output) == 0:
        print(output)
    else:
        with open(args.output, 'w') as f:
            f.write(output+'\n')

    if args.generate_config:
        with open(args.config, 'w') as f:
            f.write('# specify mode\n\nmode:normal\n\n\n')
            f.write('# autoincrement table:column pair\n\n')
            for k in config:
                f.write(k+':'+config[k]+'\n')

if __name__ == '__main__':
    main()
