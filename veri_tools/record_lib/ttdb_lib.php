<?php

/*
 * Used in the web app for instrumented MySQLi related APIs.
 *
 * Assumption:
 * (1) Need gen_op_num() from the main TT related scripts
 * (2) Global variable $req_no
 * (3) during verification, need support from HHVM-verifier
 *    multi_ret <-- ttdb_query_mysqli_result($query, $req_no, $op_num, $this)
 *    ttq <-- rewrite_select_sql($query, $req_no, $op_num)
 *    ret <-- check_write_sql($query, $req_no, $op_num)
 */

define("SYNC_PER_QUERY", false);
define("REPLAY_DEBUG", false);

// if we are running in record/replay hhvm
// mode:
// 0 - normal
// 1 - replay
// 2 - record
// 3 - verification
if (!defined("ORO_NORMAL")) {
  define("ORO_NORMAL", 0);
  define("ORO_REPLAY", 1);
  define("ORO_RECORD", 2);
  define("ORO_VERI", 3);
}

$ttdb_mode = ORO_NORMAL;

if (isset($oro_mode)) {
  $ttdb_mode = $oro_mode;
} else {
  if (function_exists("is_replay")) {
    if (is_replay()) {
      $ttdb_mode = ORO_REPLAY;
    } else {
      $ttdb_mode = ORO_RECORD;
    }
  } else if (function_exists("is_verify")) {
    if (is_verify()) {
      $ttdb_mode = ORO_VERI;
    } else {
      oro_fail("running in hhvm-verifier but not in verify mode!");
    }
  }
}

// ========== debug functions ==========

if (SELECT_CHECK) {
  // load sql.log
  include "/home/cheng/orochi/tests/TTdb/log_parser.php";
  // $history_sql is  { array(rid, op_num, ts, sql), ... }
  $history_sql = parseLog("/tmp/sql.log");
  // create a $req_no:$op_num => $ts
  $req_op_mapping = array();
  foreach ($history_sql as $ts=>$elems) {
    $tmp_req_no = $elems[0];
    $tmp_op_num = $elems[1];
    oro_assert($ts == $elems[2], "XXX");
    $req_op_mapping["$tmp_req_no-$tmp_op_num"] = $ts; 
  }

  function sql_comparison($sql1, $sql2) {
    $pattern = "(\s+)";
    $nsql1 = preg_replace($pattern, " ", $sql1);
    $nsql2 = preg_replace($pattern, " ", $sql2);
    if ($nsql1 == $nsql2) {
      return true;
    } else {
      return false;
    }
  }
}

// ========== helper functions ==========

// generate the op_num inside this request
// the "correct" one should be in "record_lib.php" where one op will
// increate op_num by 1. Clear for each of the request.
if (!function_exists("gen_op_num")) {
  function gen_op_num() {
    static $counter = 0;
    return $counter++;
  }
}

function dump_to_veri_log($query, $req_no, $op_num, $query_num) {
  $w_log = "/tmp/veri/sql-verify-1.log";
  // multi-val should be handled by another branch
  oro_assert(!is_multi($req_no), "dump_to_veri_log is called by an non-single query");
  $seqnum = get_seqnum_from_opmap($req_no, $op_num);
  $ts = $seqnum * 10000 + $query_num;
  $content = strval($ts) . "#&#" . $query . "|]|";
  if (file_put_contents($w_log, $content, FILE_APPEND|LOCK_EX) === False) {
    oro_fail("write to db_log fail!!!");
  }
}


//==========TTdb APIs================

  // use mmysql
function oro_mysql_query($conn, $query, $resultmode = MYSQLI_STORE_RESULT) {
  global $ttdb_mode, $req_no;

  if (PROFILER) {
    MProfiler::startTick("sql");
    MProfiler::startTick("bottleneck");
  }

  // this is NORMAL || REPLAY
  if ($ttdb_mode <= ORO_REPLAY) {

    if ($ttdb_mode == ORO_NORMAL && PROFILING_NORML) {
      MProfiler::startTick("normal_db");
    }

    $ret = $conn->query($query, $resultmode);

    if ($ttdb_mode == ORO_NORMAL && PROFILING_NORML) {
      MProfiler::endTick("normal_db");
    }

    // for debug replay
    if (REPLAY_DEBUG && $ttdb_mode == ORO_REPLAY) {
      $op_num = gen_op_num();
      if (startsWith(strtolower($query), "begin")) {
        signal_begin_txn();
      }
      if (startsWith(strtolower($query), "commit")) {
        signal_commit_txn();
      }
      $tag_sql = "/*$req_no,$op_num*/" . $query; 
    }

    return $ret;
  }

  if (!isset($req_no)) {
    oro_fail( "no \$req_no during verification\n");
  }
  // FIXME: TODO
  // This should either be done or referenced in the paper.
  if ($resultmode != MYSQLI_STORE_RESULT) {
    oro_fail("not support none-MYSQLI_STORE_RESULT\n");
  }

  $op_num = gen_op_num();

  if ($ttdb_mode == ORO_RECORD) {
    if (startsWith(strtolower($query), "begin")) {
      signal_begin_txn();
    }
    if (startsWith(strtolower($query), "commit")) {
      signal_commit_txn();
    }

    // for record, we provide the database the opnum
    $tag_sql = "/*$req_no,$op_num*/" . $query; 
    // ^^^ this is a clever hack :)
    return $conn->query($tag_sql, $resultmode);
  } else if ($ttdb_mode == ORO_VERI) {
    // NOTE: this sequence is delicate
    // ===seq===seq===seq===
    if (startsWith(strtolower($query), "begin")) {
      signal_begin_txn();
    }
    $query_num = gen_num_in_txn();
    if (startsWith(strtolower($query), "commit")) {
      signal_commit_txn();
    }
    // ===seq===seq===seq===

    // if this is in batch-execution
    if (is_multi($req_no)) {
      // The queries will be logged to /tmp/veri/sql-verify-2.log by hhvm-verifier
      $multi_ret = ttdb_query_mysqli_result($query, $req_no, $op_num, $query_num, $conn);
      return $multi_ret;
    } else {
      // This query will be logged to /tmp/veri/sql-verify-1.log by the script 
      dump_to_veri_log($query, $req_no, $op_num, $query_num);

      // check if select
      $sql_read = startsWith(strtolower($query), "select");
      $sql_show = startsWith(strtolower($query), "show");

      if ($sql_read) {
        // rewrite the select sql statement and do it
        $ttq = rewrite_select_sql($query, $req_no, $op_num, $query_num);
        $ret = $conn->query($ttq);
        //if ($ret === FALSE) {
        //   echo("Error description: " . mysqli_error($conn));
        //}
        return $ret;
      } else if ($sql_show) {
        return mysql_query($conn, $query, $resultmode);
      } else {
        // this will be assert false if it doesn't work
        return check_write_sql($query, $req_no, $op_num);
      }
    }
  }
}

