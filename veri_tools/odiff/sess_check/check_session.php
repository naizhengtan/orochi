<?php

function cheng_assert($cond) {
  if (!$cond) {
    echo "fail assert\n";
    debug_print_backtrace();
    exit(1);
  }
}

function usage() {
  echo "check_session.php <online_log_folder> <veri_log_folder>\n";
}

function list_sess_files($folder) {
  $ret = array();
  $files = scandir($folder); 

  foreach ($files as $f) {
    if (substr($f, -5) == ".sess") {
      $ret[] = $f;
    }
  }

  return $ret;
}

function check_file_identical($f1, $f2) {
  $str1 = file_get_contents($f1);
  $str2 = file_get_contents($f2);

  if ($str1 == $str2) {
    return true;
  } else {
    return false;
  }
}

function compare_orig_to_veri($orig, $veri, $orig_path, $veri_path) {
  global $success;

  foreach ($veri as $fname) {
    if (in_array($fname, $orig)) {
      $same = check_file_identical($orig_path."/".$fname, $veri_path."/".$fname);
      if (!$same) {
        echo "VERIFICATION ERROR: session [$fname] is not the same\n";
        $success = false;
      }
    } 
  }
  
  $missing = array_diff($orig, $veri);
  if (count($missing) > 0) {
    echo "VERIFICATION ERROR: session missing!\n";
    print_r($missing);
    $success = false;
  }

}

// main
//
if (count($argv) != 3) {
  usage();
  exit(1);
}

$success = true;

$orig_path = $argv[1];
$veri_path = $argv[2];

$orig_list = list_sess_files($orig_path);
$veri_list = list_sess_files($veri_path);

compare_orig_to_veri($orig_list, $veri_list, $orig_path, $veri_path);

if ($success) {
  echo "Session check PASS\n";
  exit(0);
} else {
  echo "Session check FAIL\n";
  exit(1);
}

