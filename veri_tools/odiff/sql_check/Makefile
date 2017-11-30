.PHONY: check_sql 

check_sql: check_sql.cpp
	g++ --std=c++11 -O2 -g -o check_sql check_sql.cpp

perf: check_sql.cpp
	g++ -std=c++11 -pg -o check_sql check_sql.cpp
