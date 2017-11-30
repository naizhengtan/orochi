var fs = require('fs');
var path = require('path');
var verbose = true;
var max_num_req_in_group = 3000;

var dst_fd = "/tmp/veri/merge/";
var dst_mapping = "/tmp/veri/merg-request.mapping";
var merge_counter = 0;

main();

function main () {
  // Get the target directory and run the program
  var dir = process.argv[2];
  if (dir == undefined) console.log("Please provide a directory. Usage: nodejs merge.js <dir>");
  else mergeDir(dir);
}

function gen_session_files(php_arr) {
  var ret = [];
  php_arr.forEach(function(path) {
    ///tmp/branch//8465023635253140651/r218.php 
    var id = (path.split("r"))[2];
    id = id.substring(0,id.length-4);
    ret.push("/tmp/branch/session/r"+id+".session");
  });
  //console.log(ret);
  return ret;
}

function check_sessino_same(f_arr) {
  if (f_arr.length == 0) return -1;
  if (!fs.existsSync(f_arr[0])) {
    // do not have session file
    console.log("The file " + f_arr[0] + " doesn't exist\n");
    return 1;
  }
  var text = fs.readFileSync(f_arr[0],'utf8') 
  for ( i = 1; i < f_arr.length; i++) {
    var tmp_text;
    try {
      tmp_text = fs.readFileSync(f_arr[i], 'utf8');
    } catch(e) {
      return 0;
    }
    if (tmp_text != text) {
      // different session file
      return 0;
    }
  }
  return 2; // identical session file
}

function mergeDir (cwd) {
  console.log("Working on " + cwd);
  // Read the files in the directory
  var working = getFiles(cwd);
  
  // Get the contents of the files
  working.files = getPHP(working.files);

  var round = 0;
  while(working.files.length > 0) {
    // group the max_num_req_in_group reqs at most
    var working_files = working.files.splice(0, max_num_req_in_group);

    console.log("  Round[" + (round++) + "] merge " + working_files.length + " files"); 

    var contents = readFiles(working_files);

    if (working_files.length == 1) {
      console.log("    Only one file");
      // if only one we will not bother to do anything
      fs.writeFileSync(dst_fd+"m"+(merge_counter)+'.php', fs.readFileSync(working_files[0], 'utf8'));

      // write to the mapping
      src_name = dst_fd+"m"+(merge_counter)+'.php';
      dst_name = working_files[0];
      fs.appendFileSync(dst_mapping, src_name+": (1)  ");
      fs.appendFileSync(dst_mapping, dst_name.substring(dst_name.lastIndexOf('/')+1) + "\n");
    } else {
      console.log("    Merging " + working_files.length + " files");
      // check if the sessions are the same
      //session_files = gen_session_files(working.files);
      //session_state = check_sessino_same(session_files);
      // Merge the files into merge.php
      mergeFiles(merge_counter, contents, dst_fd+"m"+(merge_counter)+'.php', working_files);
    }
    merge_counter++;
  }

  // Recursively merge the .php files in each directory
  working.dirs.forEach(function (dir) {
    mergeDir(dir);
  });
}

/** Helper Functions **/

function getFiles (dir) {
  var dirs = [];
  var files = [];
  
  // Read each file in the directory
  fs.readdirSync(dir).forEach(function(file) {
    // Get file stats/data
    file = dir+'/'+file;
    var stat = fs.statSync(file);

    // Determine if it is a directory or file
    if (stat && stat.isDirectory()) {
      dirs.push(file);
    } else {
      files.push(file);
    }
  });

  // Return an object with two arrays: directories and files
  return {dirs: dirs, files: files};
}

function getPHP (files) {
  // Given an array of file names, return an array of only files ending in .php
  // Excludes any files named 'merge.php'
  return files.filter(function(file) {
    return (file.search(/.+[.]php$/) >= 0 && file.search(/merge\.php$/) < 0);
  });
}

function readFiles (files) {
  // Return an array of the file contents
  return files.map(function(file) {
    return fs.readFileSync(file, 'utf8').trim().match(/(^<\?php$)|(^[\D\d]*?;$)/mg);
  });
}

function mergeFiles (merge_id, files, newFile, flist) {
  // Return immediately if the array is empty
  if (files.length <= 0) return false;
 
  var buffer = "";
  var fileEnvs = {};
  var session = [];
  var req_no = [];
  var post_array = {}; // post_array[fileNum] = "array(xx=>xx,...)"

  /**
   *  Structure:
   *    Variables -> { Env: { Var Name : [ Value ] }
   */

  files.forEach(function(file, fileNum) {
    file.forEach(function(line) {
      var eq = line.indexOf('=');
      var ob = line.indexOf('[');
      var cb = line.indexOf(']');
      var found = false;

      if (eq >= 0 && ob >= 0 && cb >= 0) {
        var env = line.substring(0, ob);
        var ind = line.substring(ob + 1, cb);
        var val = line.substring(eq + 1, line.length - 1);
        if (fileEnvs[env] == undefined) fileEnvs[env] = {};
        if (fileEnvs[env][ind] == undefined) fileEnvs[env][ind] = [];
        fileEnvs[env][ind][fileNum] = val;
      } else if ((found = line.match(/".+\.session"/)) !== null && session.indexOf(found[0]) < 0) {
        session.push(found[0]);
      } else {
        var variable = line.substring(0, eq);
        if (variable.trim() == "$req_no") {
          var end = line.indexOf(";");
          var val = line.substring(eq+1, end).trim();
          req_no.push(val);
        } else if (variable.trim() == "$_POST") {
          var end = line.indexOf(";");
          var val = line.substring(eq+1, end).trim();
          post_array[fileNum] = val;
        }
      }
    });
  });

  buffer = buffer + "<?php\n";

  /*
  Object.keys(fileEnvs).forEach(function(env) {
    Object.keys(fileEnvs[env]).forEach(function(ind) {
      if (stringIsSame(fileEnvs[env][ind])) {
        buffer = buffer + env + "[" + ind + "]=" + fileEnvs[env][ind][0] + ";\n";
      } else {
        buffer = buffer + "\n$multi=NULL;\n";
        var i = 0;
        for (i = 0; i < files.length; i++) {
          if (fileEnvs[env][ind][i] == undefined) fileEnvs[env][ind][i] = '"NULL"';
          buffer = buffer + "$multi=add_multi($multi," + fileEnvs[env][ind][i] + "," + i + ");\n";
        }
        buffer = buffer + "array_set_multi(" + env + "," + ind + ",$multi);\n\n";
      }
    });
  });

  // set the req_no array
  const assert = require('assert');
  assert(req_no.length > 0);
  buffer = buffer + "$req_no=NULL;\n";
  for (i=0; i<req_no.length; i++) {
    buffer = buffer + "$req_no=add_multi($req_no," + req_no[i] + ", " + i + ");\n";
  }
  buffer = buffer + "$merge_no=" + merge_id + ";\n";
  */


  Object.keys(fileEnvs).forEach(function(env) {
    Object.keys(fileEnvs[env]).forEach(function(ind) {
      if (stringIsSame(fileEnvs[env][ind])) {
        buffer = buffer + env + "[" + ind + "]=" + fileEnvs[env][ind][0] + ";\n";
      } else {
        buffer = buffer + "\n$multi=gen_multi(array(";
        var i = 0;
        for (i = 0; i < files.length; i++) {
          if (fileEnvs[env][ind][i] == undefined) fileEnvs[env][ind][i] = '"NULL"';
          if (i!=0) buffer = buffer + ",";
          buffer = buffer + fileEnvs[env][ind][i];
        }
        buffer = buffer + "));\n";
        buffer = buffer + "array_set_multi(" + env + "," + ind + ",$multi);\n\n";
      }
    });
  });

  // merge the post array if any
  if (Object.keys(post_array).length > 0) {
    buffer = buffer + "$_POST=gen_multi(array(";
    var i = 0;
    for (i = 0; i < files.length; i++) {
      if (i!=0) buffer = buffer + ",";
      if (post_array[i] == undefined) {
        buffer = buffer + "NULL";
      } else {
        buffer = buffer + post_array[i];
      }
    }
    buffer = buffer + "));\n\n";
  }

  const assert = require('assert');
  assert(req_no.length > 0);
  buffer = buffer + "$req_no=gen_multi(array(";
  for (i=0; i<req_no.length; i++) {
    if (i!=0) buffer = buffer + ",";
    buffer = buffer + req_no[i];
  }
  buffer = buffer + "));\n";
  buffer = buffer + "$merge_no=" + merge_id + ";\n";

  /*
  // __tmp
  if ( session_state == 1 ) {
    // do nothing
    console.log(merge_id + " has no session");
  } else if ( session_state == 2 ) {
    console.log(merge_id + " has identical session");
    buffer = buffer + '$session_str=file_get_contents(' + session[0] + ');\n' +
              "session_start();\n" +
              "session_decode($session_str);\n";
  } else {
  buffer = buffer + '\n$multi_session_str=NULL;\n';
  var first = true;
  session.forEach(function(file, index) {
    if (first) {
      buffer = buffer + 'if (file_exists(' + file + ')) {\n';
      first = false;
    }
    buffer = buffer + '$session_str=file_get_contents(' + file + ');\n';
    buffer = buffer + '$multi_session_str=add_multi($multi_session_str,$session_str,' + index + ');\n'
  });
  buffer = buffer + "}\n" +
    "session_start();\n" +
    "if ($multi_session_str != \"\") {\n" +
    "  session_decode($multi_session_str);\n" +
    "}\n";
  }
  */


  buffer = buffer +
    "define('CHENG',1);\n" +
    "chdir($_SERVER['DOCUMENT_ROOT']);\n" +
    "include $_SERVER['SCRIPT_FILENAME'];\n";

  //session.forEach(function(file, index) {
  //  buffer = buffer + '$multi_session=add_multi($multi_session,' + file + ',' + index + ');\n';
  //});
  //buffer = buffer + '$f = fopen($multi_session,"r");\n';
  //buffer = buffer + '$ssss=fread($f,filesize($multi_session));\n';
  //buffer = buffer + 
  //  "fclose($f);\n" +
  //  "session_start();\n" +
  //  "session_decode($ssss);\n" +
  //  "define('CHENG',1);\n" +
  //  "chdir($_SERVER['DOCUMENT_ROOT']);\n" +
  //  "include $_SERVER['SCRIPT_FILENAME'];\n";

  // Write to the new file 'merge.php'
  fs.writeFileSync(newFile, buffer);

  // write the mapping to file (mXXX.php : rxxx.php rxxx.php ...)
  fs.appendFileSync(dst_mapping, newFile+": ("+flist.length+")  ");
  for (i=0; i<flist.length; i++) {
    fs.appendFileSync(dst_mapping, flist[i].substring(flist[i].lastIndexOf('/')+1) + ",");
  }
  fs.appendFileSync(dst_mapping, "\n");

  return true;
}

function stringIsSame (strArr) {
  // A method that compares all strings in an array and checks if they are equal
  // Return immediately if the array is empty
  if (strArr.length <= 0) return true;

  var str = strArr[0];
  return strArr.reduce(function(bool, nextStr) {
    return bool ? (nextStr === str) : bool;
  }, true); 
}
