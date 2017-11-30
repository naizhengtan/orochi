# -*- coding: utf-8 -*-
import requests, random, string, sys
import time

current_milli_time = lambda: int(round(time.time() * 1000000))

def GetErrReq():
    err_req = []
    try:
        with open("/tmp/fail-php.txt") as f:
            lines = f.readlines()
            # line: m1234.php
            for line in lines:
                num = int(line[1:-5])
                err_req.append(num)
    except:
        print "No /tmp/fail-php.txt"

    return err_req

if len(sys.argv) != 5:
    print "Usage: verify.py [m|r] <url> <req_start_no> <req_end_no>"
    exit()

prefix = sys.argv[1]
url = sys.argv[2]
start_no = int(sys.argv[3])
end_no = int(sys.argv[4])
print "Will replay on URL "+url+" from r" +str(start_no)+ " - r" + str(end_no)

# hotcrp, feb-5w:
# error_req=[3,411,369,637,708,723,818,844]
# hotcrp, final-syntetic:
# error_req=[144, 451, 486, 649]
# 10k wiki
#error_req=[51,152]
# 20k wiki
#error_req=[100,295,322]
# 100k wiki
#error_req=[1394,1403, 251,506, 803, 804, 831]
error_req = GetErrReq()
print "skip error req: "
print error_req

start = current_milli_time()
#for i in reversed(range(start_no, end_no+1)):
for i in range(start_no, end_no+1):
#for i in range(end_no, start_no-1, -1):
#array = [1, 2, 3, 4, 5, 6, 7, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 8, 10, 20, 21, 26, 22, 23, 24, 25, 27, 28]
#for i in array:
    if i in error_req:
        continue
    tmp_url = url+"/"+prefix+str(i)+".php"
    print "-- Access " + tmp_url

    req_start = current_milli_time()
    # depends on the replay_dump_output() using in record_lib
    r = requests.get(tmp_url)
    req_end = current_milli_time()
    #with open("/tmp/veri/result.log", 'a') as wf:
    #    wf.write("\n------"+tmp_url+"--------\n");
    #    wf.write(r.content)
    if r.status_code != 200:
        print "      return status code is " + str(r.status_code)
    print "    time: " + str((req_end - req_start)/1000)

end = current_milli_time()

#with open("/tmp/veri/veri_runtime.log", 'a') as wf:
#    wf.write(str(end-start) + ",")

print "DONE verify run, cost " + str(end-start) + " ms"
