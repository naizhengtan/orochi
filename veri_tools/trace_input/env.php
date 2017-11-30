<?php

// check if env.sh has been loaded
$oro_home = getenv("ORO_HOME");
$env_loaded = getenv("LD_ENV_VARS");

if ($oro_home == "" || $env_loaded == "") {
  echo "ERROR: ORO_HOME or LD_ENV_VARS is empty";
  exit(1);
}

$host_ip = "216.165.71.245";

// HotCRP
$hotcrp_port = getenv("WEB_HOTCRP_PORT");
$hotcrp_loc =  getenv("WEB_HOTCRP_PATH");
$hotcrp_host = getenv("SERVER_LOC") . ":" . $hotcrp_port; 

// phpbb 
$phpbb_port = getenv("WEB_PHPBB_PORT"); 
$phpbb_loc =  getenv("WEB_PHPBB_PATH"); 
$phpbb_host = getenv("SERVER_LOC") . ":" . $phpbb_port;  

// wiki
$wiki_port = getenv("WEB_WIKI_PORT");
$wiki_loc =  getenv("WEB_WIKI_PATH"); 
$wiki_host = getenv("SERVER_LOC") . ":" . $wiki_port; 
