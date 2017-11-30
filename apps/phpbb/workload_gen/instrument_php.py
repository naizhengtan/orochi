import sys, re

# TODO: there is mysqli->insert_id/mysqli->warning_count

def main (argv):
    if len(argv) != 2:
        print "usage: " + argv[0] + " <php-file>"
        exit(1)

    phpfile = argv[1]
    nd_func = ["microtime", "mktime", "mt_rand", "openssl_random_pseudo_bytes", "session_id",
        "time", "is_uploaded_file", "mysqli_insert_id",
        # previous is hotcrp, following is wiki
        "array_rand", "date", "date_create", "gmdate", "getmypid", "session_regenerate_id",
        # suspicioius:
        #"getrusage", "gethostbynamel", "stream_select", "tempnam",
        ]

    re_patterns = []
    for func in nd_func:
        re_patterns.append("[^\w]"+func+"[\s]*\(");

    # read the content
    with open(phpfile, 'r') as rf:
        buf = rf.read()

    r_compiled = []
    for pattern in re_patterns:
        r = re.compile(pattern, re.IGNORECASE)
        r_compiled.append(r)

    nd_replace_func = []
    nd_origin_func = []
    for i in range(len(r_compiled)): 
        r = r_compiled[i]
        orig = nd_func[i]
        for m in r.finditer(buf):
                if m.group(0) not in nd_replace_func: 
                        nd_replace_func.append(m.group(0))
                        nd_origin_func.append(orig)

    print nd_replace_func
    # replace
    for i in range(len(nd_replace_func)):
        replace = nd_replace_func[i]
        orig = nd_origin_func[i]
        buf = buf.replace(replace, replace[0]+"cheng_"+orig+"(")
        print "    \"" + replace + "\" => \"" + replace[0]+"cheng_"+orig+"(\""

    # write it back
    with open(phpfile, "w") as fp: fp.write(buf)

if __name__ == "__main__":
    main(sys.argv)

