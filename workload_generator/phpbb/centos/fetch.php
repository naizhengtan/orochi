<?php

$base_url = "https://www.centos.org/forums/";

$root_posts = array(
"https://www.centos.org/forums/viewforum.php?f=47&st=7",
"https://www.centos.org/forums/viewforum.php?f=47&st=7&start=25",
"https://www.centos.org/forums/viewforum.php?f=47&st=7&start=50"
);

function cheng_assert($cond, $msg="") {
  if (!$cond) {
    echo "FATAL ERROR: $msg\n";
    exit(1);
  }
}

function get_posts_url($root_posts){
  // (1) get the real post urls
  // each of the link will be like:
  //<a href="./viewtopic.php?f=47&amp;t=64277&amp;
  $ret = array();
  $pattern = "/<a href=\"\.\/(viewtopic\.php\?f=47*&amp;t=[0-9]*)&amp;/";
  foreach ($root_posts as $url) {
    $content = file_get_contents($url);
    preg_match_all($pattern, $content, $matches);
    foreach ($matches[1] as $m) {
      $ret[] = $m;
    }
  }

  $ret = array_unique($ret);
  $result = array();
  foreach ($ret as $elem) {
    $result[] = $elem;
  }

  //print_r($result);
  return $result;
}

function get_reply_view_count($root_posts) {
  // (2) count replies/reviews
	// <dd class="posts">3 <dfn>Replies</dfn></dd>
	// <dd class="views">66 <dfn>Views</dfn></dd>
  $reply_pattern = "/<dd class=\"posts\">([0-9]*) <dfn>Replies<\/dfn><\/dd>/";
  $view_pattern =  "/<dd class=\"views\">([0-9]*) <dfn>Views<\/dfn><\/dd>/";

  $reply_ret = array();
  $view_ret = array();

  foreach ($root_posts as $url) {
    $reply_count = array();
    $view_count = array();
    $content = file_get_contents($url);

    // reply
    $counter = 0;
    preg_match_all($reply_pattern, $content, $matches);
    foreach ($matches[1] as $m) {
      // we skip the first two numbers
      if ($counter > 1) {
        $reply_count[] = $m;
      }
      $counter++;
    }

    // view
    $counter = 0;
    preg_match_all($view_pattern, $content, $matches);
    foreach ($matches[1] as $m) {
      // we skip the first two numbers
      if ($counter > 1) {
        $view_count[] = $m;
      }
      $counter++;
    }

    foreach ($reply_count as $elem) {
      $reply_ret[] = $elem;
    }
    foreach ($view_count as $elem) {
      $view_ret[] = $elem;
    }
  }

  //print_r($reply_ret);
  //print_r($view_ret);

  return array($reply_ret, $view_ret);
}

function fetch_reply_user($post_url) {
  $usrs = array();
  $content = file_get_contents($post_url);
  // two cases:
  // class="username-coloured">TrevorH</a>
  // class="username">tsantos</a>
  $pattern1 = "/class=\"username-coloured\">(.*)<\/a>/";
  $pattern2 = "/class=\"username\">(.*)<\/a>/";


  $usrs = array();
  preg_match_all($pattern1, $content, $matches);
  foreach ($matches[1] as $m) {
    $usrs[] = $m;
  }
  preg_match_all($pattern2, $content, $matches);
  foreach ($matches[1] as $m) {
    $usrs[] = $m;
  }
  return $usrs;
}

function get_num_distinct_users($base_url, $urls) {
  $usr_dup = array();
  foreach ($urls as $url) {
    $real_url = htmlspecialchars_decode($base_url . $url);
    $usrs = fetch_reply_user($real_url);
    foreach ($usrs as $usr) {
      $usr_dup[] = $usr;
    }
  }

  $usr_dup = array_unique($usr_dup);
  //print_r($usr_dup);
  return count($usr_dup);
}

function dump_output($posts, $reply_count, $view_count, $num_usr, $output_file) {
  echo "====OUTPUT=====\n";
  echo "number of posts = " . count($posts) . "\n";
  echo "number of users = $num_usr\n";
  ob_start();
  for ($i=0; $i<count($reply_count); $i++) {
    echo "". $reply_count[$i] . "    " . $view_count[$i] . "\n"; 
  }
  $content = ob_get_clean();
  file_put_contents($output_file, $content);
}

function usage() {
  echo "fetch.php <output>\n";
}

//===============
// main
//===============
if (count($argv) != 2) {
  usage();
  exit(1);
}

$output_file = $argv[1];

// (1) from root_posts:
//  -- fetch all the real post url
//  -- get the #replies and #views
// (2) fetch all the post's replies user name
//  and count how many are they

$posts = get_posts_url($root_posts);
$info = get_reply_view_count($root_posts);
cheng_assert(count($posts) == count($info[0]) &&
  count($info[0] == $info[1]));

$num_distinct_users = get_num_distinct_users($base_url, $posts); 

dump_output($posts, $info[0], $info[1], $num_distinct_users, $output_file);
