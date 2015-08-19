<?php

$a = NULL;
$a = multi_add($a, "not_exist!");
$a = multi_add($a, "file_exists.php");
$a = multi_add($a, "file_exists.php");
$a = multi_add($a, "file_exists.php");
$a = multi_add($a, "file_exists.php");
$a = multi_add($a, "file_exists.php");
echo $a;

$b = file_exists($a);
echo $b;
echo "\n";
