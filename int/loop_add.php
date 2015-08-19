<?php
function loop_add($a) {
  for ($i = 1; $i < 10; $i++) {
    $a = $a * $i;
  }
  echo $a;
}

$start = microtime(true);

loop_add(1);
loop_add(2);
loop_add(3);
loop_add(4);

$end = microtime(true);
$total = ($end - $start) * 1000;
echo "time usage: $total ms\n";
