#!/bin/bash

DB_NAME="hotcrp"
DB_USER="root"
DB_PASS="715715"

CREATE_DB="/home/ylf/orochi/hotcrp/lib/createdb.sh"
WORKLOAD="/home/ylf/orochi/lingfan_workload/new_hotcrp_workgen.py"

PAPER_FD="/home/ylf/orochi/lingfan_workload/submissions"

TEMP_PASSWD_FILE=$(mktemp /tmp/hotcrp-password-XXXXXX)
TEMP_USER_LIST=$(mktemp /tmp/hotcrp-userlist-XXXXXX)
HHVM_CLOCK="/tmp/hhvm_clock.log"
CALC_SCRIPT="./calc.py"

URL='http://216.165.71.216:4000' # do not add / at the end of base url, or hotcrp might fail because it's unable to understand // 
NUM_USER=20
NUM_EDIT=20
NUM_PAGE=100
NUM_PC=2
NUM_REVIEW=20

function fail {
    echo fail $@
    exit -1
}

function remove {
    for var in "$@"; do
        if [ -f $var ]; then
            rm $var
        fi
    done
}

function usage {
    echo "Usage: $0 [normal|record]"
    exit -1
}

function finish {
    remove $TEMP_USER_LIST $TEMP_PASSWD_FILE
}

trap finish EXIT

lingfan reset hhvmt
lingfan restart hhvmt

# (1) recreate hotcrp database
$CREATE_DB -u$DB_USER -p$DB_PASS $DB_NAME || fail "recreating database"

# (2.1) create admin
echo "admin@nyu.edu" > $TEMP_USER_LIST
$WORKLOAD --url=$URL --module=register --users=$TEMP_USER_LIST|| fail "create admin"

# (2.2) creating users
$WORKLOAD --url=$URL --module=register --action=create-user --num-user=$NUM_USER --users=$TEMP_USER_LIST || fail "create users"

# (3) update password
echo 'update ContactInfo set password="123"' > $TEMP_PASSWD_FILE
mysql -u$DB_USER -p$DB_PASS $DB_NAME < $TEMP_PASSWD_FILE || fail "update password"

# (4) admin open conference
$WORKLOAD --url=$URL --module=admin --action=open-conf || fail "open conference"

# (5) user submit and edit
$WORKLOAD --url=$URL --module=users --users=$TEMP_USER_LIST --action=submit --papers=$PAPER_FD --repeat=$NUM_EDIT || fail "submit edit papers"

# (6) create PC accounts & update passwords
casperjs admin-setting.js --url=$URL --action=create-pc --num=$NUM_PC || fail "create pc"
mysql -u$DB_USER -p$DB_PASS $DB_NAME < $TEMP_PASSWD_FILE || fail "update password"
rm $TEMP_PASSWD_FILE

# (7) open review & assign papers
casperjs admin-setting.js --url=$URL --action=open-review || fail "open review"
casperjs admin-setting.js --url=$URL --action=assign-paper || fail "assign paper"

# (8) login as PC and review
$WORKLOAD --url=$URL --module=pc --num-user=$NUM_PC --action=review --repeat=$NUM_REVIEW || fail "review papers"

# (9.1) user view pages
$WORKLOAD --url=$URL --module=users --users=$TEMP_USER_LIST --action=view --repeat=$NUM_PAGE || fail "view pages"

# (9.2) pc read
$WORKLOAD --url=$URL --module=pc --num-user=$NUM_PC --action=view --repeat=$NUM_PAGE|| fail "view pages"

$CALC_SCRIPT
