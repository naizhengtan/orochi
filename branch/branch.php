<?php

$a = NULL;
$a = multi_add($a, 1); 
$a = multi_add($a, 2); 
$a = multi_add($a, 3); 

if ($a > 0) {
  echo "good!!!!\n";
} else {
  echo "WTF????\n";
}
