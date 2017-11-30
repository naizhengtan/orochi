import sys, os

def main(argv):
    if len(argv) != 3:
        print "Usage: " + argv[0] + " <comma|newline> <run_time.log>"
        exit(1)

    type_log = argv[1]
    f1 = argv[2]
    if not os.path.exists(f1):
        print "Error: " + f1 + " doesnot exist"
        exit(1)
    with open(f1,'r') as rf:
        content = rf.read()

    if type_log == "comma":
        total_time_ms = 0
        times = content.split(',')
        for t in times:
            if (t != ''):
                total_time_ms += float(t)
        # in ms
        print int(total_time_ms)
    elif type_log == "newline":
        # this is for Nginx whose log is like
        # "xxxxx"==>0.234\n
        total_time_s = 0
        entries = content.split('\n')
        for entry in entries:
            if (entry != ''):
                time_in_s = entry.split("==>")[1]
                total_time_s += float(time_in_s) - 0.001
        # in ms
        print int(total_time_s*1000)

if __name__ == "__main__":
    main(sys.argv)
