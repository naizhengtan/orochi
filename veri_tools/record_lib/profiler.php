<?php

class MProfiler {

  private static $trace_time = array();
  private static $trace_start = array();
  // 0: not recording; 1: recording
  private static $trace_state = array();
  private static $nested_counter = array();

  // this func is idenpotent
  public static function initTrace ($name) {
    if (!isset(self::$trace_time[$name])) {
      self::$trace_time[$name] = 0;
      self::$trace_state[$name] = 0; // no recording
      self::$nested_counter[$name] = 0;
    } 
  }

  public static function startTick($name) {
    assert(isset(self::$trace_time[$name]));
    assert(self::$trace_state[$name] == 0);

    if (self::$nested_counter[$name] == 0) {
      self::$trace_start[$name] = microtime(true);
      self::$trace_state[$name] = 1; // recording
    }
    self::$nested_counter[$name]++;
  }

  public static function endTick ($name) {
    assert(isset(self::$trace_time[$name]));
    assert(self::$trace_state[$name] == 1);
    self::$nested_counter[$name]--;

    if (self::$nested_counter[$name] == 0) {
      self::$trace_time[$name] += (microtime(true) - self::$trace_start[$name]);
      self::$trace_state[$name] = 0; // not recording
    }
  }

  public static function getTraceTime ($name) {
    assert(isset(self::$trace_time[$name]));
    assert(self::$trace_state[$name] == 0);
    assert(self::$nested_counter[$name] == 0);
    return (self::$trace_time[$name] * 1000); // in ms
  }
}


