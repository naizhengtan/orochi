# -*- coding: utf-8 -*-
import requests, random, string, sys
import time, os

current_milli_time = lambda: int(round(time.time() * 1000000))

if len(sys.argv) != 3:
    print "Usage: verify.py <url> <batch_fail_file>"
    exit()

url = sys.argv[1]
fpath = sys.argv[2]

start = current_milli_time()

if not os.path.isfile(fpath):
    print "Warning: No file" + fpath
    exit()

with open(fpath, 'r') as rfile:
    data = rfile.read()

reqs = data.split(',')

for req in reqs: 
    if req == "":
        continue

    tmp_url = url+"/"+req
    print "-- Access " + tmp_url

    # depends on the replay_dump_output() using in record_lib
    r = requests.get(tmp_url)
    if r.status_code != 200:
        print "      return status code is " + str(r.status_code)

end = current_milli_time()

#with open("/tmp/veri/veri_runtime.log", 'a') as wf:
#    wf.write(str(end-start) + ",")

print "DONE verify run, cost " + str((end-start)/1000) + " ms"
