#!/bin/bash
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
VERSION=$( lsb_release -r | cut -d: -f2 | xargs )

NUM_CORE=$( grep -c ^processor /proc/cpuinfo )

# stop nginx if exists
sudo service nginx stop

set -x

# (1) install useful tools
STEP="(1) install useful tools"
echo "[INFO] $STEP"
sudo apt-get -y install git sed wget mysql-client python-pip python-dev build-essential || fail "$STEP"
sudo pip install requests || fail "$STEP"

# (2) install Nginx[1]
STEP="(2) install Nginx"
echo "[INFO] $STEP"
sudo apt-get -y install nginx || fail "$STEP"

# (3) install openresty[2]
STEP="(3) install openresty"
echo "[INFO] $STEP"

sudo service nginx stop || fail "$STEP"

wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add - || fail "$STEP"
sudo apt-get -y install software-properties-common || fail "$STEP"
sudo add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main" || fail "$STEP"
sudo apt-get update || fail "$STEP"
sudo apt-get -y install openresty || fail "$STEP"
    
# (4) install php5 HTTP module[3]
STEP="(4) install php5 HTTP module"
echo "[INFO] $STEP"
# 14.04
if [ "$VERSION" == "14.04" ]; then
  sudo apt-get -y install php-pear php5-dev libcurl3-openssl-dev || fail "$STEP"
  sudo pecl install pecl_http-1.7.6 || fail "$STEP"
  # Insert "extension=http.so" to file "php.ini".
  sudo sed -i '$ a\
extension=http.so' /etc/php5/cli/php.ini || fail "$STEP"
fi
# 16.04
# will never be here
if [ "$VERSION" == "16.04" ]; then
  sudo apt-get -y install php php-dev zlib1g-dev php-pecl-http

  # php5
  ## sudo apt-get install software-properties-common python-software-properties
  #sudo add-apt-repository ppa:ondrej/php || fail "$STEP"
  #sudo apt-get update || fail "$STEP"
  #sudo apt-get install php5.6 php5.6-http
  ##sudo apt-get install php5.6 php5.6-dev php5.6-sqlite3 php5.6-xml php5.6-http || fail "$STEP"
  ## pear 1.9.4
  #sudo apt-get install php-pear  libcurl4-openssl-dev zlib1g-dev || fail "$STEP"
  #sudo pear install --force PEAR-1.9.4 || fail "$STEP"

  # build from source
  #wget http://php.net/get/php-5.5.38.tar.gz/from/this/mirror -O php-5.5.38.tar.gz
  #tar xf php-5.5.38.tar.gz
  #cd php-5.5.38/
  ## for build php
  #sudo apt-get install libxml2-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libxpm-dev\
  #  libmysqlclient-dev libpq-dev libicu-dev libfreetype6-dev libldap2-dev libxslt-dev build-essential
  ## config
  #./configure --prefix=/usr/share/php --enable-mbstring --with-curl --with-openssl --with-xmlrpc \
  #  --enable-soap --enable-zip --with-gd --with-jpeg-dir --with-png-dir --with-mysql --with-pgsql \
  #  --enable-embedded-mysqli --with-freetype-dir --with-ldap --enable-intl --with-xsl
  ## make
  #make -j$NUM_CORE
fi

# (5) install nodejs
STEP="(5) install nodejs"
echo "[INFO] $STEP"
sudo apt-get -y install nodejs || fail "$STEP"

# (6) install TCMalloc[8]
STEP="(6) install TCMalloc"
echo "[INFO] $STEP"
sudo apt-get -y install google-perftools || fail "$STEP"
