import threading, requests, sys, time


def parse_log(log):
    with open(log, "r") as rf:
        content = rf.read()
    all_urls = content.split('\n')
    return all_urls

def send_request(base_url, n, urls):
    current_micro_time = lambda: int(round(time.time()*1000000))
    counter = 0
    session = requests.Session()
    total_time = 0
    for tmp_url in urls:
        if tmp_url == "":
            continue
        tmp_url = base_url + tmp_url 
        
        counter += 1

        start = current_micro_time()        
        ret = session.get(tmp_url)
        #ret = requests.get(tmp_url)
        end = current_micro_time()

        print "--[" + str(n) + ", " +  str(counter) + "] Access " + tmp_url + "\n\treturn code:" + str(ret.status_code) + "\n"
        if ret.status_code != 200:
            print "--[" + str(n) + ", " +  str(counter) + "] Access " + tmp_url + "\n\treturn code:" + str(ret.status_code) + "\n"
            if ret.status_code == 404:
                session = requests.Session()
        print "    time: " + str((end - start)/1000) + " ms"


def main():
    if len(sys.argv) != 4:
        print "Usage: multi_run_trace <url> <log> <#clients>"
        sys.exit(0)

    base_url = sys.argv[1] + "/"
    log = sys.argv[2]
    nclnts = int(sys.argv[3])
    all_threads = []

    all_urls = parse_log(log)

    # warming up, run first 20 urls
    send_request(base_url, 0, all_urls[:10])
    all_urls = all_urls[10:]

    upc = len(all_urls)  // nclnts     # url per client

    for i in range(nclnts):
        
        if i == nclnts-1:
            urls = all_urls[i*upc:]
        else:
            urls = all_urls[i*upc : (i+1)*upc]

        t = threading.Thread(target=send_request, args=(base_url, i, urls))
        t.start()
        all_threads.append(t)

    for t in all_threads:
        t.join()

if __name__ == "__main__":
    main()

