<?php

function cheng_assert($cond, $line) {
  if (!$cond) {
    echo "fail assert at line $line\n";
    exit(1);
  }
}

if (!file_exists("/tmp/fail-php.txt")) {
  echo "No fail-php.txt, return\n";
  return;
}

$fail_log = file_get_contents("/tmp/fail-php.txt");
if (!isset($fail_log)) {
  echo "Threre is no fail group file, /tmp/veri/fail-php.txt\n";
  file_put_contents("/tmp/veri/batch_fail_req.log", "");
  return;
}
$map_log = file_get_contents("/tmp/veri/merg-request.mapping");
if (!isset($fail_log)) {
  echo "Threre is no group mapping fail, /tmp/veri/merg-request.mapping\n";
  exit(1);
}

$fail_groups = explode("\n", $fail_log);
$mapping = explode("\n", $map_log);

// create mapping from group=>rid
$g2r = array();

foreach ($mapping as $row) {
  if ($row == "") continue;
  $pattern = "/\/tmp\/veri\/merge\/(.*):.*\(.*\)(.+)/";
  $ret = preg_match($pattern, $row, $args);
  cheng_assert($ret, __LINE__);

  $group = trim($args[1]);  // m841.php
  $entries = trim($args[2]); // rxxx.php,rxxx.php
  $g2r[$group] = $entries;
}

// put the failed runs
$output = "";
foreach ($fail_groups as $g) {
  if ($g == "") continue;
  cheng_assert(isset($g2r[$g]), __LINE__);
  $rows = $g2r[$g];

  if ($output[count($output)] != ",") $output.=",";
  $output .= $rows;
}

file_put_contents("/tmp/veri/batch_fail_req.log", $output);
