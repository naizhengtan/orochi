<?php

function usage() {
  echo "Usage: cp_rid_php.php <src_folder>(input,/tmp/branch) <dst_folder>(input, /tmp/veri/request)\n";
}

// main
if (count($argv) != 3) {
  usage();
  exit(1);
}

$src_fd=$argv[1];
$dst_fd=$argv[2];

$fds = scandir($src_fd);
foreach ($fds as $fd) {
  if (is_numeric($fd)) {
    // this is a hash
    $path = $src_fd . "/" . $fd;
    $rid_files = scandir($path);

    foreach ($rid_files as $rf) {
      if (substr($rf, -4) == ".php") {
        copy($path."/".$rf, $dst_fd."/".$rf);
      }
    }
  }
}
