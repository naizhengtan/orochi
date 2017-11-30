#!/usr/bin/python

import re, sys, argparse, requests, time
import string, random, glob

def create_accounts(url, account_list):
    p = do_action(requests, "get", url)
    for account in account_list:
        payload = {
            'email': account,
            'password': '123',
            'action': 'new',
        }
        p = do_action(requests, "post", url, data = payload)
        print('registering ' + account)

def open_conf_payload():
    payload = {
        'sub_open': '1',
        'sub_blind': '2',
        'sub_reg': 'N/A',
        'sub_sub': 'N/A',
        'sub_grace': 'none',
        'sub_freeze': '0',
        'sub_nopapers': '0',
        'sub_pcconf': '1',
        'has_banal': '1',
        'has_sub_banal': '1',
        'sub_banal_papersize': 'N/A',
        'sub_banal_pagelimit': 'N/A',
        'sub_banal_textblock': 'N/A',
        'sub_banal_bodyfontsize': 'N/A',
        'sub_banal_bodyleading': 'N/A',
        'sub_banal_columns': 'N/A',
        'has_sub_pcconf': '1',
        'has_sub_pcconfsel': '1',
        'has_sub_collab': '1',
        'has_pc_seeall': '1',
        'update': 'Save changes'
    }
    return payload

def random_string(size=6, chars=string.ascii_uppercase + string.digits + string.ascii_lowercase):
    return ''.join(random.choice(chars) for _ in range(size))

def read_user_list(user_file):
    with open(user_file, 'r') as f:
        user_list = f.read()
    return re.findall(r'^.+$', user_list, re.M)

def login_payload(email):
    payload = {
        'email': email,
        'password': '123',
        'action': 'login',
        'signin': 'Sign in'
    }
    return payload

def paper_payload(paper):
    payload = {
        'title': 'My Paper',
        'abstract': 'My short abstract',
        'auname1': 'Curtis Li',
        'auemail1': 'fake@email.com',
        'auaff1': 'NYU',
        'paperUpload': paper,
        'submitpaper': '1',
        'update': 'Save changes'
    }
    return payload

def edit_payload(email):
    contact = email.replace('@','_40')
    contact = 'contact_'+contact.replace('.', '_2e')
    payload = {
        'title': 'My paper',
        'auname1': 'Lingfan Yu',
        'auemail1': 'fake@email.com',
        'auaff1': 'NYU',
        'abstract': random_string(30),
        contact: email,
        'submitpaper': '1',
        'update': 'Save changes'
    }
    return payload


def do_action(sess, action, *args, **kwargs):
    action = action.lower()
    if action == "post":
        ret = sess.post(*args, **kwargs)
    elif action == "get":
        ret = sess.get(*args, **kwargs)
    else:
        print("unknown action in do_action\n")
        exit(-1)
    return ret

def get_sid(sess):
    sid = sess.cookies.get('hotcrp')
    if len(sid) > 16:
        sid = sid[8:]
    return sid[:8]

def get_paper_list(s):
    res = re.findall(r'a href="paper/(\d+)"', s)
    return list(set(res))

def review_payload():
    payload = {
        'version': '1',
        'submitreview': 'Submit review',
        'overAllMerit': '3',
        'reviewerQualification': '3',
        'paperSummary': random_string(50),
        'commentsToAuthor': random_string(200),
        'commentsToPC': random_string(200)
    }
    return payload

def viewpage(sess, repeat, base_url):
    pageviewing = ["profile", "help", "", "users?t=pc", "search?q="]
    for i in range(repeat):
        url = base_url + '/' + pageviewing[i % len(pageviewing)]
        p = do_action(sess, "get", url)

def main():
# parse arguments
    parser = argparse.ArgumentParser(description = "hotcrp workload generator")
    parser.add_argument('--url', type=str, default='http://localhost:4000', help='hotcrp site location, default http://localhost:4000')
    parser.add_argument('--module', type=str, metavar='[register|admin|users|pc]', default='', help='use module of different roles')
    parser.add_argument('--action', type=str, metavar='[create-user|open-conf|submit|view|review]', default='', help='specific user actions')
    parser.add_argument('--num-user', type=int, metavar='N', default=0, help='number of users to create')
    parser.add_argument('--users', type=str, default='', help='create users from file')
    parser.add_argument('--papers', type=str, default='', help='directory where papers are')
    parser.add_argument('--seed', type=int, default=1, help='random seed')
    parser.add_argument('--repeat', type=int, default=0, help='# of times to repeat edit or view action')
    parser.add_argument('--output', type=str, default='output.txt', help='file to store n2n request time')
    args = parser.parse_args()

    random.seed(args.seed)

    if args.module == "register": # previous create-users.js
        if args.num_user > 0:
            user_list = ['user{}@email.com'.format(i) for i in range(args.num_user)]
        else:
            user_list = read_user_list(args.users)
        create_accounts(args.url, user_list)
        # write created users back to file
        with open(args.users, 'w') as f:
            for v in user_list:
                f.write(v+"\n")

    elif args.module == "admin": # previous admin-settings.js
        do_action(requests, "get", args.url)
        with requests.Session() as sess:
            do_action(sess, "post", args.url, data = login_payload('admin@nyu.edu'))
            sid = get_sid(sess)
            if args.action == "open-conf":
                target_url = args.url + '/settings/sub'
                do_action(sess, "get", target_url)
                print("open conference")
                payload = open_conf_payload()
                params = {'post' : sid}
                p = sess.post(target_url, data = payload, params = params)

    elif args.module == "users": # previous users.js
        do_action(requests, "get", args.url)
        papers = glob.glob(args.papers + "/*.pdf")
        user_list = read_user_list(args.users)
        for user in user_list:
            with requests.Session() as sess:
                do_action(sess, "get", args.url)
                do_action(sess, "post", args.url, data = login_payload(user))
                # hotcrp needs session id in url
                sid = get_sid(sess)

                # submit and then edit page
                if args.action == "submit":
                    do_action(sess, "get", args.url + "/paper.php/new")
                    print("{} submit and edit paper".format(user))
                    paper = papers[random.randint(0, len(papers) - 1)]
                    payload = paper_payload(paper)
                    # submit
                    p = do_action(sess, "post", args.url + '/paper/new/edit?post=' + sid, data = payload,files = {'paperUpload': (paper, open(paper, 'rb'), 'application/pdf')})
                    edit_url = p.url
#                    p = do_action(sess, "get", edit_url)
                    # edit
                    for i in range(args.repeat):
                        do_action(sess, "get", edit_url)
                        payload = edit_payload(user)
                        url = edit_url+'?post='+sid
                        p = do_action(sess, "post", url, data = payload)
#                        p = do_action(sess, "get", edit_url)
                # view pages:
                elif args.action == "view":
                    print("{} view page".format(user))
                    viewpage(sess, args.repeat, args.url)
                else:
                    print("Unknown action " + args.action)
                    exit(-1)

    elif args.module == "pc": # previous pc.js
        do_action(requests, "get", args.url)
        for i in range(args.num_user):
            pc = "pc{}@email.com".format(i)
            with requests.Session() as sess:
                do_action(sess, "get", args.url)
                p = do_action(sess, "post", args.url, data = login_payload(pc))
                sid = get_sid(sess)
                if args.action == "review":
                    print("{} review paper".format(pc))
                    paper_list = get_paper_list(p.text)
                    params = {
                        'm': 're',
                        'post': sid,
                        'ls': '1'
                    }
                    for paper in paper_list:
                        params['re']=paper
                        for _ in range(args.repeat):
                            do_action(sess, "get", args.url + '/paper/' + paper)
                            p = do_action(sess, "post", args.url + '/review/' + paper, params = params, data = review_payload())
                            do_action(sess, "get", args.url + '/review/' + paper, params = {'m':'re'})

                elif args.action == "view":
                    print("{} view page".format(pc))
                    viewpage(sess, args.repeat, args.url)
                else:
                    print("Unknown action " + args.action)
                    exit(-1)

    else:
        print("Unknown module!")
        exit(-1)

if __name__ == '__main__':
    main()
