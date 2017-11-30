import sys, os

def main(argv):
    if len(argv) != 2:
        print "Usage: " + argv[0] + " <run_time.log>"
        exit(1)

    f1 = argv[1]
    if not os.path.exists(f1):
        #print "Error: " + f1 + " doesnot exist"
        exit(1)
    with open(f1,'r') as rf:
        content = rf.read()

    total_time = 0
    times = content.split(',')
    for t in times:
        if (t != ''):
            total_time += int(t)
    print total_time/1000

if __name__ == "__main__":
    main(sys.argv)
