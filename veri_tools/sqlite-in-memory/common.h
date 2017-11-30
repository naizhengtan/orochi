#include <string>
#include <vector>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

bool read_query(FILE* fp, char*& buf, unsigned& size);
bool skip_query(std::string& query);
std::string remove_comments(std::string& query);
std::string extract_table_name(const std::string& query);
void split_query(char* buf, std::vector<std::string>& queries);
