All the instructions have been tested under Ubuntu14.04.

Preparation
-----------

In order to run Orochi, several software/libraries need to be installed.
They are:

  * Nginx
  * openresty
  * nodejs
  * TCMalloc
  * php5 HTTP module
  * CasperJS (optional, used by workload generator)

And several pieces of software have been modified and included in Orochi's repo.
In order to build them, their dependencies need to be installed.
They are:

  * HHVM-verifier (modified HHVM)
  * HHVM-log      (modified HHVM)
  * MySQL-log     (modified MySQL)

Three apps (MediaWiki, phpBB and HotCRP) have also been included (under "apps" folder)
in Orochi's repo.

### (1) install useful tools

Here are some useful tools that will be used by Orochi:

    $ sudo apt-get install wget mysql-client python-pip python-dev build-essential

Orochi also needs python's "requests" packages.
Use pip to install it:

    $ sudo pip install requests

### (2) install Nginx[[1](#ref1)]

Orochi uses Nginx as its web server. Use following command to install it:

    $ sudo apt-get install nginx

Test whether nginx works: 

    $ sudo service nginx restart

### (3) install openresty[[2](#ref2)]

OpenResty is a full-fledged web platform that integrates the standard
Nginx core, LuaJIT, third-party modules. It is used as "trace collector",
which records the "trace" (i.e. HTTP requests and responses), by Orochi.

One can build from source code or use official pre-built packages
to install OpenResty. Here is how to install pre-built version
on Ubuntu14.04/16.04:

    $ wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
    $ sudo apt-get -y install software-properties-common
    $ sudo add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"
    $ sudo apt-get update
    $ sudo apt-get install openresty

If you want to build from source code, please see and follow
instructions in OpenResty official installation tutorial
[here](https://openresty.org/en/installation.html).

Test whether openresty works using "helloworld" example
[here](https://openresty.org/en/getting-started.html).

### (4) install php5 HTTP module[[3](#ref3)]

HTTP module is used to parse the raw HTTP requests and generate the
prologue php code for Orochi. Use the following commands to install php
HTTP module:

    $ sudo apt-get install php-pear php5-dev libcurl3-openssl-dev
    $ sudo pecl install pecl_http-1.7.6

Add the http.so to the configuration file of php command line.

    $ sudo vi /etc/php5/cli/php.ini
      # Insert "extension=http.so" to file "php.ini".

If you encounter problems, please read the step-by-step tutorial
from [this blog](http://www.mkfoster.com/2009/01/04/how-to-install-a-php-pecl-extensionmodule-on-ubuntu/).

Or refer to the [official website](http://php.net/manual/fa/http.install.php)
for more information.

Use the following command to test whether the HTTP module works on your php.
You should see "OK" as the output.

    $ echo '<?php echo function_exists("http_parse_headers") ? "OK\n" : "FAIL\n";' | php

### (5) install nodejs[[7](#ref7)]

Nodejs is a JavaScript runtime. Orochi needs it to run request merge script.

    $ sudo apt-get install nodejs

### (6) install TCMalloc[[8](#ref8)]

Orochi uses Google's TCMalloc memory allocator in the implementation
of SSCO's consistent ordering verification (see section 3.5 of 
[our paper](https://cs.nyu.edu/~mwalfish/papers/ssco-sosp17.pdf)).

    $ sudo apt-get install google-perftools


Build Orochi from source code
-----------------------------

**Heads-up**: all the "OROCHI/REPO" in the rest of the instructions
should be replaced with the absolute path of Orochi root
on your machine.

### (1) Fetch the submodules

    $ cd OROCHI/REPO/
      # "OROCHI/REPO/" is the Orochi root folder
    $ git submodule init
    $ git submodule update

### <a name="buildhhvmverifier"/> (2) build HHVM-verifier (i.e. "acc-PHP" in paper)

HHVM is an open-source virtual machine designed for executing programs
written in Hack and PHP. Orochi repo includes two variants ("hhvm-log" and
"hhvm-verifier") of HHVM under folder OROCHI/REPO/hhvm-log and
OROCHI/REPO/hhvm-verifier.

Prerequisites for HHVM compiling:

    $ sudo apt-get install autoconf automake binutils-dev bison build-essential cmake g++ gawk git \
        libboost-dev libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev \
        libboost-system-dev libboost-thread-dev libboost-context-dev libbz2-dev libc-client-dev libldap2-dev \
        libc-client2007e-dev libcap-dev libcurl4-openssl-dev libdwarf-dev libelf-dev \
        libexpat-dev libgd2-xpm-dev libgoogle-glog-dev libgoogle-perftools-dev libicu-dev \
        libjemalloc-dev libmcrypt-dev libmemcached-dev libmysqlclient-dev libncurses-dev \
        libonig-dev libpcre3-dev libreadline-dev libtbb-dev libtool libxml2-dev zlib1g-dev \
        libevent-dev libmagickwand-dev libinotifytools0-dev libiconv-hook-dev libedit-dev \
        libiberty-dev libxslt1-dev ocaml-native-compilers libsqlite3-dev libyaml-dev libgmp3-dev \
        gperf libkrb5-dev libnotify-dev libpq-dev

Go to HHVM-verifier folder and compile:

    $ cd OROCHI/REPO/hhvm-verifier
    $ git submodule update --init --recursive
    $ cmake -DMYSQL_UNIX_SOCK_ADDR=/var/run/mysqld/mysqld.sock .
    $ make

Please refer to the [HHVM installation page](https://docs.hhvm.com/hhvm/installation/building-from-source#ubuntu-14.04-trusty)
for more details.

Link the binary to /usr/bin (other Orochi components will use "hhvmm"
as a known command):

    $ sudo ln -s OROCHI/REPO/hhvm-verifier/hphp/hhvm/hhvm /usr/bin/hhvmm

### (3) build HHVM-log

Building HHVM-log is the same as [building HHVM-verifier](#buildhhvmverifier).
Except that the binary should be linked to another command.

    $ cd OROCHI/REPO/hhvm-log
      # "OROCHI/REPO/" is the Orochi root folder
    $ git submodule update --init --recursive
    $ cmake -DMYSQL_UNIX_SOCK_ADDR=/var/run/mysqld/mysqld.sock .
    $ make

Link the binaries to the /usr/bin (other Orochi components will use the
hhvmt as known command):

    $ sudo ln -s OROCHI/REPO/hhvm-log/hphp/hhvm/hhvm /usr/bin/hhvmt
      # "OROCHI/REPO/" is the Orochi root folder

### (4) build original HHVM (HHVM-vanilla)

Since the original HHVM is needed as the baseline, you need to clone the original
HHVM from GitHub, checkout to the commit as HHVM-verifier (see below) and
compile it:

    $ cd OROCHI/REPO/
    $ git clone https://github.com/facebook/hhvm.git hhvm-vanilla
    $ cd hhvm-vanilla
    $ git checkout -b vanilla 436794d6b503970bba452eefca5133427e72ecba 
    $ git submodule update --init --recursive
    $ cmake -DMYSQL_UNIX_SOCK_ADDR=/var/run/mysqld/mysqld.sock .
    $ make

Link the binary to the /usr/bin (other Orochi components will use 
"hhvm" as a known command):

    $ sudo ln -s OROCHI/REPO/hhvm-vanilla/hphp/hhvm/hhvm /usr/bin/hhvm

### (5) build original MySQL database

Orochi uses MySQL database as backend during audit. Use the
following command to build and install it.

**NOTE**: In order to compare Orochi with legacy system (with unmodified
HHVM and MySQL), we have to build the same MySQL version
as MySQL-log (which is used by Orochi in online phase) from source code.

Orochi uses the Linux user "mysql" to run all instance of MySQL (original
MySQL and MySQL-log). If the user doesn't exist, create one:

    $ sudo adduser mysql

Build original MySQL:

    $ cd OROCHI/REPO/mysql-log
    $ git checkout -b vanilla eada4d562bda506163131233700ce5bdc0703a8f
      # checkout to the version of original MySQL

    $ mkdir build_vanilla; cd build_vanilla
    $ cmake .. -DCMAKE_INSTALL_PREFIX=OROCHI/REPO/mysql-vanilla-bin/
      (Note: replace "OROCHI/REPO/" with the absolute path to Orochi root folder)
    $ make
    $ make install

Create MySQL config file:

    $ cd OROCHI/REPO/mysql-vanilla-bin/
    $ cp ../config/mysql/my_vanilla.cnf my.cnf

    $ vi my.cnf
      # Replace "OROCHI/REPO/" with the absolute path to Orochi root in file "my.cnf".

Setup the database (under OROCHI/REPO/mysql-vanilla-bin/):

    $ ./scripts/mysql_install_db --defaults-file=./my.cnf --user=mysql
    $ ./bin/mysqld_safe --defaults-file=./my.cnf --user=mysql &
    $ ./bin/mysqladmin --defaults-file=./my.cnf -u root password 'news123'

Please refer to the MySQL 5.6 [installation page](https://dev.mysql.com/doc/mysql-sourcebuild-excerpt/5.6/en/source-installation.html)
for more information.

### (6) build other Orochi verification pieces

  There are two other pieces for verification which need to be built.

    $ cd OROCHI/REPO/veri_tools/odiff
    $ make

    $ cd OROCHI/REPO/veri_tools/process_hint
    $ make


Environment preparation
-----------------------

### <a name="orohome"/> (1) ORO_HOME environment variable

In order to run Orochi, the environment variable ORO_HOME must be set to
wherever the Orochi repo is located. Set the ORO_HOME using:

    $ export ORO_HOME=OROCHI/REPO/
      # replace "OROCHI/REPO/" with the absolute path on your machine

### (2) environment config

The default values for these variables should work if the previous instructions
are followed literally.

Config file "env.sh" is where all the environment variables are located.
It is under root of Orochi repo. Before running, one should set the following
environment variables according to your system settings:

####  (2.1) openresty command

    ORO_PROXY_BIN=openresty

ORO_PROXY_BIN should be the openresty binary whose path should be
included in the environment variable $PATH.

####  (2.2) database user/password

    DB_USER="root"
    DB_PASS="news123"

This is the database account and password. Note that this account should
(i) has the root privilege and (ii) should be the same in both normal MySQL
database (section "Build Orochi from source code" step4)
and MySQL-log database (section "Build online phase" setp3).

#### (2.3) web app ports

    export WEB_HOTCRP_PORT=4000
    export WEB_WIKI_PORT=5000
    export WEB_PHPBB_PORT=4996
    WEB_HOTCRP_PROXY_PORT=3999
    WEB_WIKI_PROXY_PORT=4999
    WEB_PHPBB_PROXY_PORT=4995

Make sure the above ports (i.e. 3999, 4000, 4995, 4996, 4999, 5000) have
not been used by other programs.

### (3) Nginx configuration

Please find the nginx's configuration files under folder OROCHI/REPO/config/nginx/.
Within the folder, there are one main config file nginx.conf and three web app
config file hotcrp.conf/phpbb.conf/wiki.conf. Use the following commands to copy
them to the correct location (assume that the nginx config folder is /etc/nginx/).
Please use sudo if you meet "permission denied".

    $ cd OROCHI/REPO/config/nginx
    $ cp nginx.conf /etc/nginx/
    $ cp hotcrp.conf phpbb.conf wiki.conf /etc/nginx/conf.d/

**NOTE**: Replace all the "OROCHI/REPO/" string in the config file with the
absolute path to the root of Orochi folder.

Use nginx restart to test if the configurations are valid.

    $ sudo service nginx restart

### (4) <a name="appconfig"/> Application configurations

Each app needs the record library
Please use the following commands to include the record library
for each app (hotcrp/wiki/phpbb):

    $ cd OROCHI/REPO/apps/<app>
      # "OROCHI/REPO/" is the Orochi root folder;
      # <app> should be "hotcrp"/"wiki"/"phpbb"
    $ cp ../../veri_tools/utils/link_lib.sh .
    $ ./link_lib.sh

#### (4.1) HotCRP configuration

Create HotCRP database user "hotcrp_dbuser" with password "123456":

    $ echo "CREATE USER 'hotcrp_dbuser'@'localhost' IDENTIFIED BY '123456'" | mysql -uroot -p
      # the password for database "root" should be "news123"

#### (4.2) download wikilab database

App wiki needs the wikilab database.
Please use the following script to download and setup the database:

    $ cd OROCHI/REPO/apps/database
      # "OROCHI/REPO/" is the Orochi root folder
    $ ./download_insert_db.sh wiki_labs_ttdb
    $ ./download_insert_db.sh wiki_labs

where the script will automatically download the original wikilab
database (wiki_labs) as well as its time travel version (wiki_labs_ttdb)
and insert it into the current MySQL database.
  
####  (4.3) create phpBB database

    $ echo "CREATE DATABASE phpbb" | mysql -uroot -p
      # the password for database "root" should be "news123"


Run the verifier 
----------------

We have provided the traces we've evaluated in our paper.
One can reproduce our results by downloading these traces
and re-executing Orochi's audit phase against them.

First, download the traces from our server.

    $ cd $ORO_HOME/benchmark/
    $ ./download.sh

Second, copy the trace data to the location where the verifier expects it.

    $ ./deploy.sh <app>
      # <app> should be one of hotcrp/wiki/phpbb

Third, run Orochi's audit phase.

    $ cd $ORO_HOME/verification
    $ ./verify2.sh <app>
      # <app> should be the same app as the second step

Now, the verifier outputs whether it accepts or rejects the trace
(accept means the responses re-generated are the same as what in the trace).
It also outputs the CPU time spent on different components.


Build the online server 
-----------------------

(1) build MySQL-log

MySQL-log is a variant of MySQL 5.6 which will log all the queries in their
execution order. This is used as the web app's backend during online phase.
Please find the code under folder OROCHI/REPO/mysql-log. 

    $ cd OROCHI/REPO/mysql-log
      # "OROCHI/REPO/" is the Orochi root folder
    $ git checkout master 
      # checkout to the MySQL-log branch

    $ mkdir build_log; cd build_log
    $ cmake .. -DCMAKE_INSTALL_PREFIX=OROCHI/REPO/mysql-log-bin/
      # "OROCHI/REPO/" is the Orochi root folder
    $ make
    $ make install

Create MySQL config file:

    $ cd OROCHI/REPO/mysql-log-bin/
      # "OROCHI/REPO/" is the Orochi root folder
    $ cp ../config/mysql/my_log.cnf my.cnf

    $ vi my.cnf
      # Replace "OROCHI/REPO/" with the absolute path to Orochi root in file "my.cnf".

Setup the database:
(Note: if there is mysqld running, kill it.)

    $ cd OROCHI/REPO/mysql-log-bin
    $ ./scripts/mysql_install_db --defaults-file=./my.cnf --user=mysql 
    $ ./bin/mysqld_safe --defaults-file=./my.cnf --user=mysql &
    $ ./bin/mysqladmin --defaults-file=./my.cnf -u root password 'news123' 

Prepare for apps:

HotCRP

    $ echo "CREATE USER 'hotcrp_dbuser'@'localhost' IDENTIFIED BY '123456'" | mysql -uroot -pnews123

phpBB

    $ echo "CREATE DATABASE phpbb" | mysql -uroot -pnews123

MediaWiki

    $ cd OROCHI/REPO/apps/database
    $ ./download_insert_db.sh wiki_labs

Note: if you see "environment ORO_HOME is not defined", run:

    $ export ORO_HOME=OROCHI/REPO/
      # "OROCHI/REPO/" is the Orochi root folder

### (2) install CasperJS[[4](#ref4)]

CasperJS is a navigation scripting & testing utility to mimic a browser.
Orochi use it to generate the workload for HotCRP and phpBB automatically.
Please go to http://casperjs.org/ for the installation tutorial.

### (3) <a name="generateworkloads"/> Generate workload and verify

    $ cd $ORO_HOME/workload_generator/<app>
      # <app> should be "hotcrp"/"wiki"/"phpbb"
    $ ./local_workload_gen.sh
    $ cd $ORO_HOME/verification/verify2.sh <app>
      # <app> should be "hotcrp"/"wiki"/"phpbb"

**Note**: the config parameters of workload (e.g. number of users, number of
requests to send) are located at the head of each local_workload_gen.sh
script.

### (4) run OpenResty on another machine

If you're going to run the HTTP proxy on another machine, you need to
set the server URL properly in openresty config files
(OROCHI/REPO/veri_tools/openresty/conf/clean.conf and nginx.conf).
Specifically, you should replace "127.0.0.1" with the actual URL of
your server, for example "another.server.com".


Guidelines for porting new PHP app to Orochi
--------------------------------------------
<a name="portingguideline"/>

This section talks about steps for porting a new PHP app to Orochi
and current implementation limitations list (TODO list). 

### <a name="porting"/> Port an app to Orochi

As for porting a new app to Orochi, one should follows
the next four steps.

First, instrument the non-deterministic builtin functions
in the app.

Run our auto-rewrite script:

    $ cd $ORO_HOME/veri_tools/record_lib/
    $ record-instument.sh <app folder>

Second, include Orochi's PHP libraries into application.

Copy Orochi PHP libraries into the app folder:

    $ cp $ORO_HOME/veri_tools/record_lib/*.php <app folder>

Add `require_once("record_lib.php");` at the entrance of the application,
which usually is the head of "index.php" file.

Third, check whether the application follows Orochi's SQL database
constraint (see section 4.4 in [our paper](https://cs.nyu.edu/~mwalfish/papers/ssco-sosp17.pdf))
that "a multi-statement transaction cannot enclose other object operations".
If not, one needs to manually adjust the application. Please see section 5.4
in [our paper](https://cs.nyu.edu/~mwalfish/papers/ssco-sosp17.pdf)
for our experience on adapting MediaWiki for Orochi.

Finally, check our current [implementation limitation](#impllimit) list
to see if any additional modification needed.

### <a name="impllimit"/> Implementation limitation (TODO list)

  * Current auto-rewrite script (record-instrument.sh in [previous step](#porting)) 
is not comprehensive. Todo is to check all the builtin functions and 
add all non-deterministic functions to this script.

  * Current implementation lacks some supports for database.
One may need to modify application's source code for following cases:

  (i) different parsing between actual database (MySQL) and in-memory database (SQLite).  
  (ii) `select *` may fetch start/end timestamp columns in the versioned DB.  
  (iii) database nondeterminism needs to be recorded.  

  Todo is to fix them.

  * Orochi has some implementation limitations on verifier. They are

  (i) limited handling of mixed types.  
  (ii) reference cycle on objects (such as $a->b->a).  
  Please see section 4.7 in [our paper](https://cs.nyu.edu/~mwalfish/papers/ssco-sosp17.pdf).
  Todo is to fix them.


Troubleshooting
---------------

  * Openresty cannot be installed properly

  Try to stop the running nginx and then install.

      $ sudo service nginx stop

  * Submodule project folder (e.g. mysql-log) is empty.

  Try to fetch using:

      $ git submodule update --init mysql-log

  * There is no user named "mysql" or the permission is not right.

  Create the users "mysql":

      $ adduser mysql
      $ chown mysql:mysql -R /var/lib/mysql


References
----------

  * <a name="ref1"/> [1] nginx: https://nginx.org/en/
  * <a name="ref2"/> [2] openresty: https://openresty.org/en/
  * <a name="ref3"/> [3] pecl_http: http://pecl.php.net/package/pecl_http
  * <a name="ref4"/> [4] CasperJS: http://casperjs.org/
  * <a name="ref5"/> [5] HHVM: http://hhvm.com/
  * <a name="ref6"/> [6] MySQL: https://dev.mysql.com/
  * <a name="ref7"/> [7] Nodejs: https://nodejs.org/en/
  * <a name="ref8"/> [8] TCMalloc: http://goog-perftools.sourceforge.net/doc/tcmalloc.html 
