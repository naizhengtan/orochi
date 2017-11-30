<?php

function cheng_microtime () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = microtime();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = microtime($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = microtime($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = microtime($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = microtime($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = microtime($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = microtime($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function microtime has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["microtime"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["microtime_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["microtime_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["microtime"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for microtime at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["microtime_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [microtime:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["microtime_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["microtime_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = microtime();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = microtime($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = microtime($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = microtime($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = microtime($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = microtime($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = microtime($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function microtime has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_mktime () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = mktime();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = mktime($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = mktime($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = mktime($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = mktime($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = mktime($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = mktime($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function mktime has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["mktime"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["mktime_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["mktime_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["mktime"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for mktime at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["mktime_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [mktime:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["mktime_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["mktime_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = mktime();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = mktime($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = mktime($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = mktime($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = mktime($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = mktime($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = mktime($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function mktime has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_mt_rand () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = mt_rand();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = mt_rand($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = mt_rand($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = mt_rand($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = mt_rand($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = mt_rand($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = mt_rand($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function mt_rand has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["mt_rand"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["mt_rand_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["mt_rand_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["mt_rand"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for mt_rand at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["mt_rand_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [mt_rand:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["mt_rand_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["mt_rand_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = mt_rand();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = mt_rand($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = mt_rand($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = mt_rand($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = mt_rand($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = mt_rand($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = mt_rand($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function mt_rand has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_openssl_random_pseudo_bytes () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = openssl_random_pseudo_bytes();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = openssl_random_pseudo_bytes($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = openssl_random_pseudo_bytes($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = openssl_random_pseudo_bytes($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = openssl_random_pseudo_bytes($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = openssl_random_pseudo_bytes($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = openssl_random_pseudo_bytes($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function openssl_random_pseudo_bytes has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["openssl_random_pseudo_bytes"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["openssl_random_pseudo_bytes_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["openssl_random_pseudo_bytes_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["openssl_random_pseudo_bytes"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for openssl_random_pseudo_bytes at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["openssl_random_pseudo_bytes_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [openssl_random_pseudo_bytes:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["openssl_random_pseudo_bytes_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["openssl_random_pseudo_bytes_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = openssl_random_pseudo_bytes();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = openssl_random_pseudo_bytes($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = openssl_random_pseudo_bytes($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = openssl_random_pseudo_bytes($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = openssl_random_pseudo_bytes($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = openssl_random_pseudo_bytes($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = openssl_random_pseudo_bytes($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function openssl_random_pseudo_bytes has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_session_id () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = session_id();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = session_id($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = session_id($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = session_id($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = session_id($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = session_id($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = session_id($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function session_id has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["session_id"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["session_id_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["session_id_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["session_id"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for session_id at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["session_id_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [session_id:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["session_id_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["session_id_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = session_id();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = session_id($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = session_id($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = session_id($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = session_id($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = session_id($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = session_id($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function session_id has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_time () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = time();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = time($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = time($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = time($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = time($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = time($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = time($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function time has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["time"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["time_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["time_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["time"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for time at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["time_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [time:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["time_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["time_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = time();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = time($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = time($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = time($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = time($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = time($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = time($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function time has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_is_uploaded_file () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = is_uploaded_file();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = is_uploaded_file($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = is_uploaded_file($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = is_uploaded_file($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = is_uploaded_file($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = is_uploaded_file($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = is_uploaded_file($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function is_uploaded_file has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["is_uploaded_file"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["is_uploaded_file_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["is_uploaded_file_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["is_uploaded_file"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for is_uploaded_file at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["is_uploaded_file_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [is_uploaded_file:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["is_uploaded_file_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["is_uploaded_file_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = is_uploaded_file();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = is_uploaded_file($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = is_uploaded_file($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = is_uploaded_file($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = is_uploaded_file($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = is_uploaded_file($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = is_uploaded_file($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function is_uploaded_file has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_mysqli_insert_id () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = mysqli_insert_id();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = mysqli_insert_id($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = mysqli_insert_id($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = mysqli_insert_id($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = mysqli_insert_id($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = mysqli_insert_id($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = mysqli_insert_id($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function mysqli_insert_id has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["mysqli_insert_id"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["mysqli_insert_id_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["mysqli_insert_id_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["mysqli_insert_id"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for mysqli_insert_id at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["mysqli_insert_id_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [mysqli_insert_id:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["mysqli_insert_id_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["mysqli_insert_id_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = mysqli_insert_id();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = mysqli_insert_id($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = mysqli_insert_id($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = mysqli_insert_id($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = mysqli_insert_id($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = mysqli_insert_id($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = mysqli_insert_id($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function mysqli_insert_id has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_getdate () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = getdate();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = getdate($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = getdate($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = getdate($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = getdate($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = getdate($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = getdate($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function getdate has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["getdate"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["getdate_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["getdate_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["getdate"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for getdate at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["getdate_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [getdate:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["getdate_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["getdate_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = getdate();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = getdate($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = getdate($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = getdate($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = getdate($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = getdate($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = getdate($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function getdate has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_mysqli_affected_rows () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = mysqli_affected_rows();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = mysqli_affected_rows($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = mysqli_affected_rows($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = mysqli_affected_rows($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = mysqli_affected_rows($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = mysqli_affected_rows($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = mysqli_affected_rows($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function mysqli_affected_rows has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["mysqli_affected_rows"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["mysqli_affected_rows_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["mysqli_affected_rows_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["mysqli_affected_rows"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for mysqli_affected_rows at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["mysqli_affected_rows_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [mysqli_affected_rows:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["mysqli_affected_rows_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["mysqli_affected_rows_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = mysqli_affected_rows();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = mysqli_affected_rows($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = mysqli_affected_rows($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = mysqli_affected_rows($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = mysqli_affected_rows($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = mysqli_affected_rows($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = mysqli_affected_rows($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function mysqli_affected_rows has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_array_rand () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = array_rand();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = array_rand($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = array_rand($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = array_rand($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = array_rand($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = array_rand($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = array_rand($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function array_rand has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["array_rand"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["array_rand_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["array_rand_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["array_rand"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for array_rand at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["array_rand_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [array_rand:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["array_rand_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["array_rand_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = array_rand();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = array_rand($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = array_rand($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = array_rand($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = array_rand($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = array_rand($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = array_rand($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function array_rand has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_date () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = date();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = date($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = date($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = date($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = date($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = date($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = date($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function date has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["date"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["date_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["date_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["date"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for date at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["date_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [date:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["date_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["date_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = date();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = date($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = date($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = date($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = date($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = date($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = date($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function date has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_date_create () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = date_create();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = date_create($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = date_create($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = date_create($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = date_create($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = date_create($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = date_create($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function date_create has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["date_create"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["date_create_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["date_create_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["date_create"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for date_create at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["date_create_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [date_create:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["date_create_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["date_create_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = date_create();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = date_create($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = date_create($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = date_create($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = date_create($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = date_create($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = date_create($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function date_create has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_gmdate () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = gmdate();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = gmdate($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = gmdate($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = gmdate($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = gmdate($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = gmdate($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = gmdate($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function gmdate has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["gmdate"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["gmdate_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["gmdate_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["gmdate"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for gmdate at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["gmdate_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [gmdate:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["gmdate_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["gmdate_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = gmdate();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = gmdate($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = gmdate($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = gmdate($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = gmdate($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = gmdate($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = gmdate($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function gmdate has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_getmypid () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = getmypid();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = getmypid($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = getmypid($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = getmypid($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = getmypid($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = getmypid($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = getmypid($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function getmypid has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["getmypid"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["getmypid_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["getmypid_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["getmypid"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for getmypid at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["getmypid_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [getmypid:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["getmypid_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["getmypid_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = getmypid();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = getmypid($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = getmypid($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = getmypid($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = getmypid($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = getmypid($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = getmypid($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function getmypid has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_session_regenerate_id () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = session_regenerate_id();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = session_regenerate_id($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = session_regenerate_id($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = session_regenerate_id($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = session_regenerate_id($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = session_regenerate_id($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = session_regenerate_id($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function session_regenerate_id has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["session_regenerate_id"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["session_regenerate_id_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["session_regenerate_id_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["session_regenerate_id"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for session_regenerate_id at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["session_regenerate_id_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [session_regenerate_id:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["session_regenerate_id_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["session_regenerate_id_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = session_regenerate_id();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = session_regenerate_id($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = session_regenerate_id($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = session_regenerate_id($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = session_regenerate_id($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = session_regenerate_id($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = session_regenerate_id($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function session_regenerate_id has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_random_bytes () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = random_bytes();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = random_bytes($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = random_bytes($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = random_bytes($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = random_bytes($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = random_bytes($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = random_bytes($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function random_bytes has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["random_bytes"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["random_bytes_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["random_bytes_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["random_bytes"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for random_bytes at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["random_bytes_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [random_bytes:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["random_bytes_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["random_bytes_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = random_bytes();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = random_bytes($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = random_bytes($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = random_bytes($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = random_bytes($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = random_bytes($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = random_bytes($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function random_bytes has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_memory_get_usage () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = memory_get_usage();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = memory_get_usage($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = memory_get_usage($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = memory_get_usage($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = memory_get_usage($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = memory_get_usage($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = memory_get_usage($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function memory_get_usage has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["memory_get_usage"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["memory_get_usage_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["memory_get_usage_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["memory_get_usage"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for memory_get_usage at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["memory_get_usage_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [memory_get_usage:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["memory_get_usage_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["memory_get_usage_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = memory_get_usage();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = memory_get_usage($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = memory_get_usage($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = memory_get_usage($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = memory_get_usage($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = memory_get_usage($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = memory_get_usage($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function memory_get_usage has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_stat () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = stat();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = stat($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = stat($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = stat($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = stat($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = stat($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = stat($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function stat has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["stat"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["stat_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["stat_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["stat"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for stat at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["stat_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [stat:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["stat_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["stat_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = stat();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = stat($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = stat($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = stat($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = stat($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = stat($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = stat($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function stat has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_uniqid () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = uniqid();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = uniqid($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = uniqid($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = uniqid($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = uniqid($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = uniqid($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = uniqid($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function uniqid has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["uniqid"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["uniqid_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["uniqid_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["uniqid"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for uniqid at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["uniqid_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [uniqid:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["uniqid_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["uniqid_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = uniqid();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = uniqid($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = uniqid($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = uniqid($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = uniqid($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = uniqid($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = uniqid($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function uniqid has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_mcrypt_create_iv () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = mcrypt_create_iv();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = mcrypt_create_iv($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = mcrypt_create_iv($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = mcrypt_create_iv($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = mcrypt_create_iv($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = mcrypt_create_iv($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = mcrypt_create_iv($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function mcrypt_create_iv has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["mcrypt_create_iv"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["mcrypt_create_iv_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["mcrypt_create_iv_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["mcrypt_create_iv"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for mcrypt_create_iv at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["mcrypt_create_iv_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [mcrypt_create_iv:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["mcrypt_create_iv_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["mcrypt_create_iv_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = mcrypt_create_iv();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = mcrypt_create_iv($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = mcrypt_create_iv($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = mcrypt_create_iv($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = mcrypt_create_iv($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = mcrypt_create_iv($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = mcrypt_create_iv($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function mcrypt_create_iv has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_realpath () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = realpath();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = realpath($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = realpath($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = realpath($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = realpath($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = realpath($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = realpath($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function realpath has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["realpath"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["realpath_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["realpath_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["realpath"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for realpath at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["realpath_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [realpath:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["realpath_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["realpath_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = realpath();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = realpath($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = realpath($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = realpath($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = realpath($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = realpath($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = realpath($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function realpath has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_touch () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = touch();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = touch($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = touch($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = touch($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = touch($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = touch($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = touch($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function touch has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["touch"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["touch_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["touch_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["touch"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for touch at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["touch_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [touch:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["touch_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["touch_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = touch();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = touch($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = touch($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = touch($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = touch($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = touch($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = touch($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function touch has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_filemtime () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = filemtime();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = filemtime($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = filemtime($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = filemtime($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = filemtime($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = filemtime($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = filemtime($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function filemtime has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["filemtime"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["filemtime_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["filemtime_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["filemtime"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for filemtime at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["filemtime_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [filemtime:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["filemtime_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["filemtime_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = filemtime();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = filemtime($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = filemtime($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = filemtime($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = filemtime($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = filemtime($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = filemtime($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function filemtime has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_date_timestamp_get () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = date_timestamp_get();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = date_timestamp_get($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = date_timestamp_get($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = date_timestamp_get($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = date_timestamp_get($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = date_timestamp_get($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = date_timestamp_get($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function date_timestamp_get has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["date_timestamp_get"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["date_timestamp_get_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["date_timestamp_get_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["date_timestamp_get"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for date_timestamp_get at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["date_timestamp_get_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [date_timestamp_get:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["date_timestamp_get_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["date_timestamp_get_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = date_timestamp_get();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = date_timestamp_get($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = date_timestamp_get($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = date_timestamp_get($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = date_timestamp_get($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = date_timestamp_get($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = date_timestamp_get($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function date_timestamp_get has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_date_format () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = date_format();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = date_format($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = date_format($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = date_format($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = date_format($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = date_format($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = date_format($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function date_format has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["date_format"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["date_format_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["date_format_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["date_format"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for date_format at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["date_format_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [date_format:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["date_format_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["date_format_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = date_format();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = date_format($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = date_format($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = date_format($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = date_format($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = date_format($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = date_format($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function date_format has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_date_offset_get () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = date_offset_get();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = date_offset_get($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = date_offset_get($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = date_offset_get($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = date_offset_get($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = date_offset_get($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = date_offset_get($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function date_offset_get has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["date_offset_get"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["date_offset_get_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["date_offset_get_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["date_offset_get"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for date_offset_get at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["date_offset_get_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [date_offset_get:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["date_offset_get_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["date_offset_get_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = date_offset_get();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = date_offset_get($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = date_offset_get($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = date_offset_get($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = date_offset_get($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = date_offset_get($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = date_offset_get($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function date_offset_get has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}

function cheng_get_site_root_length () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    
    switch (func_num_args()) {
        case 0:
            $ret = get_site_root_length();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = get_site_root_length($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = get_site_root_length($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = get_site_root_length($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = get_site_root_length($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = get_site_root_length($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = get_site_root_length($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function get_site_root_length has too many args: " . func_num_args());
    }

    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["get_site_root_length"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["get_site_root_length_calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["get_site_root_length_calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["get_site_root_length"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for get_site_root_length at $counter\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["get_site_root_length_calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [get_site_root_length:".$counter."] does not match!\n";
        echo "==========Current========\n";
        echo "   Replay: " . GetCallingInfo(1) . "\n";
        echo "   Record: " . $cheng_non_determinism["get_site_root_length_calling"][$counter] . "\n";
        echo "==========CALLBACK========\n";
        echo "   Replay: " . GetFullCallingInfo() . "\n";
        echo "   Record: " . $cheng_non_determinism["get_site_root_length_calling_full"][$counter] . "\n";
        echo "==========================\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    
    switch (func_num_args()) {
        case 0:
            $ret = get_site_root_length();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = get_site_root_length($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = get_site_root_length($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = get_site_root_length($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = get_site_root_length($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = get_site_root_length($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = get_site_root_length($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function get_site_root_length has too many args: " . func_num_args());
    }


    if (PROFILER) {
        MProfiler::endTick("nondet");
    }
    return $ret;
  }

  $counter++;

  if (PROFILER) {
    MProfiler::endTick("nondet");
  }
  return $ret;
}
