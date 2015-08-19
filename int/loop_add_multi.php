<?php
$start = microtime(true);
$a = NULL;
$a = multi_add($a, 1);
$a = multi_add($a, 2);
$a = multi_add($a, 3);
$a = multi_add($a, 4);

for ($i = 1; $i < 10; $i++) {
  $a = $a * $i;
}

echo $a;
$end = microtime(true);
$total = ($end - $start) * 1000;
echo "time usage: $total ms\n";
