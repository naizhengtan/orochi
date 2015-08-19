<?php

$conn = new mysqli("localhost", "root", "news123");

$str = NULL;
$str = multi_add($str, "\whatever");
$str = multi_add($str, "\whenever");
//$str = "\whatever`'";

$nstr = $conn->real_escape_string($str);
echo $nstr;
echo "\n";

$c = 1;
for ($i=0;$i<1000;$i++) {
$c = $c + $i;
}
echo "$c\n";

$conn->close();

