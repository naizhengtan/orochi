#! /bin/bash 
if [ $LD_ENV_VARS != true  ]; then
  echo "ERROR: atool should be loaded from env.sh script"
  exit 1
fi

HHVM_CONF="$ORO_HOME/config/hhvm/hhvm.hdf"
HHVM_DEBUG_LOG="/tmp/hhvm.debug"

#============HHVM Helper Functions===============

function sudo_invisible_rabbit_simple {
  # invisible rabbit!!
  RABBIT=$(tempfile)
  # trigger sudo
  sudo touch $RABBIT && sudo rm $RABBIT
}

function atool_allstop {
  #killall $NORM_HHVM_BIN 
  #killall $HHVM_LOG_BIN 
  #killall $ACCPHP_BIN 

  # get the pid of hhvm/hhvmt/hhvmm instance, might be several if things went wrong
  # hhvm
  HHVM_ARR=( $(pidof $NORM_HHVM_BIN) )
  for PID in ${HHVM_ARR[@]}; do
    kill -9 $PID
  done

  # hhvmt
  HHVM_ARR=( $(pidof $HHVM_LOG_BIN) )
  for PID in ${HHVM_ARR[@]}; do
    kill -9 $PID
  done

  # hhvmm
  HHVM_ARR=( $(pidof $ACCPHP_BIN) )
  for PID in ${HHVM_ARR[@]}; do
    kill -9 $PID
  done
}

function atool_hhvm_stop {
  atool_allstop
}
function atool_hhvm_orochi_stop {
  atool_allstop
}
function atool_hhvm_record_stop {
  atool_allstop
}
function atool_hhvm_replay_stop {
  atool_allstop
}

function atool_hhvm_start {
  $NORM_HHVM_BIN -m daemon -vEval.Jit=0 -vEval.PerfPidMap=0 -vServer.Type=fastcgi -c $HHVM_CONF > $HHVM_DEBUG_LOG  2>&1
}

# this is the record daemon hhvm
function atool_hhvm_record_start {
  $HHVM_LOG_BIN -m daemon -vEval.Jit=0 -vEval.PerfPidMap=0 -vServer.Type=fastcgi -c $HHVM_CONF > $HHVM_DEBUG_LOG 2>&1
}

# this is the replay daemon hhvm
function atool_hhvm_replay_start {
  $HHVM_LOG_BIN -m daemon-replay -vEval.Jit=0 -vEval.PerfPidMap=0  -vServer.Type=fastcgi --define hhvm.server.thread_count=1 -c $HHVM_CONF > $HHVM_DEBUG_LOG 2>&1
}

# this is the batch daemon hhvm
function atool_hhvm_orochi_start {
  $ACCPHP_BIN -m daemon-verification -vEval.Jit=0  -vEval.PerfPidMap=0 -vServer.Type=fastcgi -c $HHVM_CONF > $HHVM_DEBUG_LOG 2>&1
}

function atool_hhvm_orochi_single_start {
  $ACCPHP_BIN -m daemon-verification -vEval.Jit=0  -vEval.PerfPidMap=0 -vServer.Type=fastcgi --define hhvm.server.thread_count=1 -c $HHVM_CONF > $HHVM_DEBUG_LOG 2>&1
}

#============Web Helper Functions===============

function atool_web_stop {
  #sudo nginx -s stop
  sudo service $WEB_SERVER_BIN stop
}

function atool_web_start {
# sudo is dangerous
  #sudo nginx -c /etc/nginx/nginx.conf
  sudo service $WEB_SERVER_BIN start
}

function atool_web_restart {
  #sudo nginx -s reload
  sudo service $WEB_SERVER_BIN restart 
}

#============Database Helper Functions===============

function clear_sql_log {
  sudo rm -rf /tmp/sql_log/
}

function atool_mmysql_stop {
  #sudo killall -9 mysqld_safe
  #sudo killall -9 mysqld
  $MYSQL_LOG_BIN_FD/mysqladmin --defaults-file=$MYSQL_LOG_BASE_FD/my.cnf \
  -u$DB_USER -p$DB_PASS shutdown >> $DEBUG_DB_LOG 2>&1
  sleep $MYSQL_GRACE_PERIOD
}

function atool_omysql_stop {
  #sudo killall -9 mysqld_safe
  #sudo killall -9 mysqld
  $MYSQL_ORIG_BIN_FD/mysqladmin --defaults-file=$MYSQL_ORIG_BASE_FD/my.cnf \
    -u$DB_USER -p$DB_PASS shutdown >> $DEBUG_DB_LOG 2>&1
  sleep $MYSQL_GRACE_PERIOD
}

function atool_mmysql_alive {
  $MYSQL_LOG_BIN_FD/mysqladmin --defaults-file=$MYSQL_LOG_BASE_FD/my.cnf \
    -u$DB_USER -p$DB_PASS ping >> $DEBUG_DB_LOG 2>&1 
  echo $?
}

function atool_omysql_alive {
  $MYSQL_ORIG_BIN_FD/mysqladmin --defaults-file=$MYSQL_ORIG_BASE_FD/my.cnf \
    -u$DB_USER -p$DB_PASS ping >> $DEBUG_DB_LOG 2>&1 
  echo $?
}

function atool_mmysql_start {
  sudo_invisible_rabbit_simple
  clear_sql_log
  #sudo $MYSQL_LOG_BIN_FD/mysqld_safe --user=mysql --basedir=$MYSQL_LOG_BASE_FD --transaction-isolation=SERIALIZABLE >> $DEBUG_DB_LOG 2>&1 &
  sudo $MYSQL_LOG_BIN_FD/mysqld_safe --defaults-file=$MYSQL_LOG_BASE_FD/my.cnf \
    --user=mysql --transaction-isolation=SERIALIZABLE >> $DEBUG_DB_LOG 2>&1 &
  sleep $MYSQL_GRACE_PERIOD
}

function atool_omysql_ro_start {
  sudo_invisible_rabbit_simple
  #sudo $MYSQL_ORIG_BIN_FD/mysqld_safe --user=mysql --basedir=$MYSQL_ORIG_BASE_FD --read-only --transaction-isolation=SERIALIZABLE >> $DEBUG_DB_LOG  2>&1 &
  sudo $MYSQL_ORIG_BIN_FD/mysqld_safe --defaults-file=$MYSQL_ORIG_BASE_FD/my.cnf \
    --user=mysql --read-only --transaction-isolation=SERIALIZABLE >> $DEBUG_DB_LOG  2>&1 &
  sleep $MYSQL_GRACE_PERIOD
}

function atool_omysql_start {
  sudo_invisible_rabbit_simple
  sudo $MYSQL_ORIG_BIN_FD/mysqld_safe --defaults-file=$MYSQL_ORIG_BASE_FD/my.cnf \
    --user=mysql --transaction-isolation=SERIALIZABLE >> $DEBUG_DB_LOG  2>&1 &
  sleep $MYSQL_GRACE_PERIOD
}

function atool_omysql_default_start {
  sudo_invisible_rabbit_simple
  sudo $MYSQL_ORIG_BIN_FD/mysqld_safe --defaults-file=$MYSQL_ORIG_BASE_FD/my.cnf \
    --user=mysql >> $DEBUG_DB_LOG  2>&1 &
  sleep $MYSQL_GRACE_PERIOD
}

function atool_mmysql_restart {
  atool_mmysql_stop
  atool_mmysql_start
}

function atool_omysql_restart {
  atool_omysql_stop
  atool_omysql_start
}
