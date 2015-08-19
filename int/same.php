<?php

$a = NULL;
$a = multi_add($a, 1);
$a = multi_add($a, 2);
$a = multi_add($a, 3);

$b = ($a === 2);
echo $b;
echo "\n";
