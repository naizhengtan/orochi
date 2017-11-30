<?php

function cheng_assert($cond, $msg) {
  if (!$cond) {
    echo "ERROR: $msg";
    exit(1);
  }
}

#reviewId	charcount	overallMerit	reviewerQualification	outcome	paperid
function parseLog($log) {
  $ret=array();

  $content = file_get_contents($log);
  $lines = explode("\n", $content);

  array_shift($lines); // rm first line
  foreach($lines as $line) {
    if (trim($line) == "") continue;
    $elems = explode("\t", trim($line));  
    cheng_assert(count($elems) == 6, "$line    is illegal\n  The elems are " . print_r($elems,true));
    $ret['reviewId'][] = $elems[0];
    $ret['charcount'][] = intval($elems[1]);
    $ret['overallMerit'][] = $elems[2];
    $ret['reviewerQualification'][] = $elems[3];
    $ret['outcome'][] = $elems[4];
    $ret['paperid'][] = intval($elems[5]);
  }

  return $ret;
}

# main 
if (count($argv) != 2) {
  echo "Usage: analysis.php <data.txt>\n";
  return 1;
}

$info = parseLog($argv[1]);

// #valid_papers = uniq paperid
echo "#valid_papers = " . count(array_unique($info['paperid'])) . "\n";

// #papers = the largest paperid 
echo "#papers = " . max($info['paperid']) . "\n";

// #review = number of element
echo "#reviews = " . count($info['reviewId']) . "\n";

// comment length
echo "avg_comment_length = " . (array_sum($info['charcount']) / count($info['charcount'])) . "\n";

