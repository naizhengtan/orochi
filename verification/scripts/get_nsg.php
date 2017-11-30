<?php

function is_non_single_group($fd) {
  $arr = scandir($fd);
  return count($arr) > 3; // with . ..
}

function usage() {
  echo "get_nsg.php <branch-folder>\n";
}

// --------------
// main
// --------------
// usage: 

//$trace_fd = "/tmp/branch/";
$trace_fd = "/tmp/branch/";

if (count($argv)!=2) {
  usage();
} else {
  $trace_fd = $argv[1];
}

$arr = scandir($trace_fd);

$nsg = 0;
$total = 0;

foreach($arr as $group) {
  if (is_numeric($group)) {
    if (is_non_single_group($trace_fd.$group)) {
      $nsg ++;
    }
    $total ++;
  }
}

echo "NSG:TOTAL = $nsg/$total\n";
echo "Number of NSG: $nsg\n";
