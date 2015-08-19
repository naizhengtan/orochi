<?php

$multi = NULL;
$multi = multi_add($multi, 1);
$multi = multi_add($multi, 2);

$arr = array();
$arr["nice"] = $multi;
echo $arr["nice"];
echo "\n";

$arr[] = $multi;
echo $arr[0];
echo "\n";
