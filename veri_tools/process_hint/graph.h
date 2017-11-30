#ifndef GRAPH_H
#define GRAPH_H

#include "stdlib.h"
#include "vector"
#include "boost/graph/adjacency_list.hpp"
#include "boost/graph/graph_traits.hpp"
#include "sstream"
#include "map"
#include <tr1/unordered_map>
#include "unordered_map"

#include <execinfo.h>
#include <unistd.h>

using namespace std;

#define MAX_INT32_NUM 0x7fffffff
// FIXME: this is the max op can ever apear in one request
// JBL: Why not use MAX_INT32?
#define MAX_OP_NUM 999998 
#define REQUEST_START_OP_NUM 0 
#define REQUEST_END_OP_NUM MAX_OP_NUM

#define cheng_assert(cond,msg) \
  do {\
    if (!(cond)) {\
      cout << "Error in "<<__FUNCTION__<<":"<<__LINE__<<"   " << msg << endl;\
      cheng_backtrace_dump();\
      exit(1);\
    }\
  } while(0)

/*request_start is 0, request_end is MAX_OP_NUM*/
#define get_id(rid, opnum) \
   ((rid) * (MAX_OP_NUM+2) + (opnum))

typedef pair<int,int> RidOpnum;

void cheng_backtrace_dump();

//======Parsing================
enum LOG_TYPE {
  LOG_NONE, LOG_SYMB,
  META, LOG_DB, LOG_APC, LOG_SESSION
};

enum OP_TYPE {
  TYPE_NONE,
  META_START, META_END,
  REGISTER_READ, REGISTER_WRITE,
  KV_GET, KV_SET, KV_DEL,
  SQL_READ, SQL_WRITE, SQL_TXN
};

// this is for trace parsing
typedef struct {
  bool isReq;
  string mapping_id; // ip:port 
  int64_t rid;
} Request;

//======Data Structure=========

// short name for graph data structure
class OpNode;
typedef boost::adjacency_list<boost::vecS, boost::vecS, boost::bidirectionalS/*directedS*/> Graph;
typedef boost::graph_traits<Graph>::vertex_descriptor Vertex;
typedef boost::property_map<Graph, boost::vertex_index_t>::type IndexMap;
typedef boost::graph_traits<Graph>::vertex_iterator Vertex_iter;
typedef boost::graph_traits<Graph>::edge_iterator Edge_iter;
typedef pair<OpNode, OpNode> OpEdge;

class OpNode {
public:
  int64_t rid;
  int op_num; // in request
  LOG_TYPE log;
  int64_t seqNum; // in log
  OP_TYPE opType;
  string opContent;
  // link to the graph, this will be filled in later
  Vertex descriptor; 

public:
  OpNode() {}

private:
  OpNode(int64_t id, int num, LOG_TYPE log_type, int64_t seq_num, OP_TYPE op_type, string content, Vertex v) :
    rid(id), op_num(num), log(log_type), seqNum(seq_num), opType(op_type), opContent(content), descriptor(v) {}

public:
  inline int64_t id() {
    return get_id(rid, op_num); 
  }

  inline bool operator==(const OpNode& rhs) {
    return (this->rid == rhs.rid) &&
           (this->op_num == rhs.op_num) &&
           (this->log == rhs.log) &&
           (this->opType == rhs.opType) &&
           (this->seqNum == rhs.seqNum) &&
           (this->opContent == rhs.opContent) &&
           (this->descriptor == rhs.descriptor);
  }

  inline string toString() {
    stringstream ss;
    ss << "rid[" << rid << "], opnum[" << op_num << "], LogType=" << log
      << ", OpType=" << opType << ", seqNum=" << seqNum << "\nOpContent="
      << opContent << "\n";
    return ss.str();
  }

  friend class OpGraph;
};

// JBL: It's good to use a strategy for identifying the namespace of variables,
// e.g., prefixing member variables with _/m_ or postfixing them with _
// You do that for the opmap, but nothing else...
class OpGraph {
  // the main graph
  Graph m_opmap;

  // mapping from the id to node
  tr1::unordered_map<int64_t, OpNode> all_nodes;

  // mapping from descriptor to OpNode
  tr1::unordered_map<Vertex, int64_t> descriptor2opid;

public:
  // Nodes related
  // If rid or opnum doesn't exist, return NULL
  OpNode GetOpNodeIfNonFail(int64_t rid, int opnum);
  // If rid or opnum doesn't exist, return NULL
  OpNode GetOpNodeIfNonCreate(int64_t rid, int opnum);
  // create one OpNode
  OpNode CreateOpNode(int id, int num, LOG_TYPE log_type, int64_t seq_num, OP_TYPE op_type, string content);

  void AddEdge(OpNode op1, OpNode op2);

  vector<OpNode> Vertices();
  vector<OpEdge> Edges();
  vector<OpNode> InEdge(OpNode op);
  vector<OpNode> OutEdge(OpNode op);

  void DebugDump();
};

#endif // GRAPH_H
