main: main.cpp
	g++ -O2 --std=c++11 -rdynamic -o hintprocess main.cpp graph.cpp

perf: main.cpp
	g++ -pg -O2 --std=c++11 -rdynamic -o hintprocess main.cpp graph.cpp

gperf: main.cpp
	g++ -O2 --std=c++11 -ltcmalloc -lprofiler -o hintprocess main.cpp graph.cpp
