<?php

//======================================
//=========Global Variables=============
//======================================

$int_offset = 1000; // to avoid the ASCii code
$double_pack_size = strlen(pack('d', 0.1));
$int_pack_size = strlen(pack('N', 10000));

function usage() {
  echo "Usage: check_nondet.php <folder_non>(input)\n";
}

// ------------------
// main
// ------------------
// Usage: check_nondet.php <folder_non>(input)

if (count($argv) != 2) {
  usage();
  exit(1);
}

$fd = $argv[1];

$logs = scandir($fd);

$cheng_non_determinism = array();

foreach ($logs as $file_name) {
  if (!EndsWith($file_name, "non")) {
    continue;
  }
  // $file_name does not come with path
  $path = $fd . "/" . $file_name;
  $rid = substr($file_name, 1, -4);
  $cheng_non_determinism[$rid] = ReadNondetFromFile($path);
}

//print_r($cheng_non_determinism);
validate_time($cheng_non_determinism);
$rid2sid = get_rid_sid_mapping();
validate_session_id($cheng_non_determinism);
validate_microtime($cheng_non_determinism);
echo "PASS!\n";

//==============================
//======Check Functions=========
//==============================
function get_rid_sid_mapping() {
  $contents = file_get_contents("/tmp/rid_sid.log");
  $entries = explode(";", $contents);
  $rid2sid = array();
  foreach ($entries as $entry) {
    if (trim($entry) == "") continue;
    $tokens = explode(",", $entry);
    oro_assert(count($tokens) == 2, "[$entry] is problematic!");
    oro_assert(!isset($rid2sid[$tokens[0]]), "duplicated rid [".$tokens[0]."]");
    $rid2sid[$tokens[0]] = $tokens[1];
  }
  //print_r($rid2sid);
  return $rid2sid;
}


function validate_time(&$cheng_non_determinism) {
  foreach ($cheng_non_determinism as $req_non) {
    if (isset($req_non['time'])) {
      $prev = $req_non['time'][0];
      for ($i = 1; $i < count($req_non['time']); $i++) {
        if ($prev == NULL) {
          $prev = $req_non['time'][$i];
          continue;
        } else {
          oro_assert($req_non['time'][$i] >= $prev, "time() validation fail");
          $prev = $req_non['time'][$i];
        }
      }
    }
  }
}

function validate_session_id(&$cheng_non_determinism) {
  global $rid2sid;
  foreach ($cheng_non_determinism as $rid=>$req_non) {
    if (isset($req_non['session_id'])) {
      $prev = $req_non['session_id'][0];
      oro_assert($rid2sid[$rid] == $prev, "session_id() validation fail[1]");
      for ($i = 1; $i < count($req_non['session_id']); $i++) {
        if ($prev == NULL) {
          $prev = $req_non['session_id'][$i];
          continue;
        } else {
          oro_assert($req_non['session_id'][$i] == $prev, "session_id() validation fail");
          $prev = $req_non['session_id'][$i];
        }
      }
    }
  }
}

function validate_microtime(&$cheng_non_determinism) {
  foreach ($cheng_non_determinism as $req_non) {
    if (isset($req_non['microtime'])) {
      $prev = $req_non['microtime'][0];
      for ($i = 1; $i < count($req_non['microtime']); $i++) {
        if ($prev == NULL) {
          $prev = $req_non['microtime'][$i];
          continue;
        } else {
          oro_assert($req_non['microtime'][$i] >= $prev, "microtime() validation fail");
          $prev = $req_non['microtime'][$i];
        }
      }
    }
  }
}

//==============================
//======Helper Functions========
//==============================

function oro_fail($msg) {
    echo "FATAL ERROR: $msg\n";
    exit(1);
}

function oro_assert($cond, $msg) {
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

    $elems[] = "|]|";
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
    echo "Should not be here, GetPackedTypeLen meet unknown type: $type\n";
    return -1;
  }
}

// check whether the data contains delimitor "|]|"
// If they do, we merge the pieces
function RectifyPiecies($pieces) {
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
      $prev .= "|]|" . $token;
    }
  }

  return $ret;
}

function ReadNondetFromFile($fpath) {
  global $int_pack_size;

  $non_determ = array();

  $buf = file_get_contents($fpath);
  $pieces = explode("|]|", $buf);

  $pieces = RectifyPiecies($pieces);

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
      if ($len == -1) {
        //oro_fail("Fail on $fpath log parsing");
        echo ("Fail on $fpath log parsing\n");
        break; // skip this file
      }

      $token = substr($payload, $cur_pos, 1+$len); // Bxxxx
      $non_determ[$name][] = UnpackFromBin($token);

      $cur_pos += (1+$len);
      if ($cur_pos >= $payload_size) break;
    }
  }

  return $non_determ;
}

function EndsWith($haystack, $needle)
{
  $length = strlen($needle);
  if ($length == 0) {
    return true;
  }

  return (substr($haystack, -$length) === $needle);
}
