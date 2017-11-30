#!/bin/bash

if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: environment ORO_HOME is not defined"
  exit 1
fi

function fail {
  echo "ERROR: fail during $1, please see related step in detailed_instructions.txt"
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

set -x
# (1) Fetch the submodules
STEP="(1) Fetch the submodules"

cd $ORO_HOME || fail "$STEP" 
git submodule init || fail "$STEP"
git submodule update || fail "$STEP"


# (2) build HHVM-verifier (i.e. "acc-PHP" in paper)
STEP="(2) build HHVM-verifier"

sudo apt-get -y install autoconf automake binutils-dev bison build-essential cmake g++ gawk git \
  libboost-dev libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev \
  libboost-system-dev libboost-thread-dev libboost-context-dev libbz2-dev libc-client-dev libldap2-dev \
  libc-client2007e-dev libcap-dev libcurl4-openssl-dev libdwarf-dev libelf-dev \
  libexpat-dev libgd2-xpm-dev libgoogle-glog-dev libgoogle-perftools-dev libicu-dev \
  libjemalloc-dev libmcrypt-dev libmemcached-dev libmysqlclient-dev libncurses-dev \
  libonig-dev libpcre3-dev libreadline-dev libtbb-dev libtool libxml2-dev zlib1g-dev \
  libevent-dev libmagickwand-dev libinotifytools0-dev libiconv-hook-dev libedit-dev \
  libiberty-dev libxslt1-dev ocaml-native-compilers libsqlite3-dev libyaml-dev libgmp3-dev \
  gperf libkrb5-dev libnotify-dev libpq-dev || fail "$STEP"

cd $ORO_HOME/hhvm-verifier || fail "$STEP"
git submodule update --init --recursive || fail "$STEP"
cmake -DMYSQL_UNIX_SOCK_ADDR=/var/run/mysqld/mysqld.sock . || fail "$STEP"
make -j$NUM_CORE || fail "$STEP"

sudo rm -f /usr/bin/hhvmm
sudo ln -s $ORO_HOME/hhvm-verifier/hphp/hhvm/hhvm /usr/bin/hhvmm || fail "$STEP"

# (3) build original HHVM (HHVM-vanilla)
STEP= "(3) build original HHVM (HHVM-vanilla)"
cd $ORO_HOME  || fail "$STEP"
if [ ! -e $ORO_HOME/hhvm-vanilla ]; then
  git clone https://github.com/facebook/hhvm.git hhvm-vanilla || fail "$STEP"
fi
cd hhvm-vanilla || fail "$STEP"
if [ $( git rev-parse --abbrev-ref HEAD ) != "vanilla" ]; then
  git branch -d vanilla
  git checkout -b vanilla 436794d6b503970bba452eefca5133427e72ecba || fail "$STEP"
fi
git submodule update --init --recursive || fail "$STEP"
cmake -DMYSQL_UNIX_SOCK_ADDR=/var/run/mysqld/mysqld.sock . || fail "$STEP"
make -j$NUM_CORE || fail "$STEP"

sudo rm -f /usr/bin/hhvm
sudo ln -s $ORO_HOME/hhvm-vanilla/hphp/hhvm/hhvm /usr/bin/hhvm || fail "$STEP"

# (4) build original MySQL database
STEP="add user mysql"
sudo adduser --disabled-password --gecos "" mysql 2>/dev/null
sudo mkdir /var/lib/mysql/
sudo chown -R mysql /var/lib/mysql/

# provide correct permission
(
f=$ORO_HOME
while [[ $f != "/" ]]; do
  sudo chmod +x $f; f=$(dirname $f)
done
)

STEP="(4) build original MySQL database"
cd $ORO_HOME/mysql-log || fail "$STEP"
if [ $( git rev-parse --abbrev-ref HEAD ) != "vanilla" ]; then
  git branch -d vanilla
  git checkout -b vanilla eada4d562bda506163131233700ce5bdc0703a8f || fail "$STEP"
fi

rm -rf $ORO_HOME/mysql-vanilla-bin/data
mkdir build_vanilla
cd build_vanilla || fail "$STEP"
cmake .. -DCMAKE_INSTALL_PREFIX=$ORO_HOME/mysql-vanilla-bin/ || fail "$STEP"
make -j$NUM_CORE || fail "$STEP"
make install || fail "$STEP"

cd $ORO_HOME/mysql-vanilla-bin/ || fail "$STEP"
cp ../config/mysql/my_vanilla.cnf my.cnf || fail "$STEP"
# Replace "OROCHI/REPO/" with the absolute path to Orochi root in file "my.cnf".
ESCAPE_HOME=$( echo $ORO_HOME | sed "s/\//\\\\\//g" )
sed -ie "s/OROCHI\/REPO/$ESCAPE_HOME/g" my.cnf || fail "$STEP"

# stop all running mysql
sudo killall mysqld
sleep 1

cd $ORO_HOME/mysql-vanilla-bin/ || fail "$STEP"
#sudo ./scripts/mysql_install_db --force --defaults-file=./my.cnf --user=mysql || fail "$STEP"
sudo ./scripts/mysql_install_db --defaults-file=./my.cnf --user=mysql || fail "$STEP"
#sudo chown -R mysql $ORO_HOME/mysql-vanilla-bin/data

sudo ./bin/mysqld_safe --defaults-file=./my.cnf --user=mysql &
sleep 5
./bin/mysqladmin --defaults-file=./my.cnf -u root password 'news123' || fail "$STEP"

# (5) build other Orochi verification pieces
STEP="(5) build other Orochi verification pieces"

cd $ORO_HOME/veri_tools/odiff || fail "$STEP"
make || fail "$STEP"
cd $ORO_HOME/veri_tools/process_hint || fail "$STEP"
make || fail "$STEP"
