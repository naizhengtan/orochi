<?php

function get_path_from_branch($fd) {
  $ret = array();
  $cfgs = scandir($fd);

  foreach($cfgs as $cfg_fd) {
    if ($cfg_fd == "." ||
      $cfg_fd == ".."  ||
      !is_numeric($cfg_fd)) continue;
    $ret[$cfg_fd] = array();
    $path_prefix = $fd . "/" . $cfg_fd . "/";

    $files = scandir($path_prefix);
    foreach ($files as $f) {
      if ($f == "." || $f == "..") continue;
      $ret[$cfg_fd][] = $path_prefix . $f;
    }
  }

  return $ret;
}

function get_hash($content) {
  // get rid of req_no
  $lines = explode("\n", $content);
  $left = "";

  foreach ($lines as $line) {
    if (
      FALSE !== strpos($line, "req_no")  ||
      FALSE !== strpos($line, "_TIME")   ||
      FALSE !== strpos($line, "REMOTE_PORT")
    ) continue;

    $left .= $line;
  }

  return md5($left);
}

# =======
# main
# =======
function usage() {
  echo "check_same_inputs.php <branch_folder>\n";
}

if (count($argv) != 2) {
  usage();
  exit();
}

$branch_folder = $argv[1];

// return $CFG_file_path[cfg][0] => file path
$CFG_file_path = get_path_from_branch($branch_folder);

//print_r($CFG_file_path);

$num_same_input_cfg = 0;
foreach ($CFG_file_path as $cfg=>$path_list) {
  $file_hash = array();
  foreach ($path_list as $path) {
    $content = file_get_contents($path);
    $md5 = get_hash($content);
    if (!isset($file_hash[$md5])) {
      $file_hash[$md5] = 0;
    }
    $file_hash[$md5]++;
  }
  
  $num_same_input_cfg += count($file_hash);
}

echo "NUM: $num_same_input_cfg\n";

