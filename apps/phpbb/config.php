<?php
//==========================================
// cheng-hack:
// check if env.sh has been loaded
$oro_home = getenv("ORO_HOME");
$env_loaded = getenv("LD_ENV_VARS");
if ($oro_home == "" || $env_loaded == "") {
  echo "ERROR: ORO_HOME or LD_ENV_VARS is empty";
  exit(1);
}
$oro_db_user = getenv("DB_USER");
$oro_db_passwd = getenv("DB_PASS");
//==========================================

// phpBB 3.2.x auto-generated configuration file
// Do not change anything in this file!
$dbms = 'phpbb\\db\\driver\\mysqli';
$dbhost = '';
$dbport = '';
$dbname = 'phpbb';
$dbuser = $oro_db_user;
$dbpasswd = $oro_db_passwd;
$table_prefix = 'phpbb_';
$phpbb_adm_relative_path = 'adm/';
//$acm_type = 'phpbb\\cache\\driver\\file';
$acm_type = 'phpbb\\cache\\driver\\apc';

@define('PHPBB_INSTALLED', true);
// @define('PHPBB_DISPLAY_LOAD_TIME', true);
@define('PHPBB_ENVIRONMENT', 'production');
// @define('DEBUG_CONTAINER', true);
