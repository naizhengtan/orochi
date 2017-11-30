#include "fstream"
#include "iostream"
#include "sstream"
#include "stdio.h"
#include "stdlib.h"
#include "vector"
#include "dirent.h"

using namespace std;

//#define REQ_OUTPUT_LOC "/tmp/branch/output/"
#define DIFFER_OUTPUT_LOC "/tmp/veri/differ/"

/*
 * naive replay:
 * verification single:
 *     <src-folder>      [<dst-folder>]
 * verification batch:
 *     <src-folder>      [<dst-folder>] 
 */

#define assert(x) \
  cheng_assert((x), __LINE__)

// global
ofstream fail_requests;

void fail (string msg) {
  cout << "FATAL ERROR: " << msg << "\n";
  exit(1);
}

void cheng_assert(bool cond, int line) {
  if (!cond) fail("Assert false on line " + to_string(line));
}

string dlm_open = "~<~";
string dlm_close = "~>~";
bool contain_delimiter (string &str) {
  int cur_pos = 0;
  bool found = false;
  for (;;) {
    auto pos = str.find(dlm_open, cur_pos);
    if (pos == string::npos) {
      return found;
    }
    pos = str.find(dlm_close, pos);
    if (pos == string::npos) {
      assert(false); // ONLY find open without close
    }
    found = true;
    cur_pos = pos;
  }
  return found;
}

void dump_differ_files(string id, string &orig, string &us) {
  auto f_1 = DIFFER_OUTPUT_LOC"r"+id+".orig";
  ofstream of_1(f_1.c_str(), ofstream::out);
  of_1 << orig;
  of_1.close();

  auto f_2 = DIFFER_OUTPUT_LOC"r"+id+".oroc";
  ofstream of_2(f_2.c_str(), ofstream::out);
  of_2 << us;
  of_2.close();
}

void dump_different_parts(string id, string &orig, string &us) {
  auto f_1 = DIFFER_OUTPUT_LOC"d"+id+".orig";
  ofstream of_1(f_1.c_str(), ofstream::out);
  of_1 << orig;
  of_1.close();

  auto f_2 = DIFFER_OUTPUT_LOC"d"+id+".oroc";
  ofstream of_2(f_2.c_str(), ofstream::out);
  of_2 << us;
  of_2.close();
}


bool check_same (string fname, string f1, string f2) {
  // f1 is the replay page, f2 is original page
  ifstream ifs_1 (f1.c_str(), ifstream::in);
  stringstream buffer_1;
  buffer_1 << ifs_1.rdbuf();
  ifs_1.close();

  ifstream ifs_2 (f2.c_str(), ifstream::in);
  stringstream buffer_2;
  buffer_2 << ifs_2.rdbuf();
  ifs_2.close();

  auto str1 = buffer_1.str();
  auto str2 = buffer_2.str();
  /*
  if (contain_delimiter(str1)) {
    dump_different_parts(fname, str2, str1);
    return true;
  }
  */
  int diff_pos = str1.compare( str2 );
  return (diff_pos == 0);
}

size_t get_next_piece(const string& content, size_t pos, vector<string>& pieces) {
  size_t ret_pos=0;
  if ( pos + 1 < content.length() &&
      content[pos] == '[' && content[pos+1] == '{') {
    // find the end of such [{...}]
    ret_pos = content.find("}]", pos)+2; // skip the "}]"
    assert(ret_pos!=string::npos); // must end

    size_t cur_pos = pos+2; // first valid char
    for(;;) {
      auto start_pos = cur_pos;
      cur_pos = content.find("|||", cur_pos);
      if (cur_pos == string::npos || cur_pos >= ret_pos) {
        break;
      }
      pieces.push_back(content.substr(start_pos, (cur_pos - start_pos)));
      cur_pos += 3; // next valid char
    }
    return ret_pos;
  } else {
    // find the next [{
    ret_pos = content.find("[{", pos);
    int len = ((ret_pos == string::npos) ? content.length() - pos : ret_pos - pos);
    pieces.push_back(content.substr(pos, len));
    return ret_pos;
  }
}


bool check_same_batch (string f, string orig_path) {
  stringstream buffer;
  string req_line;
  ifstream ifs (f.c_str(), ifstream::in);

  getline(ifs, req_line);
  buffer << ifs.rdbuf();
  ifs.close();
  auto content = buffer.str();

  vector<string> batch_req_no;

  // find out the req_no in this batched file
  assert(req_line[0] == '[');
  assert(req_line[req_line.length() - 1] == ']');
  size_t pos = 1;
  for(;;) {
    auto start_pos = pos;
    pos = req_line.find(',',pos);
    if (pos != string::npos) {
      batch_req_no.push_back(req_line.substr(start_pos, pos - start_pos));
      pos++;
    } else {
      break;
    }
  };
  
  // load the original data in
  vector<string> orig_outputs;
  stringstream tmp_buf;
  for (auto req_no : batch_req_no) {
    auto fname = orig_path+"r"+req_no+".html";
    tmp_buf.str("");
    ifstream in (fname.c_str(), ifstream::in);
    tmp_buf << in.rdbuf();
    in.close();
    orig_outputs.push_back(tmp_buf.str());
  }

  // construct batch outputs
  int req_size = batch_req_no.size();
  //stringstream batch_outputs[req_size];
  stringstream* batch_outputs = new stringstream[req_size];
  size_t bpos = 0;
  for(;;) {
    vector<string> pieces;
    auto xxx= bpos;
    bpos = get_next_piece(content, bpos, pieces);

    bool single = (pieces.size() == 1);
    if (!single) {
      if (pieces.size() != req_size) {
        std::cout << "Error during " << f << "\n";
        std::cout << "  Pieces size=" << pieces.size() << ", request size = " << req_size << "\n";
      }
      assert(pieces.size() == req_size);
    }
    for (int i = 0; i < req_size; i++) {
      batch_outputs[i] << (single ? pieces[0] : pieces[i]);
      //cout << "\n" << (single?pieces[0]:pieces[i]) << "\n";
    }

    if (bpos == string::npos) {
      break;
    }
  }

  //for (int i=0;i<req_size; i++) {
  //  cout << batch_outputs[i].str() << "\n========\n";
  //}

  // compare
  assert(orig_outputs.size() == req_size);
  bool isSame = true;
  for (int i=0; i<req_size; i++) {
    auto batch_str = batch_outputs[i].str();
    // check if there is ignore-section
    if (contain_delimiter(batch_str)) {
      dump_different_parts(batch_req_no[i], orig_outputs[i], batch_str);
    } else {
      int diff_pos = orig_outputs[i].compare( batch_str );
      if (diff_pos != 0) {
        isSame = false;
        //cout << "Request r" << batch_req_no[i] << " differs\n";
        fail_requests << "r" <<batch_req_no[i] << ".php,";
        dump_differ_files(batch_req_no[i], orig_outputs[i], batch_str);
      }
    }
  }

  delete[] batch_outputs;
  return isSame;
}


vector<string>
extract_file_name(string& folder) {
  DIR *dir;
  struct dirent *curf;
  vector<string> ret;

  dir = opendir(folder.c_str());
  if (dir != NULL) {
    while (curf = readdir(dir)) {
      string fname = string(curf->d_name);
      if (fname != "." && fname != "..") {
        ret.push_back(fname);
      }
    }
  } else {
    fail("cannot open folder: " + folder);
  }
  return ret;
}



int main(int args, char** argv) {
  if (args != 4) {
    cout << "Usage: odiff [single|batch] <veri folder> <orig folder>\n";
    exit(1);
  }

  fail_requests.open("/tmp/veri/batch_fail_req.log", ofstream::out);

  string mode(argv[1]);
  bool batch_mode = mode == "batch" ? true : false;

  string folder(argv[2]);
  vector<string> names = extract_file_name(folder);

  string orig_fd(argv[3]);
  
  int total_num = names.size(), fail_num = 0;
  if (!batch_mode) {
    for (auto fname : names) {
      bool same = check_same(fname, folder+"/"+fname, orig_fd+"/"+fname);
      if (!same) {
        cout << "  fail on " << fname << "\n";
        fail_requests << fname << ",";
        fail_num ++;
      }
    }
  } else {
    for (auto fname : names) {
      if (fname[0] == 'r') {
        bool same = check_same(fname, folder+"/"+fname, orig_fd+"/"+fname);
        if (!same) {
          cout << "  fail on " << fname << "\n";
          string php_file = fname;
          fail_requests << php_file.replace(php_file.length()-4, 4, "php") << ",";
          fail_num++;
        }
      } else if (fname[0] == 'm') {
        bool same = check_same_batch(folder+"/"+fname, orig_fd);
        if (!same) {
          cout << "  fail on " << fname << "\n";
          fail_num++;
        }
      } else {
        fail("meet a unknow file: " + fname);
      }
    }
  }
 
  cout << "Finish orochi diff, fail on " << fail_num << "/" << total_num << "\n";
  fail_requests.close();
  if (fail_num > 0) {
    exit(1);
  }
}
