<?php

$a1 = array(1,2,3,4);
$a2 = array(5,6,7,8);
$arr = NULL;
$arr = multi_add($arr, $a1);
$arr = multi_add($arr, $a2);

echo $arr;
for ($i=0;$i<4;$i++) {
  echo $arr[$i];
  echo "\n";
}
