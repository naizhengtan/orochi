<?php

// this is a global parameter
$user_view_div_guest_view = 0.025; // guest:user=1:40
$frac = 1;


function parse_log($path) {
  global $frac;
  // log format: each line is one post; "#reply #views"
  // e.g.
  // 1 123
  $content = file_get_contents($path);
  $lines = explode("\n", $content);

  $posts = array();
  foreach ($lines as $line) {
    if (trim($line) == "") continue;
    $elem = preg_split('/\s+/', $line);
    $posts[] = array("reply"=>intval($elem[0]), "view"=>intval(intval($elem[1]) * $frac));
  }

  return $posts;
}

// FIXME: not correct
function should_take($total) {
  // should return 1/$left chance
  return (rand(1, $total) == 1);
}

function gen_workload($posts, $num_users) {
  global $user_view_div_guest_view;
  $workloads = array();

  // generate guest views
  // for each post generate the views
  $workloads["guest"] = array();
  foreach ($posts as $post_id => $post_rv) {
    $guest_view = intval($post_rv["view"] / (1 + $user_view_div_guest_view));
    // update guest views
    for ($i=0; $i<$guest_view; $i++) {
      $workloads["guest"][] = $post_id+1; // view this post $guest_view times
    }
    // update the posts
    $posts[$post_id]["view"] -= $guest_view;
  }

  // for each of the user, except the very last one
  // which will take all the left things
  for ($usrid=0; $usrid<$num_users-1; $usrid++) {
    $reply_key = "user$usrid" . "_reply";
    $view_key = "user$usrid" . "_view";
    $workloads[$reply_key] = array();
    $workloads[$view_key] = array();

    foreach($posts as $post_id => $post_rv) {
      // for reply
      $r_counter = 0;
      for ($i=0; $i<$post_rv["reply"]; $i++) {
        if (should_take($num_users)) {
          $workloads[$reply_key][] = $post_id+1;
          $r_counter++;
        }
      }
      // update the reply
      $posts[$post_id]["reply"] -= $r_counter;

      // for view
      $v_counter = 0;
      for ($i=0; $i<$post_rv["view"]; $i++) {
        if (should_take($num_users)) {
          $workloads[$view_key][] = $post_id+1;
          $v_counter++;
        }
      }
      // update the view
      $posts[$post_id]["view"] -= $v_counter;
    }
  }

  // last user
  $last_usr_id = ($num_users-1);
  $reply_key = "user$last_usr_id" . "_reply";
  $view_key = "user$last_usr_id" . "_view";
  $workloads[$reply_key] = array();
  $workloads[$view_key] = array();
  foreach($posts as $post_id => $post_rv) {
    // for reply
    for ($i=0; $i<$post_rv["reply"]; $i++) {
      $workloads[$reply_key][] = $post_id+1;
    }
    // for view
    for ($i=0; $i<$post_rv["view"]; $i++) {
      $workloads[$view_key][] = $post_id+1;
    }
  }

  return $workloads;
}

function dump_outputs($output_fd, $workloads) {
  // $workloads will be {"user0" => $str; "guest" => $str}

  foreach ($workloads as $usr_ac=>$arr) {
    $path = $output_fd . "/" . $usr_ac;
    $content = implode("\n", $arr);
    echo "dump to $path\n";
    file_put_contents($path, $content);
  }
}

function usage() {
  echo "gen_workload_log.php <#users> <data.txt> <output folder>\n";
}


//===============
// main
//===============

if (count($argv) != 4) {
  usage();
  exit(1);
}

$num_users = intval($argv[1]);
$log = $argv[2];
$output_fd = $argv[3];

$posts = parse_log($log);
//print_r($posts);
//
$workloads = gen_workload($posts, $num_users);
//print_r($workloads);

dump_outputs($output_fd, $workloads);
