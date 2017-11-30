<?php
/*
 * Used in the web app for instrumented APC related APIs.
 *
 * Assumption:
 * (1) Need gen_op_num() from the main TT related scripts
 * (2) during verification, need support from HHVM-verifier
 *   oro_apc_store_check($key, $val, $req_no, $op_num)
 *   oro_apc_delete_check($key, $req_no, $op_num)
 *   oro_apc_dec_check($key, $step, $req_no, $op_num)
 *   oro_apc_fetch_check($key, $req_no, $op_num)
 *   oro_apc_inc_check($key, $step, $req_no, $op_nun)
 */

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

$ttapc_mode = ORO_NORMAL;
$apc_log = "/tmp/apc.log";

if (isset($oro_mode)) {
  $ttapc_mode = $oro_mode;
  //echo "Mode is set: {$oro_mode}";
} else {
  if (function_exists("is_replay")) {
    if (is_replay()) {
      $ttapc_mode = ORO_REPLAY;
    } else {
      $ttapc_mode = ORO_RECORD;
    }
  } else if (function_exists("is_verify")) {
    if (is_verify()) {
      $ttapc_mode = ORO_VERI;
    } else {
      ttapc_fail("running in hhvm-verifier but not in verify mode!");
    }
  }
  //echo "Mode is not set, set by us to: {$ttapc_mode}";
}

// ========== helper functions ==========

function ttapc_fail($msg) {
    echo "FATAL ERROR: $msg";
    exit(1);
}

// generate the op_num inside this request
// the "correct" one should be in "record_lib.php" where one op will
// increate op_num by 1. Clear for each of the request.
// | APC and DB should sharet this counter.
if (!function_exists("gen_op_num")) {
  function gen_op_num() {
    static $counter = 0;
    return $counter++;
  }
}

// check whether we have req_no (assigned by hhvm (record) or prolog (replay/verification))
// and whether key is a string
function apc_check($req_no, $key) {
  if (!isset($req_no)) {
    ttapc_fail("during apc_store, there is no req_no for record");
  }
  if (!is_string($key)) {
    ttapc_fail("the key is not string in apc_store, it is ".print_r($key,true));
  }
}

function append_to_apclog($entry) {
  global $apc_log;
  if (file_put_contents($apc_log, $entry, FILE_APPEND|LOCK_EX) === False) {
    ttapc_fail("write to apc_log fail!!!");
  }
}

function rm_timestamp(&$array) {
  if (is_array($array)) {
    unset($array["start_ts"]);
    unset($array["end_ts"]);
    foreach ($array as &$elem) {
      rm_timestamp($elem); 
    }
  }
}

//========= TTapc APIs ==========

// the instrument for apc_store
function oro_apc_store ($key, $val, $ttl=0) {
  global $ttapc_mode, $req_no, $op_in_txn;

  // if normal || replay
  if ($ttapc_mode <= ORO_REPLAY) {
    return apc_store($key,$val,$ttl);
  }

  // assert that we are not in txn
  oro_assert(!$op_in_txn, "meet a apc_store within txn!");
  // check the validity
  apc_check($req_no, $key);
  // get the op_num
  $op_num = gen_op_num();

  if ($ttapc_mode == ORO_RECORD) {
    // do it and record the result
    // FIXME: this is a hack to prevent apc from expiring
    // NOTE: within will handle absolute path problem
    // related: oro_apc_fetch_check() during VERI 
    $ret = apc_store_logging($key, $val, 0/*ttl*/, $req_no, $op_num);

    // FIXME: this is a check for debuging wiki naive_replay
    if ($ret === FALSE) {
      cheng_debug_lts("!!!!!!!!apc_store fail!!!!!!!\n        ".$entry);
    }

    return $ret;
  } else if ($ttapc_mode == ORO_VERI) {
    // FIXME: this is a hack! for start_ts/end_ts
    rm_timestamp($val);

    // either {
    if (is_multi($val)) {
      // used to be a BUG: $val might be a single multi-value
      $multi_val = split_multi($val); // this will handle single multi-value
      $str_val_arr = array();
      foreach ($multi_val as $cur_val) {
        $cur_str_val = serialize($cur_val);
        $str_val_arr[] = $cur_str_val;
      }
      $str_val = gen_multi($str_val_arr);
    } else {
      $str_val = serialize($val);
    }
    return oro_apc_store_check($key, $str_val, $req_no, $op_num);
    // } or {

    // return oro_apc_store_check($key, $val, $req_no, $op_num);
    // }
  }
}

function oro_apc_delete ($key) {
  global $ttapc_mode, $req_no, $op_in_txn;

  if ($ttapc_mode <= ORO_REPLAY) {
    return apc_delete($key);
  }

  // assert that we are not in txn
  oro_assert(!$op_in_txn, "meet a apc_delete within txn!");
  // check the validity
  apc_check($req_no, $key);
  // get the op_num
  $op_num = gen_op_num();

  if ($ttapc_mode == ORO_RECORD) {
    $ret = apc_delete_logging($key, $req_no, $op_num);

    /*
    if ($ret === FALSE) {
      ttapc_fail("apc_delete fail");
    }
    */

    return $ret;
  } else if ($ttapc_mode == ORO_VERI) {
    return oro_apc_delete_check($key, $req_no, $op_num);
  }
}

function oro_apc_fetch ($key /*, &$success*/) {
  global $ttapc_mode, $req_no, $op_in_txn;

  if ($ttapc_mode <= ORO_REPLAY) {
    return apc_fetch($key/*, $success*/);
  }

  // assert that we are not in txn
  oro_assert(!$op_in_txn, "meet a apc_fetch within txn!");
  // check the validity
  apc_check($req_no, $key);
  // get the op_num
  $op_num = gen_op_num();

  if ($ttapc_mode == ORO_RECORD) {
    $ret = apc_fetch_logging($key, NULL, $req_no, $op_num);
    return $ret;
  } else if ($ttapc_mode == ORO_VERI) {
    $encode_val = oro_apc_fetch_check($key, $req_no, $op_num);
    $ret = unserialize($encode_val);
    return $ret;
  }
}

function oro_apc_dec ($key, $step /*, &$success*/) {
  global $ttapc_mode, $req_no, $op_in_txn;

  if ($ttapc_mode <= ORO_REPLAY) {
    return apc_dec($key, $step/*, $success*/);
  }

  // assert that we are not in txn
  oro_assert(!$op_in_txn, "meet a apc_dec within txn!");
  // check the validity
  apc_check($req_no, $key);
  // get the op_num
  $op_num = gen_op_num();

  if ($ttapc_mode == ORO_RECORD) {
    stupid_apc_lock();
    // record: record the result
    $ret = apc_dec($key, $step/*, $success*/);
    if ( $ret === FALSE ) {
      ttapc_fail("The apc_dec fail on record!!!!");
    }
    
    // entry: req_no,op_num,dec,key,step,ret
    $entry = "$req_no#&#$op_num#&#dec#&#$key#&#$step#&#$ret]&#]";
    append_to_apclog($entry);
    stupid_apc_unlock();

    return $ret;
  } else if ($ttapc_mode == ORO_VERI) {
    // verification 
    return oro_apc_dec_check($key, $step, $req_no, $op_num);
  }
}


function oro_apc_inc ($key, $step/*, &$success*/) {
  global $ttapc_mode, $req_no, $op_in_txn;

  if ($ttapc_mode <= ORO_REPLAY) {
    return apc_inc($key,$step);
  }

  // assert that we are not in txn
  oro_assert(!$op_in_txn, "meet a apc_inc within txn!");
  // check the validity
  apc_check($req_no, $key);
  // get the op_num
  $op_num = gen_op_num();

  if ($ttapc_mode == ORO_RECORD) {
    stupid_apc_lock();
    $ret = apc_inc($key,$step);
    // entry: req_no,op_num,inc,key, step, ret
    $entry = "$req_no#&#$op_num#&#inc#&#$key#&#$step#&#$ret]&#]";
    append_to_apclog($entry);
    stupid_apc_unlock();

    if ($ret === FALSE) {
      ttapc_fail("apc_inc return false!!!");
    }

    return $ret;
  } else if ($ttapc_mode == ORO_VERI) {
    return oro_apc_inc_check($key, $step, $req_no, $op_num);
  }
}
