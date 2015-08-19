<?php

$a = NULL;
$a = multi_add($a, 1);
$a = multi_add($a, 2);

if (isset($a)) {
  echo "good!\n";
}
