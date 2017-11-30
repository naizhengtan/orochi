#!/usr/bin/python
from __future__ import print_function

import requests, argparse, sys, re, time

# print http get content
def print_result(s):
    with open('/tmp/phpbb.html', 'w') as f:
        f.write(s.encode('utf8'))

def do_action(sess, action, *args, **kwargs):
    action = action.lower()
    if action == "post":
        ret = sess.post(*args, **kwargs)
        if ret.status_code != 200:
            print("return code: " + str(ret.status_code))
    elif action == "get":
        ret = sess.get(*args, **kwargs)
        if ret.status_code != 200:
            print("not correct" + str(ret.status_code))
    else:
        print("unknown action in do_action\n", file=sys.stderr)
        exit(-1)
    print_result(ret.text)
    return ret

def main():
# parse argument
    parser = argparse.ArgumentParser(description = "phpbb workload generator")
    parser.add_argument('--user', type=str, default='guest', help='user name (default guest)')
    parser.add_argument('--password', type=str, default='abcd1234', help='user password')
    parser.add_argument('--url', type=str, default='http://localhost:8089/', help='phpbb site location, (default http://localhost:8089/)')
    parser.add_argument('--zipfian', type=str, default='', help='phpbb zipfian distribution file')
    args = parser.parse_args()

# read zipfian distribution
    with open(args.zipfian, 'r') as f:
        zipfian = f.read()
    zipfian = re.findall(r'^.+$', zipfian, re.M)

# url common part
    thread_url = args.url + '/viewtopic.php?f=2&t='

    if args.user != "guest":
        # request session and login
        with requests.Session() as sess:
            payload = {
                'username': args.user,
                'password': args.password,
                'login': 'Login'
            }
            login_url = args.url + '/ucp.php?mode=login'
            do_action(sess, "get", login_url)
            p = do_action(sess, "post", login_url, data = payload)

            # read posts
            for post in zipfian:
                page = thread_url + post
                p = do_action(sess, "get", page)
    else:
        for post in zipfian:
            page = thread_url + post
            p = do_action(requests, "get", page)


if __name__ == '__main__':
    main()
