<?php

function cheng_assert($cond) {
  if (!$cond) {
    echo "fail assert\n";
    debug_print_backtrace();
    exit(1);
  }
}

function usage() {
  echo "check_sql.php <online_sql.log> <veri_sql_1.log> <veri_sql_2.log>\n";
}

function startsWith($haystack, $needle) {
  // search backwards starting from haystack length characters from the end
  return $needle === "" || strrpos($haystack, $needle, -strlen($haystack)) !== FALSE;
}

function load_veri_log($log1, $log2) {
  $content = file_get_contents($log1);
  if ($content !== FALSE) {
    $rows1 = explode("|]|", $content);
  } else {
    $rows1 = array();
  }

  $content = file_get_contents($log2);
  if ($content !== FALSE) {
    $rows2 = explode("|]|", $content);
  } else {
    $rows2 = array();
  }

  $rows = array_merge($rows1, $rows2);

  $ret = array();
  foreach ($rows as $row) {
    if ($row == "") continue;
    $elems = explode("#&#", $row);
    cheng_assert(count($elems) == 2);
    $ts = $elems[0];
    $query = $elems[1];
    // We may have duplicated sql!!! for rerun
    //cheng_assert(!isset($ret[$ts]));
    $ret[$ts] = $query;
  }

  return $ret;
}

// return the array which layout is like:
// [ts => {rid, opnum, query}, ...]
function load_orig_log($log) {
  $content = file_get_contents($log);
  $entries = explode("|]|", $content); 

  // entry: rid #&# opnum #&# {write|read|txn} #&# {true|false} #&# query
  $seq_num = 0;
  $ret = array();
  foreach ($entries as $entry) {
    if($entry == "END" || $entry == "") continue;

    $elems = explode("#&#", $entry);
    if (count($elems) == 5) {
      cheng_assert($elems[2] != "txn", "txn cannot be here");
      // this is single query
      $ts = $seq_num * 10000; 
      cheng_assert(!isset($ret[$ts]));
      $ret[$ts] = array($elems[0], $elems[1], $elems[4]);
    } else if ((count($elems) - 4) % 3 ==0) { 
      // this is in txn
      cheng_assert($elems[2] == "txn", "none-txn should not be here");
      $rid = $elems[0];
      $opnum = $elems[1];
      $elems = array_slice($elems, 4);

      for ($i=0; $i<count($elems); $i+=3) {
        $ts = $seq_num * 10000 + $i/3;
        //echo "[$ts] ".$elems[$i+2]."\n";
        $ret[$ts] = array($rid, $opnum, $elems[$i+2]);
      }
    } else {
      cheng_assert(false, "Does not support his query: " . $entry);

    }

    // increase the op counter by 1
    $seq_num++;
  }
  return $ret;
}

// main
//
//
if (count($argv) != 4) {
  usage();
  exit(1);
}

$online_log = $argv[1];
$veri_log1 = $argv[2];
$veri_log2 = $argv[3];

$orig = load_orig_log($online_log);
$veri = load_veri_log($veri_log1, $veri_log2);

// check whether veri
$success = true;
foreach ($veri as $ts=>$veri_sql) {
  cheng_assert(isset($veri[$ts]));

  if (isset($orig[$ts])) {
    $elems = $orig[$ts];
    if (trim($elems[2]) != trim($veri_sql)) {
      echo "[ERROR]: mismatch query!\n    rid=" . $elems[0] . " opnum=" . $elems[1] . " ts=" . $ts .
        "\n    ======orig=========\n" . $elems[2] . "\n   ==========veri==========\n" . $veri_sql . "\n";
      $success = false;
    } 
    unset($orig[$ts]);
  }
}

// list all missing queries in veri
foreach ($orig as $ts=>$elems) {
  echo "[MISSING]: rid=" . $elems[0] . " opnum=" . $elems[1] ."\n     ". $elems[2] . "\n";
  $success = false;
}

if ($success) {
  echo "PASS!\n";
} else {
  exit(1); 
}

#echo "Online sql log count: " . count($orig)."\n";
#echo "Veri sql log count: " . count($veri)."\n";
