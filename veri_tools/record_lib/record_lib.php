<?php
// This is the skeleton of record_lib which will
// (1) decide current hhvm mode
// (3) initial some environment variables
//     $req_no (int), $cheng_non_determinism (array)
// (3) provide some general helper functions
// (4) Include oro_* instrumented APIs

// debug
//function cheng_debug_error_func($errno, $errstr, $errfile, $errline) {
//  echo GetFullCallingInfo();
//  exit(1);
//}
//set_error_handler("cheng_debug_error_func", E_ALL);

if (function_exists("get_req_no")) {
  header("X-RID: " . get_req_no());
} else {
  header("X-RID: 0");
}

//=========================================
//========== Parameters ===================
//=========================================

define("ESCAPE_ON", true);
define("ORO_DEBUG", false);
define("RIG_CHECK", false);
define("SELECT_CHECK", false);
define("PROFILER", false);
define("PROFILING_NORML", true);
define("N_ALPHA_PROFILING", false);
define("CLASSIFIED_INS_COLLECTING", false);

//=========================================
//==========Detect Cur Mode================
//=========================================
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

$oro_mode = ORO_NORMAL;

if (function_exists("is_replay")) {
  if (is_replay()) {
    $oro_mode = ORO_REPLAY;
  } else {
    $oro_mode = ORO_RECORD;
  }
} else if (function_exists("is_verify")) {
  if (is_verify()) {
    $oro_mode = ORO_VERI;
  } else {
    oro_fail("running in hhvm-verifier but not in verify mode!");
  }
}

require_once("profiler.php");
if (PROFILER) {
  MProfiler::initTrace("php");
  MProfiler::initTrace("setup");
  MProfiler::initTrace("nondet");
  MProfiler::initTrace("sql");
  MProfiler::initTrace("dump");
  MProfiler::initTrace("bottleneck");

  MProfiler::startTick("php");
}


if (PROFILING_NORML) {
  MProfiler::initTrace("normal_db");
}

//======================================
//=========Global Variables=============
//======================================

$int_offset = 1000; // to avoid the ASCii code
$double_pack_size = strlen(pack('d', 0.1));
$int_pack_size = strlen(pack('N', 10000));

//======================================
//=======Setup Global Environment=======
//======================================

if ($oro_mode != ORO_NORMAL) {
  if (PROFILER) {
    MProfiler::startTick("setup");
  }

  if ($oro_mode == ORO_RECORD) {
    // record
    $cheng_non_determinism = array();
    $req_no = get_req_no();
    // copy submission file
    if (isset($_FILES['paperUpload']['tmp_name']) && $_FILES['paperUpload']['tmp_name'] != "") {
      if (!copy($_FILES['paperUpload']['tmp_name'], "/tmp/branch/submission/r".$req_no.".pdf")) {
        oro_fail("copy " . $_FILES['paperUpload']['tmp_name'] . " to r" . $req_no . ".pdf fail.");
      }
    }
  } else if ($oro_mode == ORO_REPLAY) {
    // replay
    if (!isset($req_no)) {
      oro_fail("\$req_no cannot be loaded!\n");
    }
    $path = "/tmp/branch/non_determ/r" . $req_no . ".non";
    if (!file_exists($path)) {
      oro_fail("file $path cannot be found!\n");
    }
    $cheng_non_determinism = ReadNondetFromFileSingle($path);
    // use the copied upload file
    if (isset($_FILES['paperUpload']['tmp_name'])) {
      $_FILES['paperUpload']['tmp_name'] = "/tmp/branch/submission/r".$req_no.".pdf";
    }
  } else if ($oro_mode == ORO_VERI) {
    // verification
    if (!isset($req_no)) {
      oro_fail("\$req_no cannot be loaded!\n");
    }
    if (is_multi($req_no)) {
      $oro_batch_size = count(split_multi($req_no));
    } else {
      $oro_batch_size = 1;
    }
    set_batch_size($oro_batch_size);

    $path = "/tmp/branch/non_determ/r" . $req_no . ".non";
    if (!file_exists($path)) {
      oro_fail("file $path cannot be found!\n");
    }
    $cheng_non_determinism = ReadNondetFromFileSingle($path); 
    /*
    if ($oro_batch_size == 1) {
      $cheng_non_determinism = ReadNondetFromFileSingle($path); 
    } else {
      // for performance
      $cheng_non_determinism = ReadNondetFromFileVeri($path); 
    }
     */
    // use the copied upload file
    if (isset($_FILES['paperUpload']['tmp_name'])) {
      $_FILES['paperUpload']['tmp_name'] = "/tmp/branch/submission/r".$req_no.".pdf";
    }
  }

  if (PROFILER) {
    MProfiler::endTick("setup");
  }

  // include non-determinism lib here, since it will be used shortly
  require_once "nondet_lib.php";

  // set site root
  oro_assert(isset($_SERVER["DOCUMENT_ROOT"]));
  $site_root_path = realpath($_SERVER["DOCUMENT_ROOT"]);
  set_site_root($site_root_path);
  // NOTE: instead of directly calculate the length of $_SERVER["DOCUMENT_ROOT"],
  // this allows verifier to know as an non-determinism of the length of site_root 
  $site_root_length = cheng_get_site_root_length();
  $site_root_placeholder = gen_site_root_placeholder($site_root_length);
}

// register the shutdown handler
// Normal needs PROFILER
register_shutdown_function("final_setup");

function final_setup() {
  register_shutdown_function("final_dump");
}

// Used to be a bug: in multiple register_shutdown_function() the non_determ
// inside the later shutdown function will be ignored, and replay will crash.
function clear_mode_var() {
  global $oro_mode;
  $oro_mode = ORO_NORMAL;
}

// The postlog after the execution of the request:
//   record: dump the non-deterministic to log 
//   replay: dump the output to log  (FIXME: may not be necessary)
//   verification: dump the output to log (FIXME: may not be necessary)
//   Normal: since we're using normal as baseline, we do tick on normal_db 
//           when PROFILING_NORML is true.
function final_dump() {
  // Make sure that ob_start handler happens before the final_dump
  while ( ob_get_level() > 0 ) {
    ob_end_flush();
  }

  global $cheng_non_determinism, $oro_mode, $req_no, $op_counter;
  if (PROFILER) {
    MProfiler::startTick("dump");
  }
  //
  //=========For A.1 (n and alpha)============
  if ($oro_mode == ORO_VERI && N_ALPHA_PROFILING) {
    global $oro_mode, $merge_no, $req_no, $oro_batch_size;
    $n_alpha_path = "/tmp/n_alpha.log";
    $output = "--------\n";
    $output .= "merge_no=$merge_no\n";
    $output .= "req_no=" . print_r($req_no,true) . "\n";
    $output .= "n=$oro_batch_size\n";
    $output .= "ins_counter=" . get_ins_counter() . "\n";
    $output .= "multi_ins_counter=" . get_multi_ins_counter() . "\n";
    file_put_contents($n_alpha_path, $output, LOCK_EX|FILE_APPEND);
  }

  //==========For Model Prediction===========
  if ($oro_mode == ORO_VERI && CLASSIFIED_INS_COLLECTING) {
    $human_reable = false;
    $classify_ins_path = "/tmp/classify_ins.log";

    $output = "";
    if ($human_reable) {
      $type_seq = array("arr", "arith", "cf", "get", "set", "isset", "call", "member", "iter", "misc");
      $output .= "----single ops----\n";
      $ins_results = get_classified_ins_counter();
      foreach ($type_seq as $indx=>$type) {
        $output .= "  $type: " . $ins_results[$indx] ."\n";
      }
      if (is_multi($req_no)) {
        $output .= "----multi ops----\n";
        $mins_results = get_classified_mins_counter();
        foreach ($type_seq as $indx=>$type) {
          $output .= "  $type: " . $mins_results[$indx] ."\n";
        }
      }
    } else {
      // this is used to calculate the proportion of each cluster of instructions
      // -- it will discard "misc"
      // -- it will assume verify2.sh running under single mode
      $ins_results = get_classified_ins_counter();
      for ($i=0; $i<9; $i++) {
        $output .= $ins_results[$i].",";
      }
      $output .= "\n";
    }
    file_put_contents($classify_ins_path, $output, LOCK_EX|FILE_APPEND);
  }
  //=========================================

  if ($oro_mode == ORO_RECORD) {
    // record
    $path = "/tmp/branch/non_determ/r" . $req_no . ".non";
    DumpNondetToFile($cheng_non_determinism, $path);
    // if in session, explicit close
    if (session_status() == PHP_SESSION_ACTIVE) {
      cheng_session_write_close();
    }
    //$path = "/tmp/branch/output/r" . $req_no . ".html";
    //cheng_dump_output($path);
    // write down the H.M
    file_put_contents("/tmp/maxop.log", "$req_no:$op_counter,", LOCK_EX|FILE_APPEND);
  } else if ($oro_mode == ORO_REPLAY) {
    // replay
    $path = "/tmp/naive_replay/output/r" . $req_no . ".html";
    cheng_dump_output($path);
    if (session_status() == PHP_SESSION_ACTIVE) {
      session_destroy();
    }
  } else if ($oro_mode == ORO_VERI) {
    // if in session, explicit close
    if (session_status() == PHP_SESSION_ACTIVE) {
      cheng_session_write_close();
    }
    // check the maxop at end
    oro_assert(check_maxop($req_no, $op_counter), "maxop doesn't match");
    // verification
    $is_batch = is_multi($req_no);
    if ($is_batch) {
      global $merge_no;
      if (!isset($merge_no)) {
        oro_fail("merge_no does not exists during replay");
      }
      $path = "/tmp/veri/output/m" . $merge_no . ".log";
      veri_dump_output($path, $req_no);
    } else {
      $path = "/tmp/veri/output/r" . $req_no . ".html";
      replay_dump_output($path);
    }
  } else if ($oro_mode == ORO_NORMAL && PROFILING_NORML) {
    $time = MProfiler::getTraceTime("normal_db");
    file_put_contents("/tmp/normal_db.log", "$time,", FILE_APPEND|LOCK_EX);
  }

  if (PROFILER) {
    MProfiler::endTick("dump");
  }

  clear_mode_var();
  if (PROFILER) {
    MProfiler::endTick("php");
    $time = MProfiler::getTraceTime("php");
    file_put_contents("/tmp/online_php.log", "$time,", FILE_APPEND);
    $time = MProfiler::getTraceTime("setup");
    file_put_contents("/tmp/online_setup.log", "$time,", FILE_APPEND);
    $time = MProfiler::getTraceTime("nondet");
    file_put_contents("/tmp/online_nondet.log", "$time,", FILE_APPEND);
    $time = MProfiler::getTraceTime("dump");
    file_put_contents("/tmp/online_dump.log", "$time,", FILE_APPEND);
    $time = MProfiler::getTraceTime("sql");
    file_put_contents("/tmp/online_sql.log", "$time,", FILE_APPEND);
    $time = MProfiler::getTraceTime("bottleneck");
    file_put_contents("/tmp/online_bottleneck.log", "$time,", FILE_APPEND);
  }
  cheng_cf_escape();
}

//==============================
//=======Resource===============
//==============================

$is_resource_req = false;

function set_resource_req($is_res) {
  global $is_resource_req;
  $is_resource_req = $is_res;
}

function is_resource_req() {
  global $is_resource_req;
  return $is_resource_req;
}

//==============================
//======CF escape===============
//==============================

$cheng_escape_level = 0;
function cheng_cf_escape() {
  if (ESCAPE_ON && function_exists("set_cf_escape")) {
    global $cheng_escape_level;
    set_cf_escape(true);
    $cheng_escape_level++;
  }
}
function cheng_cf_resume() {
  if (ESCAPE_ON && function_exists("set_cf_escape")) {
    global $cheng_escape_level;
    $cheng_escape_level--;
    oro_assert($cheng_escape_level >= 0);
    if ($cheng_escape_level == 0) {
      set_cf_escape(false);
    }
  }
}


//==============================
//======Helper Functions========
//==============================

// the op_num
$op_counter = 0;
// for handling the Transaction
$op_in_txn=false;
$num_within_txn=0;

function gen_op_num() {
  global $op_in_txn, $op_counter;
  // so, op_num start at 1
  if (!$op_in_txn) {
    $op_counter++;
  }
  //$caller = GetCallingInfo(2);
  //echo "  [$op_counter]: $caller\n";
  return $op_counter;
}

function signal_begin_txn() {
  global $op_in_txn, $num_within_txn;
  // doesn't support nested transactions
  oro_assert(!$op_in_txn, "signal_begin_txn but we're already in a transaction");
  oro_assert($num_within_txn == 0, "signal_begin_txn, but found num_within_txn is not zero = $num_within_txn");
  $op_in_txn = true;
  $num_within_txn=0;
}

function signal_commit_txn() {
  global $op_in_txn, $num_within_txn;
  oro_assert($op_in_txn, "signal_commit_txn, but we're out of txn");
  $op_in_txn = false;
  $num_within_txn=0;
}

// FIXME: NOTE: the sequence is delicate here:
//       signal_begin_txn
//       gen_num_in_txn
//       signal_commit_txn
function gen_num_in_txn() {
  global $op_in_txn, $num_within_txn;
  // first BEGIN is start from 0
  return ($op_in_txn) ? $num_within_txn++ : 0;
}

function oro_fail($msg) {
    $output = "FATAL ERROR: $msg\n";
    $output .= GetFullCallingInfo();
    echo $output;
    cheng_debug_lts($output);
    exit(1);
}

function oro_assert($cond, $msg="No comments") {
  if (!$cond) oro_fail($msg);
}

function startsWith($haystack, $needle) {
  // search backwards starting from haystack length characters from the end
  return $needle === "" || strrpos($haystack, $needle, -strlen($haystack)) !== FALSE;
}

function PackToBin($val) {
  global $int_offset;

  $ret = "";
  $type = gettype($val);

  switch ($type) {
  case "NULL":
    $ret = "N";
    break;
  case "boolean":
    $ret = $val ? "B1" : "B0";
    break;
  case "integer":
    $ret = "I" . pack("N", $val+$int_offset);
    break;
  case "double":
    $ret = "D" . pack("d", $val);
    break;
  case "string":
    $len = strlen($val);
    $len_bin = pack("N", $len+$int_offset); // unsigned long (always 32 bit, big endian byte order) 
    $ret = "S" . $len_bin . $val;
    break;
  case "array":
  case "object":
    $ser_val = serialize($val);
    $len = strlen($ser_val);
    $len_bin = pack("N", $len+$int_offset); // unsigned long (always 32 bit, big endian byte order) 
    $ret = "M" . $len_bin . $ser_val; 
    break;
  default:
    oro_fail("meet unknown type for pack: [$type], " . print_r($val, true));
  }

  return $ret;
}

function UnpackFromBin($elem) {
  global $int_pack_size, $int_offset;

  $ret = "";
  $type = $elem[0];
  $payload = substr($elem, 1);

  switch ($type) {
  case "N":
    $ret = NULL;
    break;
  case "B":
    if ($payload == "1") $ret = true;
    else if ($payload == "0") $ret = false;
    else oro_fail("Unpack boolean fail: " . $elem);
    break;
  case "I":
    $ret = unpack('N', $payload)[1] - $int_offset;
    break;
  case "D":
    $ret = unpack("d", $payload)[1];
    break;
  case "S":
    $len_bin = substr($payload, 0, $int_pack_size);
    $payload = substr($payload, $int_pack_size);
    $len = unpack('N', $len_bin)[1] - $int_offset;
    oro_assert($len == strlen($payload), "String length mismatch: " . $elem);
    $ret = ($len==0) ? "" : $payload;
    break;
  case "M":
    $len_bin = substr($payload, 0, $int_pack_size);
    $payload = substr($payload, $int_pack_size);
    $len = unpack('N', $len_bin)[1] - $int_offset;
    oro_assert($len == strlen($payload), "Array/Object length mismatch: " . $elem);
    $ret = unserialize($payload);
    break;
  default:
    oro_fail("meet unknown type during unpack: " . $elem);
  }

  return $ret;
}

function DumpNondetToFile($cheng_non_determinism, $fpath) {
  $elems = array();
  foreach ($cheng_non_determinism as $non_det=>$vals) {
    // microtime:XX,XX,XX,XX;
    $elems[] = $non_det;
    $elems[] = ":";

    foreach ($vals as $val) {
      $elems[] = PackToBin($val);
    }

    $elems[] = "#&#]";
  }

  $out = implode($elems);
  file_put_contents($fpath, $out);
}

function GetPackedTypeLen($type, $next_block_of_int) {
  global $int_pack_size, $double_pack_size, $int_offset;

  switch($type) {
  case "N":
    return 0;
  case "B":
    return 1;
  case "I":
    return $int_pack_size;
  case "D":
    return $double_pack_size;
  case "S":
  case "M":
    // should return strlen( [int][payload] )
    return unpack("N", $next_block_of_int)[1] - $int_offset + $int_pack_size;
  default:
    oro_fail("Should not be here, GetPackedTypeLen meet unknown type: $type");
    return -1;
  }
}

// check whether the data contains delimitor "|]|"
// If they do, we merge the pieces
function Rectifypieces($pieces) {
  $ret = array();
  $prev = $pieces[0];
  for ($i=1; $i<count($pieces); $i++) {
    $token = $pieces[$i];
    // ASSUMPTION: there is no less than two letters non-deterministic function name
    // mt_random
    if (ctype_alpha(substr($token, 0, 2))){
      $ret[] = $prev;
      $prev = $token;
    } else {
      // we should merge this with previous chunk
      $prev .= "#&#]" . $token;
    }
  }

  return $ret;
}

function ReadNondetFromFileSingle($fpath) {
  global $int_pack_size;

  $non_determ = array();

  $buf = file_get_contents($fpath);
  $pieces = explode("#&#]", $buf);

  //$pieces = Rectifypieces($pieces);

  foreach ($pieces as $piece) {
    if (trim($piece) == "") continue;

    $name_pos = strpos($piece, ":");
    $name = substr($piece, 0, $name_pos);

    $payload = substr($piece, $name_pos+1);

    oro_assert(!isset($non_determ[$name]), "The $name has already existed in non-deterministic array!");
    $non_determ[$name] = array();

    $payload_size = strlen($payload);
    $cur_pos = 0;
    for (;;) {
      $type = $payload[$cur_pos];
      $len = GetPackedTypeLen($type, /*next_block_of_int*/substr($payload, $cur_pos+1, $int_pack_size));

      $token = substr($payload, $cur_pos, 1+$len); // Bxxxx
      $non_determ[$name][] = UnpackFromBin($token);

      $cur_pos += (1+$len);
      if ($cur_pos >= $payload_size) break;
    }
  }

  return $non_determ;
}

function ReadNondetFromFileVeri($fpath) {
  global $int_pack_size, $oro_mode;

  oro_assert($oro_mode == ORO_VERI, "ReadNondetFromFileVeri() called from NON-VERI mode");
  $multi_non = is_multi($fpath);

  // during VERI: split the multi-value path
  if ($multi_non) {
    $fpath_arr = split_multi($fpath);
  } else {
    $fpath_arr = array($fpath); 
  }

  $ret_arr = array();

  foreach ($fpath_arr as $cur_path) {
    $non_determ = ReadNondetFromFileSingle($cur_path);
    $ret_arr[] = $non_determ; // might be a list of $non_determ array from different requests
  }

  if ($multi_non) {
    $ret = gen_multi($ret_arr); 
    return $ret;
  } else {
    return $ret_arr[0];
  }
}

function floatToBinStr($value) {                                                                    
  $bin = '';
  $packed = pack('d', $value);
  foreach(str_split(strrev($packed)) as $char) {
    $bin .= str_pad(decbin(ord($char)), 8, 0, STR_PAD_LEFT); 
  }
  return $bin;
}

function binStrToFloat($str) {
  $packed = '';
  $arr = str_split ($str, 8);
  foreach(str_split($str, 8) as $char) {
    $packed = chr(bindec($char)) . $packed;
  }
  return unpack('d', $packed)[1];
}

function GetCallingInfo($level) {
  $info = debug_backtrace();
  $call = $info[$level];
  $func = isset($call['function']) ? $call['function'] : "unknown function";
  $file = isset($call['file']) ? $call['file'] : "unknown file";
  $line = isset($call['line']) ? $call['line'] : "unknown line";

  return $file.":".$line."  ".$func;
}

function GetFullCallingInfo() {
  $info = debug_backtrace();
  $ret = "";
  foreach ($info as $call) {
    $func = isset($call['function']) ? $call['function'] : "unknown function";
    $file = isset($call['file']) ? $call['file'] : "unknown file";
    $line = isset($call['line']) ? $call['line'] : "unknown line";
    $ret .= $file.":".$line."  ".$func."\n";
  }
  return $ret;
}


//==============helper functions for builtin================

/* special wrapper function */
function cheng_shuffle ($items) {
  // FIXME: use deterministic builtin function
  sort($items);
  return $items;
  /*
  mt_srand(); // doesn't matter during replay
  for ($i = count($items) - 1; $i > 0; $i--) {
    $j = cheng_mt_rand(0, $i);
    $tmp = $items[$i];
    $items[$i] = $items[$j];
    $items[$j] = $tmp;
  }
  return $items;
   */
}

function cheng_deep_replace($search, $replace, $val) {
  if (is_string($val)) {
    $val = str_replace($search, $replace, $val);
  } else if (is_array($val)) {
    foreach ($val as $k => $v) {
      $val[$k] = cheng_deep_replace($search, $replace, $v);
    }
  }
  /*
  // too costly, cannot afford it
  // FIXME: what if object? cycle-reference issue
  else if (is_object($val)) {
    foreach ($val as $k => $v) {
      $val->$k = cheng_deep_replace($search, $replace, $v);
    }
  }
   */
  return $val;
}

function cheng_serialize($val) {
  global $oro_mode, $oro_batch_size;
  if ($oro_mode == ORO_NORMAL) {
    return serialize($val);
  }

  // NOTE: for absolute path comparing:
  // -- replace site root path to $site_root_placeholder ("#SITE_ROOT#####")
  // -- serialize
  // -- store (for record mode) OR compare (for veri mode, call oro_apc_store_check)
  global $site_root_placeholder, $site_root_path;
  oro_assert(strlen($site_root_placeholder) >= 10 && strlen($site_root_path) >= 10);

  if ($oro_mode <= ORO_RECORD || !is_multi($val)) {
    // this will work for $cur_val as array, see http://php.net/str_replace
    $val = cheng_deep_replace($site_root_path, $site_root_placeholder, $val);
    $str_val = serialize($val);
    return $str_val;
  } else {
    oro_assert($oro_mode == ORO_VERI, "should in ororveri");
    // used to be a BUG: $val might be a single multi-value
    $str_val_arr = array();
    for ($i=0; $i<$oro_batch_size; $i++) {
      // FIXME: this can be very expensive
      $cur_val = getIthVal($val,$i);
      // NOTE: for absolute path
      $cur_val = cheng_deep_replace($site_root_path, $site_root_placeholder, $cur_val);
      $cur_str_val = serialize($cur_val);
      $str_val_arr[] = $cur_str_val;
    }
    $str_val = gen_multi($str_val_arr);
    return $str_val;
  }
}

function cheng_unserialize($encoded_val) {
  global $oro_mode;
  $ret = unserialize($encoded_val);
  if ($oro_mode == ORO_NORMAL) {
    return $ret; 
  }
  // We are either in 
  // -- ORO_RECORD: change to real root path
  // -- ORO_VERI: change to real root path 
  global $site_root_placeholder, $site_root_path;

  // NOTE: handle absolute path problem
  // -- unserialize
  // -- replace each of the placeholder to real absolute path
  oro_assert(strlen($site_root_placeholder) >= 10 && strlen($site_root_path) >= 10);
  $ret = cheng_deep_replace($site_root_placeholder, $site_root_path, $ret);
  return $ret;
}

function cheng_ksort($array) {
  global $oro_mode;
  if ($oro_mode <= ORO_RECORD || !is_multi($array)) {
    ksort($array);
    return $array;
  } else {
    oro_assert($oro_mode == ORO_VERI, "should in ororveri");
    $m_arr = split_multi($array);
    $new_multi = array();
    foreach ($m_arr as $arr) {
      ksort($arr);
      $new_multi[] = $arr;
    }
    $ret = gen_multi($new_multi);
    return $ret;
  }
}

function cheng_array_multisort ($array, $param) {
  global $oro_mode;
  if ($oro_mode <= ORO_RECORD || !is_multi($array)) {
    array_multisort($array, $param);
    return $array;
  } else {
    oro_assert($oro_mode == ORO_VERI, "should in ororveri");
    $m_arr = split_multi($array);
    $new_multi = array();
    foreach ($m_arr as $arr) {
      array_multisort($arr, $param);
      $new_multi[] = $arr;
    }
    $ret = gen_multi($new_multi);
    return $ret;
  }
}

function cheng_settype ($val, $type) {
  global $oro_mode;
  if ($oro_mode <= ORO_RECORD) {
    settype($val, $type);
    return $val;
  } else if ($oro_mode == ORO_VERI) {
    if (is_multi($val)) {
      $multi = split_multi($val);
      $new_multi = array();
      foreach ($multi as $val) {
        settype($val, $type);
        $new_multi[] = $val;
      }
      $ret = gen_multi($new_multi);
      return $ret;
    } else {
      settype($val, $type);
      return $val;
    }
  }
}

function cheng_fastcgi_finish_request() {
  global $oro_mode;
  if ($oro_mode == ORO_NORMAL) {
    fastcgi_finish_request();
  } else {
    // do nothing, Orochi doesn't allow reply first 
  }
}

//================================
//=====Absolute Path==============
//================================

function replace_abspath_to_placeholder($value) {
  global $oro_mode;
  // if in normal mode, do nothing
  if ($oro_mode == ORO_NORMAL) {
    return $value;
  }

  global $site_root_path, $site_root_placeholder;
  oro_assert(strlen($site_root_placeholder) >= 10 && strlen($site_root_path) >= 10);
  return cheng_deep_replace($site_root_path, $site_root_placeholder, $value);
}

function replace_placeholder_to_abspath($value) {
  global $oro_mode;
  // if in normal mode, do nothing
  if ($oro_mode == ORO_NORMAL) {
    return $value;
  }

  global $site_root_path, $site_root_placeholder;
  oro_assert(strlen($site_root_placeholder) >= 10 && strlen($site_root_path) >= 10);
  return cheng_deep_replace($site_root_placeholder, $site_root_path, $value);
}

//================================
//=====Native Lock================
//================================
// Only works when in record mode

function cheng_lock($lock_name) {
  global $oro_mode;
  oro_assert(is_string($lock_name), "The lock name isn't string. It is " . print_r($lock_name,true));
  if ($oro_mode == ORO_RECORD) {
    naive_native_lock($lock_name);
    return true;
  } else if ($oro_mode == ORO_VERI) {
    // NOTE: assume there are no contentions during verification
    return true;
  }
  return false;
}

function cheng_unlock($lock_name) {
  global $oro_mode;
  if ($oro_mode == ORO_RECORD) {
    naive_native_unlock($lock_name);
    return true;
  } else if ($oro_mode == ORO_VERI) {
    // NOTE: assume there are no contention during verification
    return true;
  }
  return false;
}

//============================
//=======Debug Func===========
//============================

function cheng_debug_val($val) {
  cheng_debug("[" . gettype($val) . "]:" . print_r($val, true));
}

function cheng_debug($text) {
  static $first = true;

  $info = debug_backtrace();
  $call = $info[1];
  $file = isset($call['file']) ? $call['file'] : "unknown file";
  $line = isset($call['line']) ? $call['line'] : "unknown line";

  $msg = "[" . $file . ":" . $line . "]  " . $text . "\n";
  if ($first) {
    file_put_contents("/tmp/lib_dbg.log", "<".date("H:i:s").">\n".$msg);
    $first = false;
  } else {
    file_put_contents("/tmp/lib_dbg.log", $msg, FILE_APPEND);
  }
}

function cheng_debug_lts($text) {
  static $first = true;

  $info = debug_backtrace();
  $call = $info[1];
  $file = isset($call['file']) ? $call['file'] : "unknown file";
  $line = isset($call['line']) ? $call['line'] : "unknown line";

  $msg = "[" . $file . ":" . $line . "]  " . $text . "\n";
  if ($first) {
    global $req_no;
    $title = "\n---------[$req_no]----------\n";
    file_put_contents("/tmp/lib_LTS_dbg.log", $title, FILE_APPEND);
    $first = false;
  }

  file_put_contents("/tmp/lib_LTS_dbg.log", $msg, FILE_APPEND);
}

//==================================
//========Ref2Normal Functions======
//==================================

function cheng_assign($array, $keys, $val) {
  $num_loop = count($keys);
  if ($num_loop > 10) {
    foreach ($keys as $key) {
      $array = &$array[$key];
    }
    $array = $val;
    return $array;
  } else {
    if ($num_loop == 1) {
      $array[$keys[0]] = $val;
    } else if ($num_loop == 2) {
      $array[$keys[0]][$keys[1]] = $val;
    }else if ($num_loop == 3) {
      $array[$keys[0]][$keys[1]][$keys[2]] = $val;
    }else if ($num_loop == 4) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]] = $val;
    }else if ($num_loop == 5) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]] = $val;
    }else if ($num_loop == 6) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]] = $val;
    }else if ($num_loop == 7) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]] = $val;
    }else if ($num_loop == 8) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]] = $val;
    }else if ($num_loop == 9) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][$keys[8]] = $val;
    }else if ($num_loop == 10) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][$keys[8]][$keys[9]] = $val;
    }
    return $array;
  }
}

function cheng_append($array, $keys, $val) {
  $num_loop = count($keys);
  if ($num_loop > 10) {
    foreach ($keys as $key) {
      $array = &$array[$key];
    }
    $array[] = $val;
    return $array;
  } else {
    if ($num_loop == 1) {
      $array[$keys[0]][] = $val;
    } else if ($num_loop == 2) {
      $array[$keys[0]][$keys[1]][] = $val;
    }else if ($num_loop == 3) {
      $array[$keys[0]][$keys[1]][$keys[2]][] = $val;
    }else if ($num_loop == 4) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][] = $val;
    }else if ($num_loop == 5) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][] = $val;
    }else if ($num_loop == 6) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][] = $val;
    }else if ($num_loop == 7) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][] = $val;
    }else if ($num_loop == 8) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][] = $val;
    }else if ($num_loop == 9) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][$keys[8]][] = $val;
    }else if ($num_loop == 10) {
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][$keys[8]][$keys[9]][] = $val;
    }
    return $array;
  }
}

function cheng_unset($array, $keys) {
  $num_loop = count($keys);
  if ($num_loop > 10) {
    foreach ($keys as $key) {
      $array = &$array[$key];
    }
    unset($array);
  } else {
    if ($num_loop == 1) {
      unset($array[$keys[0]]);
    } else if ($num_loop == 2) {
      unset($array[$keys[0]][$keys[1]]);
    }else if ($num_loop == 3) {
      unset($array[$keys[0]][$keys[1]][$keys[2]]);
    }else if ($num_loop == 4) {
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]]);
    }else if ($num_loop == 5) {
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]]);
    }else if ($num_loop == 6) {
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]]);
    }else if ($num_loop == 7) {
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]]);
    }else if ($num_loop == 8) {
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]]);
    }else if ($num_loop == 9) {
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][$keys[8]]);
    }else if ($num_loop == 10) {
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][$keys[8]][$keys[9]]);
    }
  }
}



//============================
//====Include other libs======
//============================


include "ttapc_lib.php";
include "ttdb_lib.php";
include "sess_lib.php";
require_once "nondet_lib.php"; // in case in the normal mode
