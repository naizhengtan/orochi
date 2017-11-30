#include "fstream"
#include "iostream"
#include "sstream"
#include "stdio.h"
#include "stdlib.h"
#include "vector"
#include "set"
#include "dirent.h"
#include "algorithm"

using namespace std;

#define assert(x) \
  cheng_assert((x), __LINE__)

void
fail (string msg) {
  cout << "FATAL ERROR: " << msg << "\n";
  exit(1);
}

void
cheng_assert(bool cond, int line) {
  if (!cond) fail("Assert false on line " + to_string(line));
}

void
usage() {
  cout << "check_session <online_log_folder> <veri_log_folder>\n";
}

// list all the session files
vector<string>
list_sess_files(string folder) {
  DIR *dir;
  struct dirent *curf;
  vector<string> ret;

  dir = opendir(folder.c_str());
  if (dir != NULL) {
    while (curf = readdir(dir)) {
      string fname = string(curf->d_name);
      if (fname.find_last_of('.') != string::npos &&
          fname.substr(fname.find_last_of('.')+1) == "sess") {
        ret.push_back(fname);
      }
    }
  } else {
    fail("cannot open folder: " + folder);
  }
  return ret;
}

bool
check_file_identical (string f1, string f2) {
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
  int diff_pos = str1.compare( str2 );
  return (diff_pos == 0);
}

inline vector<string>
explode(string const &s, string delim) {

  vector<string> tokens;                            
  string::size_type start_pos = 0, end_pos = 0, length = s.length(), dlen = delim.length();

  while(end_pos < length) {
    end_pos = s.find(delim, end_pos);
    if (end_pos == string::npos)                         
    {
      // cannot find anything any more                        
      end_pos = length;                                       
      break;                                                  
    }

    tokens.push_back( s.substr(start_pos, end_pos - start_pos) );
    start_pos = end_pos + dlen;
    end_pos = start_pos;  
  } 

  if (start_pos < end_pos) {                                  
    tokens.push_back( s.substr(start_pos, end_pos - start_pos) );
  } 

  return tokens;
}   

static inline string trim(const string &s) {
  auto wsfront=find_if_not(s.begin(),s.end(),[](int c){return isspace(c);});
  auto wsback=find_if_not(s.rbegin(),s.rend(),[](int c){return isspace(c);}).base();
  return (wsback<=wsfront ? string() : string(wsfront,wsback));
}  

void
dump_sid_rid_to_file(set<string> fnames) {
  stringstream output; 
  for(auto it : fnames) {
    if (trim(it) == "") continue;
    auto tokens = explode(it, "_");
    if (tokens.size() != 4) {
      cout << "ERROR: problematic name [" << it << "]\n";
      assert(false);
    }

    // rid,session_id;
    output << tokens[2] << "," << tokens[1] << ";";
  }

  ofstream of("/tmp/rid_sid.log", ofstream::out);
  of << output.str();
  of.close();
}

bool
compare_orig_to_veri(vector<string> orig_vec, vector<string> veri_vec,
                     string orig_path, string veri_path) {
  bool success = true;

  // create two sets
  set<string> orig_files, veri_files;
  for (auto fname : orig_vec) {
    orig_files.insert(fname);
  }
  for (auto fname : veri_vec) {
    veri_files.insert(fname);
  }

  // check if the corresponding file contents are the same
  for (auto fname : veri_vec) {
    if (orig_files.find(fname) != orig_files.end()) {
      // both exists, check the contents
      bool same = check_file_identical(orig_path+"/"+fname, veri_path+"/"+fname);
      if (!same) {
        cout << "VERIFICATION ERROR: session [" << fname << "] is not the same\n";
        success = false;
      }
    } else {
      // fname contained in veri_vec, but not orig_files
      cout << "VERIFICATION ERROR: session [" << fname << "] in verification, doesn't in origin\n";
      success = false;
    }
  }

  // try to find missing:
  // file in origin but not in verification
  vector<string> missing;
  for (auto fname : orig_vec) {
    if (veri_files.find(fname) == veri_files.end()) {
      missing.push_back(fname);
    }
  }
  
  if (missing.size() > 0) {
    cout << "VERIFICATION ERROR: session missing!\n";
    cout << "============\n";
    for (auto fname : missing) {
      cout << fname << ", ";
    }
    cout << "============\n";
    success = false;
  }

  dump_sid_rid_to_file(veri_files);

  return success;
}

// main
int main(int args, char* argv[]) {
  if (args != 3) {
    usage();
    exit(1);
  }

  string orig_path(argv[1]);
  string veri_path(argv[2]);

  auto orig_vec = list_sess_files(orig_path);
  auto veri_vec = list_sess_files(veri_path);

  bool success = compare_orig_to_veri(orig_vec, veri_vec, orig_path, veri_path);

  if (success) {
    cout << "Session check PASS\n";
    exit(0);
  } else {
    cout << "Session check FAIL\n";
    exit(1);
  }
}
