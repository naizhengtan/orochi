#!/usr/bin/python2

import os
import collections

skip = ['non_determ', 'output', 'session', 'submission']
result = []
folder = '/tmp/branch/'
for directories in os.listdir(folder):
    if directories in skip:
        continue
    result.append(len(os.listdir(folder + directories)))

print 'total # of CFG: ' + str(len(result))
counter = collections.Counter(result)
print '# of requests: ' + str(sum(result))
print '# of NSG: ' + str(len(result) - counter[1])
a = []
for k in counter:
    a.append((k, counter[k]))
a = sorted(a, key=lambda x:x[1])

for k in a:
    print(k)
