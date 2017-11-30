#!/bin/bash

if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: environment ORO_HOME is not defined"
  exit 1
fi

function failconfig {
  echo "ERROR: failconfig during $1, please see related step in detailed_instructions.txt"
  exit 1
}

function versioncheck {
  VERSION=$( lsb_release -r | cut -d: -f2 | xargs )
  if [ "$VERSION" != "14.04" ]; then
    echo "WARNING: current linux distribution has not been evaluated."
    echo "         Packages/libraries/commands might not work properly."
    echo "         Please see detailed_instructions.txt to build Orochi on your own."
    exit
  fi
}

# check linux version
versioncheck
NUM_CORE=$( grep -c ^processor /proc/cpuinfo )

. $ORO_HOME/env.sh

set -x


# (1) build HHVM-log
STEP="(1) build HHVM-log"

cd $ORO_HOME/hhvm-log || failconfig "$STEP"
git submodule update --init --recursive || failconfig "$STEP"
cmake -DMYSQL_UNIX_SOCK_ADDR=/var/run/mysqld/mysqld.sock . || failconfig "$STEP"
make -j$NUM_CORE || failconfig "$STEP"

sudo rm -f /usr/bin/hhvmt
sudo ln -s $ORO_HOME/hhvm-log/hphp/hhvm/hhvm /usr/bin/hhvmt || failconfig "$STEP"


# (2) install CasperJS[4]
STEP="(2) install CasperJS"

cd $ORO_HOME || failconfig "$STEP"

# phantomjs
mkdir phantomjs
wget -O phantomjs.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 || failconfig "$STEP"
tar xf phantomjs.tar.bz2 -C phantomjs/ --strip-components=1 || failconfig "$STEP"
rm -f /usr/bin/phantomjs
sudo ln -sf $ORO_HOME/phantomjs/bin/phantomjs /usr/bin/phantomjs || failconfig "$STEP"
phantomjs --version || failconfig "$STEP"

# casperjs
rm -rf ./casperjs/
git clone git://github.com/casperjs/casperjs.git || failconfig "$STEP"
rm -f /usr/bin/casperjs
sudo ln -sf $ORO_HOME/casperjs/bin/casperjs /usr/bin/casperjs || failconfig "$STEP"
$CASPERJS --version || failconfig "$STEP"

# (3) build MySQL-log
STEP="(3) build MySQL-log"


cd $ORO_HOME/mysql-log || failconfig "$STEP"
if [ $( git rev-parse --abbrev-ref HEAD ) != "master" ]; then
  git checkout master || failconfig "$STEP"
fi

rm -rf $ORO_HOME/mysql-log-bin/data
mkdir build_log 
cd build_vanilla || failconfig "$STEP"
cmake .. -DCMAKE_INSTALL_PREFIX=$ORO_HOME/mysql-log-bin/ || failconfig "$STEP"
make -j$NUM_CORE || failconfig "$STEP"
make install || failconfig "$STEP"

cd $ORO_HOME/mysql-log-bin/ || failconfig "$STEP"
cp ../config/mysql/my_log.cnf my.cnf || failconfig "$STEP"
# Replace "OROCHI/REPO/" with the absolute path to Orochi root in file "my.cnf".
ESCAPE_HOME=$( echo $ORO_HOME | sed "s/\//\\\\\//g" )
sed -ie "s/OROCHI\/REPO/$ESCAPE_HOME/g" my.cnf || failconfig "$STEP"

#  Setup the database:
#  Note: if there is mysqld running, kill it.
# stop all running mysql
sudo killall mysqld
sleep 1

cd $ORO_HOME/mysql-log-bin/ || failconfig "$STEP"
sudo ./scripts/mysql_install_db --defaults-file=./my.cnf --user=mysql || failconfig "$STEP"
sudo ./bin/mysqld_safe --defaults-file=./my.cnf --user=mysql &
sleep 5
./bin/mysqladmin --defaults-file=./my.cnf -u root password 'news123' || failconfig "$STEP"

#  Prepare for apps:
#    HotCRP
echo "CREATE USER 'hotcrp_dbuser'@'localhost' IDENTIFIED BY '123456'" |\
  mysql -uroot -pnews123 || failconfig "$STEP"

#    phpbb
echo "CREATE DATABASE phpbb" | mysql -uroot -pnews123 || failconfig "$STEP"

#    wiki
cd $ORO_HOME/apps/database
./download_insert_db.sh wiki_labs

