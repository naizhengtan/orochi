#include "graph.h"

// FIXME: can have duplicated edges!
// SOLUTION: disallow parrallel edges
void
OpGraph::AddEdge(OpNode op1, OpNode op2) {
  // add the edge to the graph
  add_edge(op1.descriptor, op2.descriptor, m_opmap);
}

OpNode
OpGraph::GetOpNodeIfNonFail(int64_t rid, int num) {
  auto id = get_id(rid, num);
  cheng_assert(all_nodes.find(id) != all_nodes.end(), "FATAL ERROR! GetOpNode fail! rid=["+\
               std::to_string(rid) + "], opnum=[" + std::to_string(num) + "]\n");
  return all_nodes[id];
}

OpNode
OpGraph::GetOpNodeIfNonCreate(int64_t rid, int num) {
  auto id = get_id(rid, num);
  if (all_nodes.find(id) == all_nodes.end()) {
    return OpNode();
  }
  return all_nodes[id];
}

OpNode
OpGraph::CreateOpNode(int id, int num, LOG_TYPE log_type,
                      int64_t seq_num, OP_TYPE op_type, string content) {

  Vertex v_des = add_vertex(m_opmap);
  OpNode op(id, num, log_type, seq_num, op_type, content, v_des);

  if (all_nodes.find(op.id()) != all_nodes.end()) {
    std::cout << "Warning: want to create a existing node: id=" << op.toString() << "\n";
    std::cout << "         Previous op is: " << all_nodes[op.id()].toString() << "\n";
  }
  cheng_assert(all_nodes.find(op.id()) == all_nodes.end(), "VERIFICATION FAIL! DUPLICATED OP NODE!");

  // insert this node into the graph
  all_nodes.insert(std::pair<int64_t, OpNode>(op.id(), op));
  descriptor2opid.insert(std::pair<Vertex,int64_t>(op.descriptor, op.id()));
  return op;
}

std::vector<OpNode>
OpGraph::Vertices() {
  std::vector<OpNode> ret;

  Vertex_iter it, it_end;
  for (boost::tie(it, it_end) = vertices(m_opmap); it != it_end; it++) {
    auto opid = descriptor2opid[*it]; // get the OpNode 
    ret.push_back(all_nodes[opid]);
  }

  return ret;
}

std::vector<OpEdge>
OpGraph::Edges() {
  std::vector<OpEdge> ret;

  Edge_iter it, it_end;
  for (boost::tie(it, it_end) = edges(m_opmap); it != it_end; it++) {
    auto src_op_id = descriptor2opid[source(*it, m_opmap)]; // get the src node
    auto dst_op_id = descriptor2opid[target(*it, m_opmap)]; // get the dst node 
    ret.push_back(OpEdge(all_nodes[src_op_id], all_nodes[dst_op_id]));
  }

  return ret;
}

std::vector<OpNode> 
OpGraph::InEdge(OpNode op) {
  std::vector<OpNode> ret;

  // WTF is this???
  typedef boost::graph_traits<Graph> GraphTraits;
  typename GraphTraits::in_edge_iterator it, it_end;

  for (boost::tie(it, it_end) = in_edges(op.descriptor, m_opmap); it != it_end; it++) {
    auto src_op_id = descriptor2opid[source(*it, m_opmap)];
    ret.push_back(all_nodes[src_op_id]);
  }

  return ret;
}

std::vector<OpNode> 
OpGraph::OutEdge(OpNode op) {
  std::vector<OpNode> ret;

  // WTF is this???
  typedef boost::graph_traits<Graph> GraphTraits;
  typename GraphTraits::out_edge_iterator it, it_end;

  for (boost::tie(it, it_end) = out_edges(op.descriptor, m_opmap); it != it_end; it++) {
    auto dst_op_id = descriptor2opid[target(*it, m_opmap)];
    ret.push_back(all_nodes[dst_op_id]);
  }

  return ret;
}

//===========================
//=======Debug===============
//===========================

void
OpGraph::DebugDump() {
  std::vector<OpNode> vs = Vertices();
  std::cout << "======Vertices========\n";
  for ( OpNode it : vs ) {
    std::cout << "Node: " << it.id() << "\n";
  }
  std::cout << "======================\n\n";
  std::vector<OpEdge> es = Edges();
  std::cout << "======Edges========\n";
  for ( auto it : es ) {
    std::cout << "edge: " << it.first.id() << " -> " << it.second.id() << "\n";
  }
  std::cout << "======================\n";
}

void cheng_backtrace_dump(void)
{
  int j, nptrs;
#define SIZE 100
  void *buffer[100];
  char **strings;

  nptrs = backtrace(buffer, SIZE);
  printf("=======BACKTRACE===========\n");
  printf("backtrace() returned %d addresses\n", nptrs);

  /* The call backtrace_symbols_fd(buffer, nptrs, STDOUT_FILENO)
     would produce similar output to the following: */

  strings = backtrace_symbols(buffer, nptrs);
  if (strings == NULL) {
    perror("backtrace_symbols");
    exit(EXIT_FAILURE);
  }

  for (j = 0; j < nptrs; j++)
    printf("%s\n", strings[j]);
  printf("===========================\n");

  free(strings);
}
