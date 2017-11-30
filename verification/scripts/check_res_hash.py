import os, re, hashlib, sys
import argparse

def cheng_assert(cond, msg=""):
    if not cond:
        print("ERROR: " + msg + "\n")
        sys.exit(1)

def get_file_name(url_path):
    # /scripts/script.js?mtime=1490393114
    tokens = url_path.split('?')
    return tokens[0]

# example:
# #&#
# /scripts/script.js?mtime=1490393114
# 200
# ac58ef325e57872b8fc0897673fec052
def parse_log(log):
    ret = {}
    with open(log, 'r') as rf:
        contents = rf.read()

    entries = contents.split("#&#")

    for entry in entries:
        entry = entry.strip()
        if entry == "":
            continue
        lines = entry.split() # by line
        cheng_assert(len(lines) == 3, "The entry is ill-formated: " + entry)

        url_path = lines[0].strip()
        code = lines[1].strip()
        f_hash = lines[2].strip()

        if code != "200":
            # some reason, like the file is not changed
            # whatever, it doesn't return the file, skip
            continue

        file_name = get_file_name(url_path)

        if file_name in ret:
            cheng_assert(f_hash == ret[file_name], "The hash mismatch!")
        else:
            ret[file_name] = f_hash

    return ret

def get_md5_hash(f_path):
    cheng_assert(os.path.exists(f_path), "file doesn't exist: " + f_path)
    with open(f_path, 'rb') as rf:
        content = rf.read()

    m = hashlib.md5()
    m.update(content)
    res_hash = m.hexdigest()

    return str(res_hash)

def compare_hash_to_files(resources, root):
    for f_name in resources:
        f_path = root + f_name
        real_hash = get_md5_hash(f_path)
        if real_hash != resources[f_name]:
            return False
        else:
            print("file " + f_path + " is good on hash " + real_hash)

    return True


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--resource', type=str, default='/tmp/trace_res.log', help='the trace_res.log') 
    parser.add_argument('--root', required=True, type=str, help='the root of the app')
    argv = parser.parse_args()

    log = argv.resource 
    root = argv.root

    if not os.path.exists(log):
        # since there is no resources, we just quit
        print "PASS! No resources"
        sys.exit(0)

    # resources = { "image/xx.png" => hash, ...}
    resources = parse_log(log)
    are_same = compare_hash_to_files(resources, root)

    if are_same:
        print "PASS!"
    else:
        print "FAIL!"
        sys.exit(1)


if __name__ == "__main__":
    main()
