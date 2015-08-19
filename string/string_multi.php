<?php

$m = "morning";
$n = "afternoon";
$e = "evening";

$a = NULL;
$a = multi_add($a, $m);
$a = multi_add($a, $n);
$a = multi_add($a, $e);
echo $a;

$b = "Good ".$a;
echo $b;
