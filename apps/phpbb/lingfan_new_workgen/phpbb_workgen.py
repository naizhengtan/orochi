#!/usr/bin/python

import requests, argparse, sys, re

# print http get content
def print_result(s):
    with open('/usr/share/nginx/html/result.html', 'w') as f:
        f.write(s.encode('utf8'))

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
            p = sess.post(login_url, data = payload)

            # read posts
            for post in zipfian:
                page = thread_url + post
                p = sess.get(page)
                print(page)
                print(p.status_code)
    else:
        for post in zipfian:
            page = thread_url + post
            p = requests.get(page)
            print(page)
            print(p.status_code)


if __name__ == '__main__':
    main()
