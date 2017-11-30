<?php
// ASSUMPTION:
// This script should run under php, since it needs HTTP module.

// (1) read from trace, pair the rid
// (2) read the request from request file
// (3) do the main thing
//    * parsing the headers
//    * construct new req file 
//    * [How to handle FILE?]

function usage() {
  echo "send_req.php <trace_req.log>(input) <trace_seq.log>(input) <url>(input) <dest-folder>(output)\n";
}

function fail($msg) {
  echo "FATAL ERROR: $msg\n";
  exit(1);
}

function cheng_assert($cond, $msg="") {
  if (!$cond) {
    echo GetFullCallingInfo();
    fail($msg);
  }
}  

function dbg_log($msg) {
  file_put_contents("dbg.log", $msg, FILE_APPEND);
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

/* example: /tmp/branch/requests/r0.raw
 *
GET / HTTP/HTTP/1.1
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,* /*;q=0.8
User-Agent: Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1
Connection: Keep-Alive
Accept-Encoding: gzip, deflate
Accept-Language: en-US,*
Host: yak-cheng.duckdns.org:4000

#&#
xxxx
*/
function parse_req_log($log) {
  $content = file_get_contents($log);
  $entries = explode("#&#", $content);
  cheng_assert(count($entries) == 2, "The request doesn't have right format:\n" . $content);
  return $entries;
}

function parse_trace_req_fd($fd) {
  $headers = array();
  $payloads = array();

  // loop the folder
  $counter = 0;
  $files = scandir($fd);
  foreach ($files as $fname) {
    if ($fname == "." || $fname == "..") continue;
    $str_rid = substr($fname, 1, -4);
    cheng_assert(is_numeric($str_rid), "The name of requests are ill-formated: $fname");
    $rid = intval($str_rid);

    $path = $fd . "/" . $fname;
    $header_payload = parse_req_log($path);
    cheng_assert(!isset($headers[$rid]), "There are duplicated headers! $fname");
    $headers[$rid] = trim($header_payload[0]);

    $str_payload = trim($header_payload[1]);
    $payloads[$rid] = ($str_payload == "nil" ? "" : $str_payload);
    $counter++;
  }

  // check if the rids are tight
  for ($i=0; $i<$counter; $i++) {
    cheng_assert(isset($headers[$i]), "The rid is not tight! $i missing!");
  }

  return array($headers, $payloads);
}


/* example:
 * counter, ip:port, req; ip:port, rid, resp;
 */
/*
 * Used to be a BUG:
 * When the concurrency exists, the sequence of rid
 * and the index might be intermingled. For example:
 * $rids[29765] = 29766
 */
function parse_trace_seq($log) {
  $content = file_get_contents($log);
  $elems = explode(";", $content);

  // [ mid => { seq => int, rid => int }, ...] 
  // mid = ip:port:counter
  $req_counter = 0;
  $req_rid = array();
  $mapping_counter = array();

  foreach ($elems as $elem) {
    if (trim($elem) == "") continue;
    $infos = explode(",", $elem);
    if ($infos[2] == "req") {
      cheng_assert(count($infos) == 3);
      $ip_port = $infos[1];
      if (!isset($mapping_counter[$ip_port])) {
        $mapping_counter[$ip_port] = 0;
      }
      $mcounter= $mapping_counter[$ip_port];
      cheng_assert($mcounter % 2==0,
        "a request with mapping_counter as odd: " . $mapping_counter[$ip_port]);
      $mid = $ip_port . ":" . $mcounter;
      cheng_assert(!isset($req_rid[$mid]), "duplicate mid:$mid, ip:port=$ip_port, counter:$mcounter");

      $req_rid[$mid] = array("seq" => $req_counter++, "rid" => -1);
      $mapping_counter[$ip_port]++;
    } else if ($infos[2] == "resp") {
      cheng_assert(count($infos) == 3);
      $ip_port = $infos[0];
      $rid = $infos[1];

      cheng_assert(isset($mapping_counter[$ip_port]), "resp meets a undefined mapping_counter: " . $ip_port);
      $mcounter= $mapping_counter[$ip_port];
      cheng_assert($mcounter % 2==1, "a response with mapping_counter as even: " . $mcounter);

      $mid = $ip_port . ":" . ($mcounter-1);
      cheng_assert(isset($req_rid[$mid]), "cannot find related req for mid=$mid");
      $req_rid[$mid]["rid"] = $rid;
      $mapping_counter[$ip_port]++;
    } else {
      cheng_assert(false, "UNKONWN TYPE");
    }
  }

  // generate the array containing all the rid for request
  $ret = array();
  foreach($req_rid as $mid=>$req) {
    $ret[$req["seq"]] = $req["rid"];
    cheng_assert($req["rid"] != -1, "The request mid=$mid doesn't have resp");
  }

  return $ret;
}

function send_get_req($url, $header_kv, $rid) {
  $header_kv["rid"] = $rid;

  $req = new HttpRequest($url, HttpRequest::METH_GET);
  $req->setHeaders($header_kv);

  try {
    $resp = $req->send();

    if ($resp->getResponseCode() != 200) {
      echo "Fail on request : r$rid\n";
      echo "---Response----\n";
      print_r($resp);
      fail("check fail for r$rid");
    }
  } catch (HttpException $ex) {
    fail($ex);
  }
}

/*
 * ------WebKitFormBoundaryF6mnDBQD6hLscWGr^M
 *  Content-Disposition: form-data; name="paperUpload"; filename="test_submission.pdf"^M
 *  Content-Type: application/pdf
 *  ^M                       
 *  TestTestTestTestTestTes....
 */
/*
 * Array
 * (   
 *     [0] =>
 *     [1] =>  name="paperUpload"; filename="test_submission.pdf"
 *     [2] => Content-Type: application/pdf
 *     [3] =>
 *     [4] => TestTestTest...
 *  )
 */
function extract_file_array($elems) {
  $ret = array();
  $name_val = "";
  $filename_val = "";
  foreach ($elems as $elem) {
    $entry = trim($elem);
    if ($entry == "") continue;

    $infos = explode(";", $entry);
    if (count($infos) > 1) {
      foreach ($infos as $token) {
        $kv = explode("=", $token);
        // we're looking for 'name="paperUpload"' or 'filename="test_submission.pdf"'
        if (count($kv) != 2) {
          // skip it
          continue;
        }
        cheng_assert(!isset($ret[trim($kv[0])]));
        if (trim($kv[0]) == "name") {
          $name_val = trim($kv[1], "\"");
        }
        if (trim($kv[0]) == "filename") {
          // raw: Content-Disposition: form-data; name="paperUpload"; filename="./submissions/test_submission.pdf"^M
          // need: ret["name"] = test_submission.pdf
          $ret["name"] = end(explode("/", trim($kv[1], "\"")));
        }
      }
    } else if (substr($entry, 0, 12) == "Content-Type") {
      $kv = explode(":", $entry);
      cheng_assert(count($kv) == 2);
      $key = "type";
      cheng_assert(!isset($ret[$key]));
      $ret[$key] = trim($kv[1]);
      if ($ret[$key] == "application/octet-stream") {
        // FIXME: ???
        $ret["error"] = 4;
      }
    }
  }

  $ret["tmp_name"] = "/tmp/random";

  $file_array = array();
  cheng_assert($name_val != "");
  $file_array[$name_val] = $ret;

  return $file_array;
}

  /*
   * ------WebKitFormBoundaryGzNlGaSYnsvBxxDv^M
   * Content-Disposition: form-data; name="pcs[]"^M
   * ^M
   * 4^M
   * ------WebKitFormBoundaryGzNlGaSYnsvBxxDv^M
   * Content-Disposition: form-data; name="pcs[]"^M
   * ^M
   * 5^M
   */

  /*
   *
   * Content-Type: multipart/form-data; boundary=----WebKitFormBoundarymdah42HLYsKMhBbW^M
   * 
   *
   * ------WebKitFormBoundarymdah42HLYsKMhBbW^M
   * Content-Disposition: form-data; name="testsession"^M
   * ^M
   * 1^M
   * ------WebKitFormBoundarymdah42HLYsKMhBbW^M
   * Content-Disposition: form-data; name="email"^M
   * ^M
   * admin@nyu.edu^M
   * ------WebKitFormBoundarymdah42HLYsKMhBbW^M
   * Content-Disposition: form-data; name="password"^M
   * ^M
   * ^M
   * ------WebKitFormBoundarymdah42HLYsKMhBbW^M
   * Content-Disposition: form-data; name="action"^M
   * ^M
   * new^M
   * ------WebKitFormBoundarymdah42HLYsKMhBbW--^M
 */

function extract_fields_from_payload($payload, $content_type, &$file_array) {
  $ret = array();

  if (strpos($content_type, "multipart/form-data;") !== FALSE) {
    $spos = strpos($content_type, "boundary=") + strlen("boundary=");
    $delimiter = "--" . trim(substr($content_type,$spos));

    // cleaning
    //preg_replace("/(\r?\n){2,}/", "\n", $payload);
    $payload = str_replace("Content-Disposition: form-data;", "",$payload);

    $entries = explode($delimiter, $payload);
    // the first element is "POST ....", throw it away
    array_shift($entries);
    // the last element is "--"
    $last = array_pop($entries);
    cheng_assert(trim($last) == "--", "[$last] is not --");

    foreach ($entries as $entry) {
      $elems = explode("\n", $entry);
      // in $kv, there might be a lot of "" lines
      $find_key = false;
      $before_first_val_line = true;
      $cross_line_val = false;
      // try to find the key and value
      $key = "";
      $val = "";

      $saw_array = false;
      foreach($elems as $elem) {
        if (!$find_key) {
          if (trim($elem) == "") continue; // head empty lines
          // special case: filename FIXME: how to handle file 
          if (strpos($elem, "filename=")!==FALSE) {
            $file_array = extract_file_array($elems);
            $key=""; break;
          }
          if (strpos($elem, "name=")!==FALSE) {
            $first_sym = strpos($elem, "\"");
            $second_sym = strpos($elem, "\"", $first_sym+1);
            cheng_assert($first_sym>0 && $second_sym>0, "problem with key elem: " . $elem);
            $key = substr($elem, $first_sym+1, $second_sym - $first_sym -1);

            // might be an array: name=pc[]
            if (strpos($key,"[]") !== FALSE) {
              $key = explode("[]", $key)[0];
              $saw_array=true;
            }

            $find_key = true;
          } else {
            cheng_assert(false, "The start elem is not name=!!, it is " . $elem);
          }
        } else {
          if ($before_first_val_line && trim($elem) == "") continue;
          // meet first val line
          if ($before_first_val_line) {
            $val .= ltrim($elem, "\t\n\r\0\x0B"); // don't trim space
            $before_first_val_line=false;
          } else {
            // since this $elems is explode by \n, need to add back
            $val .= "\n".$elem;
            if (trim($elem) != "") {
              $cross_line_val = true;
            }
          }
        }
      }

      if ($key != "") {
        if ($saw_array) {
          if (!isset($ret[$key])) {
            $ret[$key] = array();
          }
          $ret[$key][] = ($cross_line_val) ? $val : trim($val, "\t\n\r\0\x0B");
        } else {
          $ret[$key] = ($cross_line_val) ? $val : trim($val, "\t\n\r\0\x0B");
        }
      }
    }
  } else if (strpos($content_type, "application/x-www-form-urlencoded") !== FALSE) {
    foreach (explode('&', $payload) as $chunk) {
      $param = explode("=", $chunk);

      if ($param) {
        $key = urldecode($param[0]);
        $val = urldecode($param[1]);
        $ret[$key] = $val;
      }
    }
  } else {
    cheng_assert(false, "Doesn't support type: ". $content_type);
  }

  return $ret;
}

function send_post_req_curl($url, $header_kv, $payload, $rid) {
  $white_list = array("Request Method", "Request Url", "Accept", "Referer","Origin", "User-Agent",
    "Cookie","Connection", /*"Accept-Encoding",*/ "Accept-Language", "Host", "rid");
  //"Content-Type", "Content-Length");

  $header_kv["rid"] = $rid;
  $header_arr = array();
  foreach ($header_kv as $k=>$v) {
    if (in_array($k, $white_list)) {
      $header_arr[] = $k . ": " . $v;
    }
  }
  
  //print_r($header_kv);
  //print_r($header_arr);

  $file_array = array();
  $post_fields = extract_fields_from_payload($payload, $header_kv["Content-Type"], $file_array);

  $ch = curl_init();
  //curl_setopt($ch, CURLOPT_VERBOSE, true);
  curl_setopt($ch, CURLOPT_FAILONERROR, 1);
  curl_setopt($ch, CURLOPT_URL, $url);
  curl_setopt($ch, CURLOPT_POST, true);
  // header is good
  curl_setopt($ch, CURLOPT_HTTPHEADER, $header_arr); 
  curl_setopt($ch, CURLOPT_POSTFIELDS, $post_fields);

  $result = curl_exec($ch);
  cheng_assert($result, "r$rid post request fail");
  var_dump($result);
}

// $query = /viewtopic.php?f=2&t=1
function parse_query($query) {
  $info = explode('?', $query);
  cheng_assert(count($info)<=2, "$query is problematic");

  $ret = array();
  if (count($info) == 2) {
    $arg_str = $info[1];
    $argv = explode('&', $arg_str);
    
    foreach ($argv as $elem) {
      $kv = explode('=', $elem);
      //cheng_assert(count($kv) == 2, "$query is problematic");
      if (count($kv) == 2) {
        cheng_assert(!isset($ret[$kv[0]]), "query should not be duplicated");
        $ret[$kv[0]] = $kv[1];
      } else {
        // case:  query = /images/sprite.png?2
        cheng_assert(count($kv) == 1, "$query is problematic");
        cheng_assert(!isset($ret[$kv[0]]), "query should not be duplicated");
        $ret[$kv[0]] = "";
      }
    }
  }

  return $ret;
}

// cookie => phpbb3_etzgc_u=1; phpbb3_etzgc_k=; phpbb3_etzgc_sid=0e22107043d6170869253056f6155eec
function parse_cookie($cookie) {
  if (trim($cookie) == "") {
    return array();
  }

  $info = explode(";", $cookie);
  foreach ($info as $elem) {
    $kv = explode("=", trim($elem));
    cheng_assert(count($kv) == 2, "parse_cookie: $elem is problematic");
    cheng_assert(!isset($ret[$kv[0]]));
    $ret[$kv[0]] = $kv[1];
  }

  return $ret;
}

// $url: http://yak-cheng.duckdns.org:4996//viewtopic.php?f=2&t=1
// Array
// (
//    [Request Method] => GET
//    [Request Url] => //viewtopic.php?f=2&t=1 HTTP/
//    [Cache-Control] => no-cache
//    [Pragma] => no-cache
//    [Accept] => text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
//    [User-Agent] => Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1
//    [Cookie] => phpbb3_etzgc_u=1; phpbb3_etzgc_k=; phpbb3_etzgc_sid=0e22107043d6170869253056f6155eec
//    [Connection] => Keep-Alive
//    [Accept-Encoding] => gzip, deflate
//    [Accept-Language] => en-US,*
//    [Host] => yak-cheng.duckdns.org:4996
// ) 
function parse_server($base_url, $query, $header_kv) {
  global $app, $host_ip;
  // FIXME: this is app related

  $ip = $host_ip;
  if ($app == "phpbb") {
    global $phpbb_host, $phpbb_port, $phpbb_loc;
    $app_host = $phpbb_host; 
    $app_loc = $phpbb_loc; 
    $port = $phpbb_port; 
  } else if ($app == "hotcrp") {
    global $hotcrp_host, $hotcrp_port, $hotcrp_loc;
    $app_host = $hotcrp_host; 
    $app_loc = $hotcrp_loc; 
    $port = $hotcrp_port; 
  } else if ($app == "wiki") {
    global $wiki_host, $wiki_port, $wiki_loc;
    $app_host = $wiki_host; 
    $app_loc = $wiki_loc; 
    $port = $wiki_port; 
  }

  // query = viewtopic.php?f=2&t=1
  $info = explode('?', $query);
  cheng_assert(count($info)<=2, "parse_server: $query is problematic");

  if ($app == "hotcrp") {
    // this is a rule from nginx config for hotcrp
    $query_file = "index.php";
  } else if ($app == "phpbb") {
    $query_file = trim($info[0], " \t\n\r\0\x0B/");
    if (substr($query_file, -4) != ".php") {
      // assume the default is index.php
      if (trim($query_file) == "") {
        $query_file = "index.php";
      } else {
        // there might be .css or .js
        cheng_assert(substr($query_file, -4) == ".css" || substr($query_file, -3) == ".js",
          "$query_file is problematic");
      }
    }
  } else if ($app == "wiki") {
    // this is config from nginx
    $query_file = "index.php";
  }

  $query_string = "";
  if (count($info) == 2) {
    $query_string = $info[1];
  }

  // ???
  if ($app == "wiki") {
    $query_string = "title=$query&";
  }


  // may be lack for HotCRP, but not appear in the real requests
  // HTTP_IF_MODIFIED_SINCE 
  // HTTP_IF_NONE_MATCH
  // REMOTE_USER

  // need to fill-in
  $ret["REQUEST_METHOD"]=$header_kv["Request Method"];
  $ret["QUERY_STRING"]=$query_string; //"f=2&t=1";
  $ret["SCRIPT_URI"]=$base_url . "/" . $query_file; //"http://yak-cheng.duckdns.org:4996/viewtopic.php";
  $ret["HTTP_COOKIE"]= (isset($header_kv["Cookie"]) ? $header_kv["Cookie"] : "");
  $ret["REQUEST_URI"]=$query;
  $ret["DOCUMENT_URI"]= "/" . $query_file; // "/viewtopic.php";
  $ret["SCRIPT_NAME"]="/" . $query_file; //"/viewtopic.php";
  $ret["SCRIPT_URL"]="/" . $query_file; //"/viewtopic.php";

  // app related
  $ret["SCRIPT_FILENAME"]= $app_loc . "/" . $query_file; //"/home/cheng/software/phpbb/viewtopic.php";
  $ret["DOCUMENT_ROOT"]=$app_loc;
  $ret["HTTP_HOST"]= $app_host; // FIXME: shouldn't be $base_url?
  $ret["SERVER_ADDR"]=$ip;
  $ret["SERVER_PORT"]=$port;

  // related need to fill-in
  $ret["HTTP_CACHE_CONTROL"]=(isset($header_kv["Pragma"]) ? $header_kv["Pragma"] : ""); //"no-cache";
  $ret["HTTP_ACCEPT_ENCODING"]=$header_kv["Accept-Encoding"]; //"gzip, deflate";
  $ret["HTTP_CONNECTION"]=(isset($header_kv["Connection"]) ? $header_kv["Connection"] : ""); //"Keep-Alive";
  $ret["HTTP_ACCEPT_LANGUAGE"]=(isset($header_kv["Accept-Language"]) ? $header_kv["Accept-Language"] : ""); //"en-US,*";
  $ret["HTTP_PRAGMA"]=(isset($header_kv["Pragma"]) ? $header_kv["Pragma"] : ""); //"no-cache";
  $ret["HTTP_USER_AGENT"]=$header_kv["User-Agent"]; //"Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1";
  $ret["HTTP_ACCEPT"]=$header_kv["Accept"]; //"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";

  // can freeze, doesn't matter much
  $ret["SERVER_SOFTWARE"]="nginx/1.4.6";
  $ret["SERVER_PROTOCOL"]="HTTP/1.1";
  $ret["REDIRECT_STATUS"]="200";
  // FIXME: this can cause divergence of session data in HotCRP
  // Correct way to do it is track the ip, but we just simply
  // make it simple as localhost when we use proxy.
  $ret["REMOTE_ADDR"]="127.0.0.1";
  $ret["REMOTE_PORT"]=51508;
  $ret["HTTPS"]="";

  // hotcrp rule from nginx config
  if ($app == "hotcrp") {
    global $hotcrp_loc, $hotcrp_host;
    $ret["SCRIPT_FILENAME"]= $hotcrp_loc . "/index.php";
    $ret["SCRIPT_URI"]= $hotcrp_host . "/index.php";
  }

  return $ret;
}

// [Request Method] => POST
// [Request Url] => /ucp.php?mode=login&sid=0e22107043d6170869253056f6155eec
// [Accept] => text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
// [Referer] => http://yak-cheng.duckdns.org:4996//ucp.php?mode=login
// [Origin] => http://yak-cheng.duckdns.org:4996
// [User-Agent] => Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/538.1 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/2.0.0 Safari/538.1
// [Content-Type] => application/x-www-form-urlencoded
// [Content-Length] => 190
// [Cookie] => phpbb3_etzgc_u=1; phpbb3_etzgc_k=; phpbb3_etzgc_sid=0e22107043d6170869253056f6155eec
// [Connection] => Keep-Alive
// [Accept-Encoding] => gzip, deflate
// [Accept-Language] => en-US,*
// [Host] => yak-cheng.duckdns.org:4996

function parse_post($header_kv, $payload, &$file_array) {
  $is_post = ($header_kv["Request Method"] == "POST");
  if (!$is_post) return array();

  cheng_assert(isset($header_kv["Content-Type"]));
  $post_fields = extract_fields_from_payload($payload, $header_kv["Content-Type"], $file_array);

  return $post_fields;
}

function parse_request($cookie, $post, $get) {
  $ret = array();
  foreach ($cookie as $key=>$val) {
    $ret[$key] = $val;
  }
  foreach ($post as $key=>$val) {
    $ret[$key] = $val;
  }
  foreach ($get as $key=>$val) {
    $ret[$key] = $val;
  }

  return $ret;
}

function extract_global_arrays($base_url, $query, $header_kv, $payload) {
  global $app;
  $g_get = array();
  $g_cookie = array();
  $g_server = array();

  $file_array = array();

  if ($app == "wiki") {
    // ???? where is the "title" come from???
    $g_get["title"] = ltrim($query, '/');
  } else {
    $g_get = parse_query($query);
  }
  $g_post = parse_post($header_kv, $payload, $file_array);
  if (isset($header_kv["Cookie"])) {
    $g_cookie = parse_cookie($header_kv["Cookie"]);
  }
  $g_server = parse_server($base_url, $query, $header_kv);

  // for hotcrp only
  $g_request = array();
  if ($app == "hotcrp") {
    $g_request = parse_request($g_cookie, $g_post, $g_get);
  }

  $ret = array();
  $ret["_GET"] = $g_get;
  $ret["_POST"] = $g_post;
  $ret["_COOKIE"] = $g_cookie;
  $ret["_SERVER"] = $g_server;
  $ret["_REQUEST"] = $g_request;
  $ret["_FILES"] = $file_array;

  return $ret;
}

function encode_array($array) {
  $output = "array(";
  foreach ($array as $key=>$val) {
    $str_key = (is_string($key)) ? "\"$key\"" : (string) $key;
    if (is_array($val)) {
      $str_val = encode_array($val); 
    } else {
      $str_val = (is_string($val)) ? "\"$val\"" : (string) $val;
    }
    $elem = $str_key . "=>" . $str_val . ",";
    $output .= $elem;
  }
  $output .= ")";
  return $output;
}

function dump_as_file($globals, $fname, $rid) {
  $output = "<?php\n";

  $post_fix = "\ndefine('CHENG',1);\n" .
              "chdir(\$_SERVER['DOCUMENT_ROOT']);\n" .
              "\$req_no = " . $rid . ";\n" .
              "include \$_SERVER['SCRIPT_FILENAME'];";

  //$_SERVER["REMOTE_PORT"]=51508;
  //$template = "\$__GLOBL__[\"__KEY__\"]=__VAL__;";

  foreach ($globals as $g_key => $val_arr) {
    // $_POST is special, make it the array, easy for the merge
    if ($g_key == "_POST" && count($val_arr) > 0) {
      $str_val = encode_array($val_arr);
      $entry = "\$_POST=" . $str_val . ";\n";
      $output .= $entry;
      continue;
    }

    foreach ($val_arr as $key => $val) {
      if (is_null($val)) $val = "";
      if (is_array($val)) {
        $str_val = encode_array($val);
      } else {
        $str_val = (is_string($val)) ? "\"$val\"" : (string) $val;
      }
      $entry = "\$" . $g_key . "[\"" . $key . "\"]=" . $str_val . ";\n";
      $output .= $entry;
    }
  }

  $output .= $post_fix;
  $ret = file_put_contents($fname, $output);
  cheng_assert($ret);
}

function gen_one_payload($url, $header, $payload, $rid, $fname) {
  /*
  global $php_version;
  if ($php_version == "5") { 
    $header_kv = http_parse_headers($header);
  } else if ($php_version == "7") {
    $header_kv = http\Header::parse(($header);
  }
 */
  $header_kv = http_parse_headers($header);

  cheng_assert(isset($header_kv["Request Method"]), "Request Method type doesn't exist");

  // extract query  
  $first_line = explode("\n", $header)[0];
  $first_line = preg_replace("/ {2,}/", " ", $first_line);
  $query = explode(" ", $first_line)[1];
  $query = urldecode($query);
  $url .= $query;


  $globals = extract_global_arrays($url, $query, $header_kv, $payload);

  dump_as_file($globals, $fname, $rid);

  // FIXME:!!XXX
  //$is_get = ($header_kv["Request Method"] == "GET");
  //if (!$is_get) exit(0);
  //if ($rid >= 4)
  //exit(0);
}

function gen_req($url, $headers, $payloads, $rid2hash, $dst_fd) {

  // ASSUMPTION: the $headers and $payloads are tight and the index are their rid,
  // see function parse_trace_req_fd
  for ($rid=0; $rid<count($headers); $rid++) {

    $fname = "r" . $rid . ".php";

    cheng_assert(isset($rid2hash[$fname]), "Cannot find this ".$fname);
    $f_fd = $dst_fd . "/" . $rid2hash[$fname];
    if (!file_exists($f_fd)) {
      mkdir($f_fd);
    }

    $f_path = $f_fd . "/" . $fname;
    gen_one_payload($url, $headers[$rid], $payloads[$rid], $rid, $f_path);
    echo "[INFO]: done r" . $rid . "\n";
  }
}

function old_build_rid_hash_mapping() {
  // location
  $location = "/tmp/branch/";
  $hashes = scandir($location);

  $rid2hash = array();
  foreach ($hashes as $hash) {
    // hash is a nummeric number!
    if (is_numeric($hash)) {
      $rids = scandir($location . $hash);
      foreach ($rids as $rid) {
        if ($rid == '.' || $rid == "..") continue;
        cheng_assert($rid[0] == "r" && substr($rid,-4) == ".php", "$rid is not a valid request name");
        $rid2hash[$rid] = $hash;
      }
    }
  }

  return $rid2hash;
}

function build_rid_hash_mapping($location) {
  // location
  $content = file_get_contents($location);
  cheng_assert(trim($content) != "", "the cf_tags is empty");

  $rid2hash = array();
  $entries = explode(";", $content);
  foreach ($entries as $entry) {
    if (trim($entry) == "") continue;
    $tokens = explode(":", $entry);
    cheng_assert(count($tokens) == 2, "ill format of $entry");
    $rid_key = $tokens[0] . ".php";
    cheng_assert(!isset($rid2hash[$rid_key]), "$rid_key is duplicated");
    cheng_assert(is_numeric($tokens[1]), "hash is not correct: $entry");
    $rid2hash[$rid_key] = $tokens[1];
  }

  return $rid2hash;
}

// main
//
if (count($argv) != 6) {
  usage();
  exit(1);
}

include(dirname(__FILE__)."/env.php");

$php_version = substr(phpversion(),0,1);

$trace_req_fd = $argv[1];
$trace_seq_log = $argv[2];
// http://yak-cheng.duckdns.org:4001/
$url = $argv[3];
$dst_fd = $argv[4];
$app = $argv[5];

if ($app != "hotcrp" && $app != "phpbb" && $app != "wiki") {
  fail("doesn't support app $app");
}

if (!file_exists($dst_fd)) {
  mkdir($dst_fd);
}

// ASSUMPTION: that the first request in trace_req is the first req in trace_seq
// This is error prone!!! 
$hp = parse_trace_req_fd($trace_req_fd);
$headers = $hp[0];
$payloads = $hp[1];

// NOTE: used to be a double check procedure
//$rids = parse_trace_seq($trace_seq_log);
//echo "headers: " . count($headers) . "   rids: ".count($rids) . "\n";
//cheng_assert(count($headers) == count($rids), "some rid have been lost\n");
//print_r($rids);

// build the rid=>hash mapping
$cf_tags = "/tmp/cf_tags.log";
$rid2hash = build_rid_hash_mapping($cf_tags);

//print_r($headers);
gen_req($url, $headers, $payloads, $rid2hash, $dst_fd);
