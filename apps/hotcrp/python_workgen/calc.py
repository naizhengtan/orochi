#!/usr/bin/python
import re

with open('/tmp/hhvm_clock.log','r') as f:
    s = f.read()
s = re.findall(r'^.+$', s, re.M)
s = sorted(map(float, s))
print(s[-1]-s[0])
