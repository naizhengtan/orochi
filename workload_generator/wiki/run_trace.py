# -*- coding: utf-8 -*-
import requests, random, string, sys
import time

current_milli_time = lambda: int(round(time.time() * 1000000))

def parse_log(log):
    with open(log) as rf:
        content = rf.read()
    lines = content.split("\n")
    return lines

if len(sys.argv) != 3:
    print "Usage: replay.py <url> <log>"
    exit()

base_url = sys.argv[1]
log = sys.argv[2]

urls = parse_log(log)

start = current_milli_time()
session = requests.Session()
counter = 0
for suffix_url in urls:
    if suffix_url == "":
        continue
    tmp_url = base_url + "/" + suffix_url 

    print "--[" + str(counter) + "] Access " + tmp_url
    counter = counter + 1

    cur_start = current_milli_time()
    # depends on the replay_dump_output() using in record_lib
    ret = session.get(tmp_url)
    if ret.status_code != 200:
        print "     return code:" + str(ret.status_code)
        
        if ret.status_code == 404:
            #refresh
            session = requests.Session()
    cur_end = current_milli_time()
    print "  finished in " + str((cur_end - cur_start)/1000) + " ms\n"

    #time.sleep(0.01);

    # collect the result by ourselves (py script)

    # content = requests.get(tmp_url).text

    # ofile = output+"/r"+str(i)+".output"
    # with open(ofile, "w") as output_f:
    #     output_f.write(content.encode('utf8'))

end = current_milli_time()
print "finished in " + str((end - start)/1000) + " ms\n"
print "DONE"
