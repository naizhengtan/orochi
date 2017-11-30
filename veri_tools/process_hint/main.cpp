#include <time.h>
#include "iostream"
#include "stdlib.h"
#include "string"
#include "fstream"
#include "sstream"
#include "vector"
#include "map"
#include "unordered_map"
#include "set"
#include "unordered_set"
#include "stack"
#include <tr1/unordered_map>

#include "graph.h"

using namespace std;
//======Helper Function======
void usage() {
  std::cout << "Usage: hintprocess <trace_seq.log>(input) <sess.log>(input) <apc.log>(input) <sql.log>(input) <maxop.log>(input) <OpGraph>(output)\n";
}

static inline std::string trim(std::string &s) {
  s.erase(s.begin(), std::find_if(s.begin(), s.end(),
          std::not1(std::ptr_fun<int, int>(std::isspace))));

  s.erase(std::find_if(s.rbegin(), s.rend(),
          std::not1(std::ptr_fun<int, int>(std::isspace))).base(), s.end());
  return s;
}

// JBL: minor, but this seems expensive for large log files.
void
ReadFromLog(string fpath, string &ret) {
  ifstream in(fpath);
  //return static_cast<stringstream const&>(stringstream() << in.rdbuf()).str();
  cheng_assert(in, "read from "+fpath+"fail");
  filebuf* pbuf = in.rdbuf(); 
  size_t size = pbuf->pubseekoff(0, in.end, in.in);

  pbuf->pubseekpos (0,in.in);
  char *buffer = new char[size];
  pbuf->sgetn(buffer, size);
  in.close();

  if (size == 0) {
    ret = "";
  } else {
    ret = string(buffer, size);
  }
  delete[] buffer;
}

inline const char *
string_memnstr(const char *haystack, const char *needle,
                           int needle_len, const char *end) {
  const char *p = haystack;
  char ne = needle[needle_len-1];

  end -= needle_len;
  while (p <= end) {
    if ((p = (char *)memchr(p, *needle, (end-p+1))) && ne == p[needle_len-1]) {
      if (!memcmp(needle, p, needle_len-1)) {
        return p;
      }
    }
    if (p == nullptr) {
      return nullptr;
    }
    p++;
  }
  return nullptr;
}

inline int
string_find(const char *input, int len, const char *s, int s_len, int pos) {
  if (!s_len || pos < 0 || pos > len) {
    return -1;
  }
  void *ptr = (void*)string_memnstr(input + pos, s, s_len, input + len);
  if (ptr != nullptr) {
    return (int)((const char *)ptr - input);
  }
  return -1;
}


inline vector<string> Explode(const string &str, string delimiter) {
  vector<string> elems;
  int cur_elem_start_pos = 0, cur_pos = 0;
  size_t del_len = delimiter.length();
  int str_len = str.length(); 

  const char *str_char = str.c_str();
  const char *delimiter_char = delimiter.c_str();
  while (true) {
    int first_matching_char = string_find(str_char, str_len, delimiter_char, del_len, cur_pos);
    if (first_matching_char == -1) {
      break;
    }
    elems.push_back(str.substr(cur_elem_start_pos, first_matching_char - cur_elem_start_pos));
    cur_pos = cur_elem_start_pos = first_matching_char + del_len;
  }

  // the string left is an element
  if (cur_pos < str.length()) {
    string left = str.substr(cur_pos);
    elems.push_back(left);
  }
  return elems;
}

// Return: [first_token_start, first_token_len, second_token_start, second_token_len, ...]
// This impl is nasty, since it is for performance purpose
int
IndexExplode(const string &str, const string &delimiter, int64_t token_locs[]) {
  int counter = 0;
  int cur_elem_start_pos = 0, cur_pos = 0;
  size_t del_len = delimiter.length();
  int str_len = str.length(); 

  const char *str_char = str.c_str();
  const char *delimiter_char = delimiter.c_str();
  while (true) {
    int first_matching_char = string_find(str_char, str_len, delimiter_char, del_len, cur_pos);
    if (first_matching_char == -1) {
      break;
    }
    token_locs[counter*2] = cur_elem_start_pos;
    token_locs[counter*2+1] = first_matching_char - cur_elem_start_pos;
    cur_pos = cur_elem_start_pos = first_matching_char + del_len;
    counter++;
    cheng_assert(counter < 1000, "FATAL ERROR: IndexExplode is not designed to have more than 1000 elements");
  }

  // the string left is an element
  if (cur_pos < str.length()) {
    token_locs[counter*2] = cur_pos;
    token_locs[counter*2+1] = str.length() - cur_pos;
    counter++;
  }

  return counter;
}

//=======MaxOp================

tr1::unordered_map<int,int> max_op;

inline void
UpdateMaxOp(int64_t rid, int opnum) {
  cheng_assert(max_op.find(rid) == max_op.end(), "VERIFICATION FAIL: find duplicate rid in MaxOp log "
               + std::to_string(rid));
  max_op.insert(pair<int,int>(rid, opnum));
}

inline void 
CheckMaxOp(int64_t rid, int opnum) {
  cheng_assert(max_op.find(rid) != max_op.end(), "VERIFICATION FAIL: cannot find this rid " + std::to_string(rid)); 
  cheng_assert(max_op[rid] >= opnum, "VERIFICATION FAIL: opnum larger than maxop, opnum:"
               + std::to_string(opnum) + " maxop:" + std::to_string(max_op[rid])); 
}

// format: r1:max_op1,r2:max_op2,...
void
ParseMaxopLog(string log, tr1::unordered_map<int,int>& max_op) {
  string content;
  ReadFromLog(log, content);

  auto entries = Explode(content, ",");
  for (auto entry : entries) {
    if (entry == "") continue;
    auto tokens = Explode(entry, ":"); 
    int64_t rid = stoll(tokens[0]);
    int opnum = stoi(tokens[1]);
    UpdateMaxOp(rid, opnum);
  }
}

void
SyncMaxOpAndTrace(vector<Request> &trace) {
  unordered_set<int> trace_rid_set;
  // trace -> max_op
  for (auto it : trace) {
    // it might appear requests without op
    if (max_op.find(it.rid) == max_op.end()) {
      UpdateMaxOp(it.rid,-1);
    }
    trace_rid_set.insert(it.rid);
  }

  // max_op -> trace
  // this should not happen!
  bool fail = false;
  for (auto it : max_op) {
    int64_t rid = it.first;
    if (trace_rid_set.find(rid) == trace_rid_set.end()) {
      std::cout << "FATAL ERROR: rid[" + to_string(rid) + "] cannot be found in trace\n";
      fail = true;
    }
  }
  cheng_assert(!fail, "some rids cannot be found");
}

//=======Trace Parsing=========
void DebugDumpReqList(vector<Request> v) {
  std::cout << "=====Req List====\n";
  for (auto it : v) {
    std::cout << it.isReq << ", " << 
      it.mapping_id << ", " << it.rid << "\n";
  }
  std::cout << "=================\n";
}

void
ParseTraceLog(string trace_log, vector<Request>& req_queue) {
  // parse trace log
  string trace_content;
  ReadFromLog(trace_log, trace_content);
  // split into requests
  auto raw_req = Explode(trace_content, ";");

  /* debug log
  for(auto it : raw_req) {
    std::cout << "- " << it << "\n";
  }*/

  tr1::unordered_map<string,int> mapping_counters;

  for (string entry : raw_req) {
    if (entry == "") continue;
    // entry = "1,192.168.0.1:8080,req;" or "192.168.0.1:8080,12,resp"
    // entry: counter, ip:port, req  or  ip:port, rid, resp
    auto elems = Explode(entry, ",");
    cheng_assert(elems.size() == 3, "trace format damage: ["+entry+"]");

    Request req;
    if (elems[2] == "req") {
      // get current req counter of current ip:port
      // the req counter should be even
      string ip_port = elems[1];
      if (mapping_counters.find(ip_port) == mapping_counters.end()) {
        mapping_counters[ip_port] = 0;
      }
      int req_counter = mapping_counters[ip_port];
      cheng_assert(req_counter % 2 == 0, "FATAL ERROR: The request counter should be even, but for ip:port=" +
                   ip_port + ", the request counter is " + to_string(req_counter));
      req.isReq = true;
      req.rid = -1; 
      // we're going to use "ip:port:counter" as the mapping_id
      // the counter will increase for the pairing resp
      req.mapping_id = ip_port + ":" + to_string(req_counter);
      mapping_counters[ip_port] = req_counter + 1;
    } else if (elems[2] == "resp") {
      // get current counter of current ip:port
      // the resp counter should be even
      string ip_port = elems[0];
      cheng_assert(mapping_counters.find(ip_port) != mapping_counters.end(),
                   "FATAL ERROR: The counter for ip:port=" + ip_port + " doesn't exist. resp before req");
      int resp_counter = mapping_counters[ip_port];
      cheng_assert(resp_counter % 2 == 1, "The response counter should be odd, but for ip:port=" + ip_port +
                   ", the resp counter is " + to_string(resp_counter));

      req.isReq = false;
      req.rid = stoi(elems[1]);
      req.mapping_id = ip_port + ":" + to_string(resp_counter-1);  // pair the previous req
      mapping_counters[ip_port] = resp_counter + 1;
    } else {
      cheng_assert(false, "this [" + elems[2] + "] should be either req or resp");
    }

    req_queue.push_back(req);
  }
}

void
PairReqRespAndCheckingCompleteness(vector<Request> &req_queue) {
  // checking the completeness and pairing them
  // * if there is a BEG(rid) there is eventually an END(rid)
  tr1::unordered_map<string, Request*> requests;
  set<string> mapped_id;
  for (Request& req : req_queue) {
    if (req.isReq) {
      cheng_assert(requests.find(req.mapping_id) == requests.end(), "VERIFICATION FAIL! DUPLICATED REQ ID");
      cheng_assert(mapped_id.find(req.mapping_id) == mapped_id.end(), "VERIFICATION FAIL! DUPLICATED REQ ID");
      requests.insert(pair<string, Request*>(req.mapping_id, &req));
    } else {
      cheng_assert(requests.find(req.mapping_id) != requests.end(),
                   "VERIFICATION FAIL! NO CORRESPONDING REQUEST FOR RID=" + to_string(req.rid));
      /*
      if (requests.find(req.mapping_id) == requests.end()) {
        // FIXME: response cannot find request. 
        cout <<  "Warning: NO CORRESPONDING REQUEST\n" <<
          "IsReq:" << req.isReq << ", Mapping_id:" <<
          req.mapping_id << ", Rid:" << req.rid << "\n";
        // This will not help, will not add an request to the graph or trace
        requests.insert(pair<string, Request*>(req.mapping_id, &req));
      }
      */
      cheng_assert(mapped_id.find(req.mapping_id) == mapped_id.end(), "VERIFICATION FAIL! DUPLICATED RESPONSE");
      auto corr_req_ptr = requests[req.mapping_id];
      corr_req_ptr->rid = req.rid; // set the rid for HTTP request
      requests.erase(req.mapping_id); // remove from the map
      mapped_id.insert(req.mapping_id);
    }
  }
  /* // debug log
  std::cout << requests.size() << "\n";
  for (auto it : requests) {
    std::cout << it.first << "\n";
  }
  */
  for (auto it : requests) {
    // Alert for debug: request cannot find response. Might not be HTTP response. 
    std::cout << "Warning:  Req[" << it.second->mapping_id << "] rid="
      << it.second->rid << " doesn't match any response!\n";
  }
  cheng_assert(requests.size() == 0, "VERIFICATION FAIL! UNMAPPING REQUESTS EXIST");
}

//==========Log Parsing==============
// The format for session raw log:
//    rid #&# op_num #&# optype #&# key |]| ...
//     optype={read, write}
//
// The format for apc raw log:
//     rid#&#op_num#&#store#&#key#&#value#&#ttl#&#str_ret|]|
//     rid#&#op_num#&#delete#&#key#&#str_ret|]|
//     rid#&#op_num#&#fetch#&#key|]|
//
// The format for sql raw log:
//    rid #&# op_num #&# optype #&# opret #&# opcontent |]| ...
//     optype={read, write}
//     opret={NULL(for read), other(for write)}

vector<RidOpnum>
ParseOpLog(string log, LOG_TYPE log_type, OpGraph &graph) {
  // check the type
  cheng_assert(log_type == LOG_SESSION || log_type == LOG_APC || log_type == LOG_DB, "FATAL ERROR! meet unsuported log type!");
  // parse trace log
  string log_content;
  ReadFromLog(log, log_content);
  // split into entries 
  string delimiter = "|]|";
  if (log_type == LOG_APC) delimiter= "]&#]";
  auto raw_entries = Explode(log_content, delimiter);

  // debug log
  /*
  for(auto it : raw_entries) {
    std::cout << "- " << it << "\n";
  }
  */

  int64_t elem_indxs[2000];
  int64_t counter = 0;
  vector<RidOpnum> log_seqs;
  for (string& raw_entry : raw_entries) {
    if (raw_entry == "") continue;
    // NOTE: IndexExplode is specially designed for THIS invokation for performance purpose
    // Don't use it in other places
    int elem_size = IndexExplode(raw_entry, "#&#", elem_indxs);

    // check the validity of the log
    if (log_type == LOG_APC) {
      cheng_assert(elem_size == 7 /*store*/ ||
                   elem_size == 5 /*delete*/ ||
                   elem_size == 4,
                   "apc log format damage: ["+ raw_entry.substr(0,1000) +"...]\n"+
                   "The elem_size=" + std::to_string(elem_size)
                   );
    } else if (log_type == LOG_DB) {
      if (raw_entry == "END") continue;
      // if it is txn
      if (raw_entry.substr(elem_indxs[2*2], elem_indxs[2*2+1]) == "txn") {
        // 4 for txn; 3 for each query
        cheng_assert( (elem_size - 4) % 3 == 0, "sql log format damage: ["+raw_entry.substr(0,1000)+"...]");
      } else {
        // if it is query
        cheng_assert(elem_size == 5, "sql log format damage: ["+raw_entry.substr(0,1000)+"...]");
      }
    } else if (log_type == LOG_SESSION) {
      cheng_assert(elem_size == 4, "sess log format damage: ["+raw_entry.substr(0,1000)+"...]");
    }

    int64_t seq_num = counter++;
    int64_t rid = stoll(raw_entry.substr(elem_indxs[0], elem_indxs[1]));
    int op_num = stoi(raw_entry.substr(elem_indxs[2], elem_indxs[3]));
    string action = raw_entry.substr(elem_indxs[4], elem_indxs[5]);
    OP_TYPE op_type = TYPE_NONE;
    //string op_content;

    // check maxop 
    CheckMaxOp(rid, op_num);

    // organize the OpContent
    if (log_type == LOG_APC) {
      if (action == "store") {
        op_type = KV_SET;
      } else if (action == "delete") {
        op_type = KV_DEL;
      } else if (action == "fetch") {
        op_type = KV_GET;
      } else {
        cheng_assert(false, "this [" + action + "] should be {store, fetch, delete}");
      }
    } else if (log_type == LOG_DB) {
      if (action == "read") {
        op_type = SQL_READ;
      }else if (action == "write") {
        op_type = SQL_WRITE;
      }else if (action == "txn") {
        op_type = SQL_TXN;
      } else {
        cout << raw_entry << "\n";
        cheng_assert(false, "this [" + action + "] should be {read, write}");
      }
    } else if (log_type == LOG_SESSION) {
      if (action == "read") {
        op_type = REGISTER_READ;
      }else if (action == "write") {
        op_type = REGISTER_WRITE;
      } else {
        cout << raw_entry << "\n";
        cheng_assert(false, "this [" + action + "] should be {read, write}");
      }
    }

    // create a OpNode for this entry
    OpNode op = graph.CreateOpNode(rid, op_num, log_type, seq_num, op_type, ""/*op_content*/);
    log_seqs.push_back(make_pair(rid,op_num));
  }

  return log_seqs;
}

//==============OPMAP======================

void
DumpOpMap(tr1::unordered_map<int64_t, pair<OP_TYPE,int64_t>> op_map, string opmap_log) {
  ofstream out(opmap_log); 
  cheng_assert(out, "FATAL ERROR! Create opmap file [" + opmap_log + "] fail");
  for (auto it : op_map) {
    // rid-opnum
    int64_t rid_opnum = it.first;
    // pair<LOG_TYPE, int>
    auto pair = it.second; 
    out << rid_opnum << ":" << pair.first << "," << pair.second << ";";
  }
  out.close();
}

//=========================================
//=========Orochi Algorithm Functions======
//=========================================

// JBL: AUDITED
void
AddProgramEdges(OpGraph &graph) {
  // add program edges
  // since trace and max_op has synced
  for (auto it : max_op) {
    int64_t rid = it.first;
    int max_op_num = it.second; 

    // if there is any op within request
    if (max_op_num >= 0) {
      // link the start op to the first op
      OpNode start_op = graph.GetOpNodeIfNonFail(rid, REQUEST_START_OP_NUM);
      cheng_assert(start_op.rid != -1, "VERIFICATION FAIL! rid[" + to_string(rid) 
                   + "] cannot be found in trace, max_op_num=" + to_string(max_op_num)); 

      OpNode prev_op = start_op;
      for (int i=1; i <= max_op_num; i++) {
        OpNode op = graph.GetOpNodeIfNonFail(rid, i);
        graph.AddEdge(prev_op, op);
        prev_op = op;
      }

      // link the final op to end
      OpNode last_op = prev_op; 
      OpNode end_op = graph.GetOpNodeIfNonFail(rid, REQUEST_END_OP_NUM);
      graph.AddEdge(last_op, end_op);
    } else {
      // no op in rid, link start and end
      OpNode start_op = graph.GetOpNodeIfNonFail(rid, REQUEST_START_OP_NUM);
      OpNode end_op = graph.GetOpNodeIfNonFail(rid, REQUEST_END_OP_NUM);
      graph.AddEdge(start_op, end_op);
    }
  }
}

// JBL: AUDITED.
void
AddRealTimeEdges(vector<Request>& trace, OpGraph &graph) {
  // JBL: Minor, if you are not modifying the trace you should say "const blah&"
  // main work
  tr1::unordered_map<int, OpNode> frontier;

  // JBL: Are frame numbers real time order?
  for (auto req : trace) {

    if (req.isReq) {
      if (req.rid == -1) {
        // this is unmatched req which has been reported during pairing
        // JBL: Why is this not a cheng_assert failure?
        continue;
      }
      // op is a HTTP req (start)
      OpNode op = graph.CreateOpNode(req.rid, REQUEST_START_OP_NUM, META, 0/*seq_num*/, META_START, "");
      for (auto node_pair : frontier) {
        graph.AddEdge(node_pair.second, op); // rid_old_end --> rid_new_start
      }
    } else {
      // op is a HTTP resp (end)
      OpNode cur_op = graph.CreateOpNode(req.rid, REQUEST_END_OP_NUM, META, 0/*seq_num*/, META_END, "");

      // remove the stale_nodes from frontier
      OpNode prev_rid_op = graph.GetOpNodeIfNonFail(req.rid, REQUEST_START_OP_NUM); // this is the start of this req
      auto stale_nodes = graph.InEdge(prev_rid_op);
      for (auto n : stale_nodes) {
        frontier.erase(n.id());
      }

      // add cur_op into frontier
      frontier.insert(std::pair<int,OpNode>(cur_op.id(), cur_op));
    }
  }
}

// JBL AUDITED
// return the OpMap: "rid-opnum" => (OP_TYPE, log_indx)
tr1::unordered_map<int64_t, pair<OP_TYPE,int64_t>>
CheckLogsAndAddStateEdges(OpGraph& graph, const vector<RidOpnum>& apc_list,
                          const vector<RidOpnum>& sql_list, const vector<RidOpnum>& sess_list) {
  tr1::unordered_map<int64_t, pair<OP_TYPE,int64_t>> opmap;
  // iterate over each log, and for each entry:
  //   -- (1) check the entry corresponds to a real rid
  //   -- (2) check that the claimed opnum obeys (0,MaxOp]
  //   -- (3) check that the claimed opnum is unique
  //   -- add it to OpMap
  //
  //   -- add a log edge to G if the adjacent entries are from different rid
  //   -- (4) if they are from the same request, check that the intra-request opnum is increasing
  const vector<RidOpnum>* op_list[3];
  op_list[0] = &apc_list;
  op_list[1] = &sql_list;
  op_list[2] = &sess_list;
  LOG_TYPE types[] = {LOG_APC, LOG_DB, LOG_SESSION};

  for (int i = 0; i < 3; i++) {
    const vector<RidOpnum>& cur_list = *(op_list[i]);
    LOG_TYPE cur_log_type = types[i];

    int64_t cur_log_indx = -1;
    int prev_op_rid = 0, prev_op_num = 0;

    // update the log ops
    for (RidOpnum rid_opnum : cur_list) {
      //   -- (1) check the entry corresponds to a real rid
      //   Why? max_op and trace are synced.
      int64_t rid = rid_opnum.first;
      int op_num = rid_opnum.second;
      cheng_assert(max_op.find(rid) != max_op.end(), "VERIFICATION FAIL! Cannot find rid of log entry!");

      //   -- (2) check that the claimed opnum obeys (0,MaxOp]
      if (op_num < 0 || op_num > max_op[rid]) {
        cheng_assert(false, "VERIFICATION FAIL! Find one op_num > op_max!");
      }

      //   -- (3) check that the claimed opnum is unique
      //          This is guaranteed by the assertion in OpNode::CreateOpNode() 
      OpNode op = graph.GetOpNodeIfNonFail(rid, op_num);

      // check log parsing logic
      cheng_assert(cur_log_indx < op.seqNum, "FATAL ERROR! list[" +
                   to_string(i) + "] is not monolic increasing!");
      cur_log_indx = op.seqNum;

      // add to OpMap
      //string key = to_string(rid) + "-" + to_string(op_num);
      int64_t key = get_id(rid, op_num);
      opmap.insert(pair<int64_t,pair<OP_TYPE,int64_t> >(key, pair<OP_TYPE,int64_t>(op.opType, op.seqNum)));

      // JBL: This is "AddStateEdges," right? You should flag that in the
      // comments
      // if current op is not the first op in the log
      if (op.seqNum != 0) {
        // prev_op does not share the same rid with this op
        //   need: prev_op --> op
        if (prev_op_rid != rid) {
          OpNode prev_op = graph.GetOpNodeIfNonFail(prev_op_rid, prev_op_num);
          OpNode cur_op = graph.GetOpNodeIfNonFail(rid, op_num);
          graph.AddEdge(prev_op, cur_op);
        } else {
          // prev_op does share the same rid with this op
          //   -- (4) if they are from the same request, check that the intra-request opnum is increasing
          cheng_assert(op_num > prev_op_num, "VERIFICATION FAIL! Within one request, op_num decrease");
        }
      }

      prev_op_rid = rid;
      prev_op_num = op_num;
    }
  }

  // sanity check
  for (auto it : max_op) {
    int64_t rid = it.first;
    int max_op_num = it.second; 
    for (int i=1; i<=max_op_num; i++) {
      //string key = to_string(rid) + "-" + to_string(i);
      int64_t key = get_id(rid, i);
      cheng_assert(opmap.find(key) != opmap.end(),
                   "VERIFICATION FAIL! Some op has not been found in OpMap! key:" + key);
    }
  }

  return opmap;
}

//===============Cycle Detection==============

inline OpNode
GenSymbNode(OpNode &op) {
  OpNode symb;
  symb.log = LOG_SYMB;
  symb.rid = op.rid;
  symb.op_num = op.op_num;
  return symb;
}

bool
isCyclicUtil(OpGraph &graph, OpNode &op, tr1::unordered_map<int64_t,bool> &visited, tr1::unordered_map<int64_t,bool> &recStack) {
  stack<OpNode> op_stack;
  op_stack.push(GenSymbNode(op));
  op_stack.push(op);

  while(op_stack.size() > 0) {
    OpNode cur_op = op_stack.top();
    op_stack.pop();

    // if symbol node, remove the id from recStack
    if (cur_op.log == LOG_SYMB) {
      recStack[cur_op.id()] = false;
    } else {
      // normal node
      int op_id = cur_op.id();
      if (!visited[op_id]) {
        visited[op_id] = true;
        recStack[op_id] = true;

        // find the adjacent nodes
        auto adj_ops = graph.OutEdge(cur_op);
        for (OpNode it : adj_ops) {

          // check whether include in current recStack
          if (recStack[it.id()]) {
            // debug information
            cout << "from " << cur_op.id() << " rid:" << cur_op.rid << " op_num:" << cur_op.op_num << "\n";
            cout << "to " << it.id() << " rid:" << it.rid << " op_num:" << it.op_num << "\n";
            for (auto rit : recStack) {
              if (rit.second) {
                cout << rit.first << ",";
              }
            }
            cout << "\n";
            while(op_stack.size() > 0) { 
              auto op = op_stack.top();
              op_stack.pop();
              if (op.log == LOG_SYMB) {
                cout << op.id() << "'[" << recStack[op.id()] << "] <- ";
              } else {
                cout << op.id() << "[" << recStack[op.id()] << "] <- ";
              }
            }
            cout << "\n";
            return true;
          }

          // if visited, skip
          if (visited[it.id()]) continue;
          // push OP SYMBOL first
          op_stack.push(GenSymbNode(it));
          // push real node
          op_stack.push(it);
        }
      }
    }
  }

  return false;
}

void
CycleDetection(OpGraph& graph) {
  tr1::unordered_map<int64_t, bool> visited, recStack;
  
  auto vs = graph.Vertices();
  cout << "Op number: " << vs.size() << "\n";
  for (OpNode op : vs) {
    visited.insert(pair<int64_t,bool>(op.id(), false));
    recStack.insert(pair<int64_t,bool>(op.id(), false));
  }

  for (OpNode op : vs) {
    if (!visited[op.id()] && isCyclicUtil(graph, op, visited, recStack)) {
      cheng_assert(false, "VERIFICATION FAIL! Cycle found!");
    }
  }
}

//======================
// Main logic:
//  Read trace, make pograph
//  Read logs, make OpGraph 
//  Save opmap for later usage (in HHVM-verifier)
//======================
// trace_seq format:
//   [counter],[ip:port],req;...
//   [ip:port],[req_id],resp;...
//======================

int main(int args, char* argv[]) {

  if (args != 7) {
    usage();
    exit(1);
  }

  clock_t start, end;
  double cpu_time_used;

  start = clock();

  string trace_log(argv[1]);
  string sess_log(argv[2]);
  string apc_log(argv[3]);
  string db_log(argv[4]);
  string maxop_log(argv[5]);
  string opmap_log(argv[6]);

  // construct the request vector
  vector<Request> trace;
  // parse the trace log and get a vector of events
  ParseTraceLog(trace_log, trace);
  // pair HTTP req and resp
  // check if every req has a resp and there is no duplication
  PairReqRespAndCheckingCompleteness(trace);

  // Parse MaxOp log
  ParseMaxopLog(maxop_log, max_op);
  // sync the max_op and trace 
  SyncMaxOpAndTrace(trace);

  // This is G in Algorithm
  OpGraph graph;

  // prepare the logs and fill in OpNode into graph
  auto apc_list = ParseOpLog(apc_log, LOG_APC, graph);
  auto sql_list = ParseOpLog(db_log, LOG_DB, graph);
  auto sess_list = ParseOpLog(sess_log, LOG_SESSION, graph);
  //graph.DebugDump();

  AddRealTimeEdges(trace, graph); 
  AddProgramEdges(graph);

  // max_op is a global variable
  auto op_map = CheckLogsAndAddStateEdges(graph, apc_list, sql_list, sess_list);
  DumpOpMap(op_map, opmap_log);

  // do CycleDetection()
  CycleDetection(graph);

  std::cout << "PASS!\n";

  end = clock();
  cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC * 1000;
  cout << "POH running time: " << cpu_time_used << " ms\n";
  // debug dump
  // graph.DebugDump();
}
