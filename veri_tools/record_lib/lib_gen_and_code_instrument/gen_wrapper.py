import sys

nd_func = ["microtime", "mktime", "mt_rand", "openssl_random_pseudo_bytes", "session_id",
        "time", "is_uploaded_file", "mysqli_insert_id", "getdate",
        # previous is hotcrp, following is wiki
        "mysqli_affected_rows",
        #"apc_dec", "apc_delete", "apc_fetch", "apc_inc", "apc_store",
        "array_rand", "date", "date_create", "gmdate", "getmypid", "session_regenerate_id",
        # suspicioius:
        #"getrusage", "gethostbynamel", "stream_select", "tempnam",
        # from phpbb
        "random_bytes", "memory_get_usage", "stat", "uniqid", "mcrypt_create_iv",  "realpath", "touch",
        "filemtime",
        # for datetime class
        "date_timestamp_get", "date_format", "date_offset_get",
        # used for absolute path solution
        "get_site_root_length"
        ]

nd_class = [ "datetime" ]

nd_class_method = [ ["datetime", "getTimestamp"],
                    ["datetime", "format" ] ]

nd_se_func = ['shuffle']

fn_template = '''
function cheng___FUNC__ () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    __CALL_ORIGIN_FUNC__
    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["__FUNC__"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["__FUNC___calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["__FUNC___calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["__FUNC__"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for __FUNC__ at $counter\\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["__FUNC___calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [__FUNC__:".$counter."] does not match!\\n";
        echo "==========Current========\\n";
        echo "   Replay: " . GetCallingInfo(1) . "\\n";
        echo "   Record: " . $cheng_non_determinism["__FUNC___calling"][$counter] . "\\n";
        echo "==========CALLBACK========\\n";
        echo "   Replay: " . GetFullCallingInfo() . "\\n";
        echo "   Record: " . $cheng_non_determinism["__FUNC___calling_full"][$counter] . "\\n";
        echo "==========================\\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    __CALL_ORIGIN_FUNC__

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
'''



fn_call_template = '''
    switch (func_num_args()) {
        case 0:
            $ret = __FUNC__();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = __FUNC__($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = __FUNC__($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = __FUNC__($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = __FUNC__($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = __FUNC__($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = __FUNC__($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function __FUNC__ has too many args: " . func_num_args());
    }
'''


cls_template = '''
function cheng_new___CLASS__ () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    __NEW_ORIGIN_CLASS__
    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["new__CLASS__"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["__CLASS___calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["__CLASS___calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["new__CLASS__"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for new __CLASS__ at $counter\\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["__CLASS___calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [__CLASS__:".$counter."] does not match!\\n";
        echo "==========Current========\\n";
        echo "   Replay: " . GetCallingInfo(1) . "\\n";
        echo "   Record: " . $cheng_non_determinism["__CLASS___calling"][$counter] . "\\n";
        echo "==========CALLBACK========\\n";
        echo "   Replay: " . GetFullCallingInfo() . "\\n";
        echo "   Record: " . $cheng_non_determinism["__CLASS___calling_full"][$counter] . "\\n";
        echo "==========================\\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    __NEW_ORIGIN_CLASS__

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
'''


class_new_template = '''
    switch (func_num_args()) {
        case 0:
            $ret = new __CLASS__();
            break;
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = new __CLASS__($arg0);
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = new __CLASS__($arg0, $arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = new __CLASS__($arg0, $arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = new __CLASS__($arg0, $arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = new __CLASS__($arg0, $arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = new __CLASS__($arg0, $arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function new __CLASS__ has too many args: " . func_num_args());
    }
'''

method_template = '''
function cheng___CLASS_____METHOD__ () {
  global $cheng_non_determinism, $oro_mode;
  static $counter = 0;

  if (PROFILER) {
    MProfiler::startTick("nondet");
  }

  if ($oro_mode == ORO_RECORD) {
    // record: record the result
    __ORIGIN_METHOD__
    if (is_null($ret)) {
      // NULL and undefined during replay is indistinguishable
      $ret = "_NULL_";
    }

    $cheng_non_determinism["__CLASS____METHOD__"][$counter] = $ret;
    
    if (ORO_DEBUG) {
      $cheng_non_determinism["__CLASS____METHOD___calling"][$counter] = GetCallingInfo(1);
      $cheng_non_determinism["__CLASS____METHOD___calling_full"][$counter] = GetFullCallingInfo();
    }
  } else if ($oro_mode == ORO_REPLAY || $oro_mode == ORO_VERI) {
    // replay: fetch the recorded result and return
    $ret = $cheng_non_determinism["__CLASS____METHOD__"][$counter];

    if (isset($ret)) {
      if ($ret === "_NULL_") {
        $ret = null;
      }
    } else {
      echo "FATAL ERROR: there is no result for __CLASS__->__METHOD__ at $counter\\n";
      echo GetFullCallingInfo();
      exit(1);
    }

    if (RIG_CHECK) {
      if ($cheng_non_determinism["__CLASS____METHOD___calling"][$counter] != GetCallingInfo(1)) {
        echo "FATAL ERROR: calling [__METHOD__:".$counter."] does not match!\\n";
        echo "==========Current========\\n";
        echo "   Replay: " . GetCallingInfo(1) . "\\n";
        echo "   Record: " . $cheng_non_determinism["__METHOD___calling"][$counter] . "\\n";
        echo "==========CALLBACK========\\n";
        echo "   Replay: " . GetFullCallingInfo() . "\\n";
        echo "   Record: " . $cheng_non_determinism["__METHOD___calling_full"][$counter] . "\\n";
        echo "==========================\\n";
        exit(1);
      }
    }
  } else if ($oro_mode == ORO_NORMAL) {
    __ORIGIN_METHOD__

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
'''


class_call_template = '''
    switch (func_num_args()) {
        case 1:
            $arg0 = func_get_arg(0);
            $ret  = $arg0->__METHOD__();
            break;
        case 2:
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $ret = $arg0->__METHOD__($arg1);
            break;
        case 3: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $ret = $arg0->__METHOD__($arg1, $arg2);
            break;
        case 4: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $ret = $arg0->__METHOD__($arg1, $arg2, $arg3);
            break;
        case 5: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $ret = $arg0->__METHOD__($arg1, $arg2, $arg3, $arg4);
            break;
        case 6: 
            $arg0 = func_get_arg(0);
            $arg1 = func_get_arg(1);
            $arg2 = func_get_arg(2);
            $arg3 = func_get_arg(3);
            $arg4 = func_get_arg(4);
            $arg5 = func_get_arg(5);
            $ret = $arg0->__METHOD__($arg1, $arg2, $arg3, $arg4, $arg5);
            break;
        default:
            throw new Exception("function __METHOD__ has too many args or has zero args: " . func_num_args());
    }
'''

def gen_func(func_name):
    body = fn_template.replace("__CALL_ORIGIN_FUNC__", fn_call_template).replace("__FUNC__", func_name)
    return body 

def gen_class(class_name):
    body = cls_template.replace("__NEW_ORIGIN_CLASS__", class_new_template).replace("__CLASS__", class_name)
    return body 

def gen_class_method(cls_method):
    cls = cls_method[0]
    mtd = cls_method[1]
    body = method_template.replace("__ORIGIN_METHOD__", class_call_template).replace("__CLASS__", cls).replace("__METHOD__", mtd)
    return body 

# main
if len(sys.argv) != 2:
    print "Usage: " + sys.argv[0] + " <out-file>"
    exit(1)


buf = "<?php\n" 
for func in nd_func:
    buf += gen_func(func)
#for cls in nd_class:
#    buf += gen_class(cls)
#for cls_call in nd_class_method:
#    buf += gen_class_method(cls_call)

with open(sys.argv[1], 'w') as wf: wf.write(buf)
