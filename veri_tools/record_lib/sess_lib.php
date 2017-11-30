<?php

/*
 * Formate of session log:
 * session_start (READ):
 *   rid #&# opnum #&# read #&# session_id |]|
 * session_commit/session_write_close  (WRITE):
 *   rid #&# opnum #&# write #&# session_id |]|
 */ 

if (!isset($oro_mode)) {
  echo "FATAL ERROR: not included by record_lib.php\n";
  exit(1);
}

// global variables
$sess_log = "/tmp/sess.log";
$sess_path = "/tmp/branch/session/";
$sess_veri_path = "/tmp/veri/veri_sess/";

// create folder
if ($oro_mode != ORO_VERI) {
  if (!file_exists($sess_path)) {
    mkdir($sess_path, 0755, true);
  }
} else {
  if (!file_exists($sess_veri_path)) {
    mkdir($sess_veri_path, 0755, true);
  }
}

function append_to_sesslog($entry) {
  global $sess_log;
  if (file_put_contents($sess_log, $entry, FILE_APPEND|LOCK_EX) === False) {
    ttapc_fail("write to sess_log fail!!!");
  }
}

function cheng_session_start() {
  global $req_no, $oro_mode, $op_in_txn;

  if ($oro_mode == ORO_NORMAL || $oro_mode == ORO_REPLAY) {
    return session_start();
  } else if ($oro_mode == ORO_RECORD) {
    // assert that we are not in txn
    oro_assert(!$op_in_txn, "meet a session_start within txn!");
    // do the real action
    // FIXME: ????
    session_start(/*$options*/);
    // write action to log
    oro_assert(isset($req_no), "req_no is not defined");
    $opnum = gen_op_num();
    $sess_id = session_id();
    $entry = "$req_no#&#$opnum#&#read#&#$sess_id|]|";
    append_to_sesslog($entry);
  } else if ($oro_mode == ORO_VERI) {
    global $sess_path;

    // assert that we are not in txn
    oro_assert(!$op_in_txn, "meet a session_start within txn!");
    $opnum = gen_op_num();
    $sess_id = sess_get_id($req_no, $opnum, false);
    oro_assert($sess_id != "NULL", "session_start: the session_id for $req_no-$opnum is NULL");
    // type check is here
    $sess_name = sess_get_last_write($req_no, $opnum, $sess_id);
    if ($sess_name == "NULL") {
      session_start();
    } else {
      $sess_content = file_get_contents($sess_path . $sess_name . ".sess");
      session_start();
      session_decode($sess_content);
    }
  }
}

function cheng_session_write_close() {
  global $req_no, $oro_mode, $op_in_txn;

  if ($oro_mode == ORO_NORMAL || $oro_mode == ORO_REPLAY) {
    return session_write_close();
  } else if ($oro_mode == ORO_RECORD) {
    global $sess_path;

    // assert that we are not in txn
    oro_assert(!$op_in_txn, "meet a session_start within txn!");

    $opnum = gen_op_num();
    $sess_id = session_id();
    $entry = "$req_no#&#$opnum#&#write#&#$sess_id|]|";
    append_to_sesslog($entry);
    // write the content to file
    $loc = $sess_path . "S_" . $sess_id . "_" . $req_no . "_" . $opnum . ".sess";
    $sess_content = session_encode();
    file_put_contents($loc, $sess_content);
    // do the real action
    session_write_close();
  } else if ($oro_mode == ORO_VERI) {
    global $sess_veri_path;

    // assert that we are not in txn
    oro_assert(!$op_in_txn, "meet a session_start within txn!");

    // dump for comparison
    $opnum = gen_op_num();
    // check the write
    $sess_id = sess_get_id($req_no, $opnum, true);
    //echo "---[$req_no]---[$opnum]---[$sess_id]---\n";
    oro_assert($sess_id != "NULL", "session_write_close: the session_id for $req_no-$opnum is NULL");
    $loc = $sess_veri_path . "S_" . $sess_id . "_" . $req_no . "_" . $opnum . ".sess";
    // check the session value if they are the same
    if (is_multi($loc)) {
      $sess_content = multi_session_encode();
      file_put_contents($loc, $sess_content);
    } else {
      $sess_content = session_encode();
      file_put_contents($loc, $sess_content);
    }
    // do the real action
    session_write_close();
  }
}
