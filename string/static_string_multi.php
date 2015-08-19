<?php

$m = "morning";
$n = "afternoon";
$e = "evening";

$a = NULL;
$a = multi_add($a, $m);
$a = multi_add($a, $n);
$a = multi_add($a, $e);
//$a = multi_add($a, "morning");
//$a = multi_add($a, "afternoon");
//$a = multi_add($a, "evening");
echo $a;

$b = "Good ".$a;
echo $b;
