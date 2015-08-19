<?php

$a = NULL;
$a = multi_add($a, 1);
$a = multi_add($a, 2);

if( is_int($a) ) {
  echo "correct!\n";
} else {
  echo "fail!\n";
}

$a = NULL;
$a = multi_add($a, true);
$a = multi_add($a, false);

if( is_bool($a) ) {
  echo "correct!\n";
} else {
  echo "fail!\n";
}

$a = NULL;
$a = multi_add($a, "abc");
$a = multi_add($a, "def");

if( is_string($a) ) {
  echo "correct!\n";
} else {
  echo "fail!\n";
}

$a = NULL;
$a = multi_add($a, array(1,2,4));
$a = multi_add($a, array(2,3,4));

if( is_array($a) ) {
  echo "correct!\n";
} else {
  echo "fail!\n";
}
