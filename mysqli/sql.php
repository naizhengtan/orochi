<?php
$servername = "localhost";
$username = "fromscratch2";
$password = "ye2+awrprokdtn";
//$dblink = new mysqli($servername, $username, $password);

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
} else {
  echo "Connected successfully\n";
}

//print_r($conn);
$q = NULL;
$q = multi_add($q, "select * from fromscratch2.ContactInfo where contactId=3");
$q = multi_add($q, "select * from fromscratch2.ContactInfo where contactId=2");
//$q = "select ContactInfo.* from fromscratch2.ContactInfo where contactId=3";

echo $q;
echo "\nBefore query\n";

$result = $conn->query($q);

echo "After query";

echo $result;

if ($result) {
  if ($result->num_rows > 0) {
    // output data of each row
    $arr = $result->fetch_assoc();
    echo $arr;
    //print_r($arr);
  } else {
    echo "0 results";
  }
}

$conn->close();
