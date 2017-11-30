#!/usr/bin/python3
import re
import os.path

reask_question = False

def dumpfile(b, result):
    with open(result, 'w') as f:
        for k in b:
            f.write('{}:{}\n'.format(k,b[k]))

c = set(["microtime", "mktime", "mt_rand", "openssl_random_pseudo_bytes", "session_id",
        "time", "is_uploaded_file", "mysqli_insert_id",
        "array_rand", "date", "date_create", "gmdate", "getmypid", "session_regenerate_id"])

result_file = 'result.txt'
b = dict()
if os.path.isfile(result_file):
    with open(result_file, 'r') as f:
        s = f.read()
    res = re.findall(r'^(.*?):(.*)$', s, re.M)
    for v in res:
        b[v[0]]=v[1]
with open('builtin.log', 'r') as f:
    s = f.read()
res = re.findall(r'FCallBuiltin .*? "(.*?)"', s)
a = set()
for v in res:
    a.add(v)
a = sorted(list(a))
for v in a:
    if v in c:
        b[v]='R'
        continue
    if b.get(v) != None and not (b[v] == '?' and reask_question):
        continue
    reply = ''
    while reply!='y' and reply!='n' and reply!='?' and reply!='q':
        reply = input(v + ' : ')
    if reply=='q':
        dumpfile(b,result_file)
        exit(0)
    else:
        b[v]=reply
dumpfile(b,result_file)

