<?php

function cheng_assign($array, $keys, $val) {
  $num_loop = count($keys);
  if ($num_loop > 10) {
    foreach ($keys as $key) {
      $array = &$array[$key];
    }
    $array = $val;
    return $array;
  } else {
    switch ($num_loop) {
    case 1:
      $array[$keys[0]] = $val;
      break;
    case 2:
      $array[$keys[0]][$keys[1]] = $val;
      break;
    case 3:
      $array[$keys[0]][$keys[1]][$keys[2]] = $val;
      break;
    case 4:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]] = $val;
      break;
    case 5:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]] = $val;
      break;
    case 6:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]] = $val;
      break;
    case 7:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]] = $val;
      break;
    case 8:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]] = $val;
      break;
    case 9:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][$keys[8]] = $val;
      break;
    case 10:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][$keys[8]][$keys[9]] = $val;
      break;
    }
    return $array;
  }
}

function cheng_append($array, $keys, $val) {
  $num_loop = count($keys);
  if ($num_loop > 10) {
    foreach ($keys as $key) {
      $array = &$array[$key];
    }
    $array[] = $val;
    return $array;
  } else {
    switch ($num_loop) {
    case 1:
      $array[$keys[0]][] = $val;
      break;
    case 2:
      $array[$keys[0]][$keys[1]][] = $val;
      break;
    case 3:
      $array[$keys[0]][$keys[1]][$keys[2]][] = $val;
      break;
    case 4:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][] = $val;
      break;
    case 5:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][] = $val;
      break;
    case 6:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][] = $val;
      break;
    case 7:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][] = $val;
      break;
    case 8:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][] = $val;
      break;
    case 9:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][$keys[8]][] = $val;
      break;
    case 10:
      $array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][$keys[8]][$keys[9]][] = $val;
      break;
    }
    return $array;
  }
}

function cheng_unset($array, $keys) {
  $num_loop = count($keys);
  if ($num_loop > 10) {
    foreach ($keys as $key) {
      $array = &$array[$key];
    }
    unset($array);
  } else {
    switch ($num_loop) {
    case 1:
      unset($array[$keys[0]]);
      break;
    case 2:
      unset($array[$keys[0]][$keys[1]]);
      break;
    case 3:
      unset($array[$keys[0]][$keys[1]][$keys[2]]);
      break;
    case 4:
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]]);
      break;
    case 5:
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]]);
      break;
    case 6:
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]]);
      break;
    case 7:
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]]);
      break;
    case 8:
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]]);
      break;
    case 9:
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][$keys[8]]);
      break;
    case 10:
      unset($array[$keys[0]][$keys[1]][$keys[2]][$keys[3]][$keys[4]][$keys[5]][$keys[6]][$keys[7]][$keys[8]][$keys[9]]);
      break;
    }
  }
}

