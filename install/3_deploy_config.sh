#!/bin/bash

if [ "$ORO_HOME" == "" ]; then
  echo "ERROR: environment ORO_HOME is not defined"
  exit 1
fi

function failconfig {
  echo "ERROR: failconfig during $1, please see related step in detailed_instructions.txt"
  exit 1
}

. $ORO_HOME/env.sh

set -x

# (3) Nginx configuration
STEP="(3) Nginx configuration"

cd $ORO_HOME/config/nginx || failconfig "$STEP"
sudo cp nginx.conf /etc/nginx/ || failconfig "$STEP"

# replace the OROCHI/REPO to real path
ESCAPE_HOME=$( echo $ORO_HOME | sed "s/\//\\\\\//g" )
sed -ie "s/OROCHI\/REPO/$ESCAPE_HOME/g"  hotcrp.conf || failconfig "$STEP"
sed -ie "s/OROCHI\/REPO/$ESCAPE_HOME/g"  wiki.conf  || failconfig "$STEP"
sed -ie "s/OROCHI\/REPO/$ESCAPE_HOME/g"  phpbb.conf  || failconfig "$STEP"

sudo cp hotcrp.conf phpbb.conf wiki.conf /etc/nginx/conf.d/ || failconfig "$STEP"
sudo service nginx restart || failconfig "$STEP"

# (4) Application configurations
STEP="(4) Application configurations"

APPS=( "hotcrp" "wiki" "phpbb" )
for APP in ${APPS[@]}; do
  cd $ORO_HOME/apps/$APP || failconfig "$STEP"
  cp ../../veri_tools/utils/link_lib.sh . || failconfig "$STEP"
  ./link_lib.sh || failconfig "$STEP"
done
  
# (4.1) HotCRP configuration
STEP="(4.1) HotCRP configuration"
atool_omysql_stop
sleep 2
atool_omysql_start
sleep 5

echo "CREATE USER  '$HOTCRP_DBUSER'@'localhost' IDENTIFIED BY '$HOTCRP_DBPASS'" \
  | mysql -u$DB_USER -p$DB_PASS || failconfig "$STEP"
  
# (4.2) download wikilab database
STEP="(4.2) download wikilab database"

cd $ORO_HOME/apps/database || failconfig "$STEP"
./download_insert_db.sh wiki_labs_ttdb  || failconfig "$STEP"
./download_insert_db.sh wiki_labs || failconfig "$STEP"
  
# (4.3) create phpBB database
STEP="(4.3) create phpBB database"

echo "CREATE DATABASE phpbb" | mysql -u$DB_USER -p$DB_PASS || failconfig "$STEP"
