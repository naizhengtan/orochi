<?php

function usage() {
  echo "unique_url.php <req-folder>(/tmp/veri/request/)\n";
}

// ---------------
// main
// ---------------
// get the unique url from requests
//
$fd = "/tmp/veri/request/";

if (count($argv) !=2 ) {
  usage();
  //exit(1);
} else {
  $fd = $argv[1];
}

$pattern1 = "/.*_SERVER\[\"REQUEST_URI\"\]=(.*);.*/";
$pattern2 = "/.*_SERVER\[\"HTTP_COOKIE\"\]=(.*);.*/";

$php_files = scandir($fd);

$urls = array();

foreach($php_files as $f) {
  if ($f != "." && $f !="..") {
    $content = file_get_contents($fd.$f);

    $uri = "";
    $ret = preg_match($pattern1, $content, $args);
    if (!$ret) {
      fwrite(STDERR, "Warning! $f cannot find REQUEST_URI\n");
    } else {
      $uri = $args[1];
    }

    $cookie = "";
    $ret = preg_match($pattern2, $content, $args);
    if (!$ret) {
      fwrite(STDERR, "Warning! $f cannot find COOKIE\n");
    } else {
      $cookie = $args[1];
    }

    $url = $uri;//.$cookie;

    if (!in_array($url, $urls)) {
      $urls[] = $url;
    }
  }
}

echo "Number of unique url: " . count($urls) . "\n";
