#include "fstream"
#include "iostream"
#include "sstream"
#include "stdio.h"
#include "stdlib.h"
#include "stdint.h"
#include "vector"
#include "map"
#include "dirent.h"
#include "string"
#include "set"
#include "algorithm"

using namespace std;

#define REQ_OUTPUT_LOC "/tmp/branch/output/"
#define DIFFER_OUTPUT_LOC "/tmp/veri/differ/"

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
  cout << "check_sql.php <online_sql.log> <veri_sql_1.log> <veri_sql_2.log>\n";
}

string
file_get_contents(string file) {
  ifstream ifs (file.c_str(), ifstream::in);
  stringstream buffer;
  buffer << ifs.rdbuf();
  ifs.close();

  return buffer.str();
}

vector<string>
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



map<int64_t, string>
load_veri_log(string log1, string log2) {
  string content = file_get_contents(log1);
  vector<string> row1, row2;
  if (content != "") {
    row1 = explode(content, "|]|");
  }

  content = file_get_contents(log2);
  if (content != "") {
    row2 = explode(content, "|]|");
  }

  // NOTE: log1 are the rerun log, so if there are duplicated ones
  // use the log1's entry
  set<string> log1_entreis;
  for (auto row : row1) {
    log1_entreis.insert(row);
  }
  // add all entries to row1
  for (auto row : row2) {
    // if not in log1
    if (log1_entreis.find(row) == log1_entreis.end()) {
      row1.push_back(row);
    }
  }

  map<int64_t, string> ret;
  for (auto row : row1) {
    if (row == "") continue;

    auto elems = explode(row, "#&#");
    assert(elems.size() == 2);
    string str_ts = elems[0];
    string query = elems[1];
    int64_t ts = stoll(str_ts);

    ret[ts] = query;
  }

  return ret;
}

// return the array which layout is like:
// [ts => {rid, opnum, query}, ...]
typedef tuple<int, int, string> QueryInfo;

map<int64_t, QueryInfo> 
load_orig_log (string log) {
  string content = file_get_contents(log);
  auto entries = explode(content, "|]|"); 

  map<int64_t, QueryInfo> ret;

  // entry: rid #&# opnum #&# {write|read|txn} #&# {true|false} #&# query
  int64_t seq_num = 0;
  for (auto entry : entries) {
    if(entry == "END" || entry == "") continue;

    auto elems = explode(entry, "#&#");
    if (elems.size() == 5) {
      assert(elems[2] != "txn");
      // this is single query
      int64_t ts = seq_num * 10000; 
      assert(ret.find(ts) == ret.end());
      ret[ts] = make_tuple(stoi(elems[0]), stoi(elems[1]), elems[4]);
    } else if ((elems.size() - 4) % 3 == 0) { 
      // this is in txn
      // entry: rid #&# opnum #&# txn #&# {true|false} #&#
      //             write #&# true #&# BEGIN 
      //             read  #&# true #&# SELECT 
      assert(elems[2] == "txn");
      int rid = stoi(elems[0]);
      int opnum = stoi(elems[1]);

      auto start = elems.begin() + 4;
      auto end = elems.end();
      vector<string> q_elems(start, end);

      for (int i=0; i<q_elems.size(); i+=3) {
        int64_t ts = seq_num * 10000 + i/3;
        auto sql = q_elems[i+2];
        //echo "[$ts] ".$elems[$i+2]."\n";
        ret[ts] = make_tuple(rid, opnum, sql);
      }
    } else {
      assert(false);
    }
    // increase the op counter by 1
    seq_num++;
  }
  return ret;
}


// main
//
int main(int args, char* argv[]) {
  if (args != 4) {
    usage();
    exit(1);
  }

  string online_log(argv[1]);
  string veri_log1(argv[2]);
  string veri_log2(argv[3]);

  map<int64_t, QueryInfo> orig = load_orig_log(online_log);
  map<int64_t, string> veri = load_veri_log(veri_log1, veri_log2);

  // check whether veri
  bool success = true;
  for (auto elem : veri) {
    int64_t ts = elem.first;
    string query = elem.second;

    if (orig.find(ts) == orig.end()) {
      success = false;
      cout << "VERIFICATION FAIL: cannot find query in original file at timestamp[" << ts << "]\n";
      cout << "            <<<" << query << ">>>\n";
      continue;
    }

    QueryInfo q_i = orig[ts];
    int rid, opnum;
    string o_query;
    tie(rid, opnum, o_query) = q_i;

    if (trim(o_query) != trim(query)) {
      cout << "[ERROR]: mismatch query!\n    rid=" << rid << " opnum=" << opnum << " ts=" << ts <<
        "\n    ======orig=========\n" << o_query << "\n   ==========veri==========\n" << query << "\n";
      success = false;
    } else {
      // delete from orig
      orig.erase(ts);
    }
  }

  // list all missing queries in veri
  for (auto it : orig) {
    int64_t ts = it.first;
    QueryInfo q_i = it.second;
    int rid, opnum;
    string o_query;
    tie(rid, opnum, o_query) = q_i;

    cout << "[MISSING]: rid=" << rid << " opnum=" << opnum <<  "\n     " << o_query << "\n";
    success = false;
  }

  if (success) {
    cout << "PASS!\n";
  } else {
    exit(1); 
  }
}
