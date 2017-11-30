.PHONY: all odiff

all:
	cd sess_check; make
	cd sql_check; make
	make odiff

odiff: odiff.cpp
	g++ --std=c++11 -g -o odiff odiff.cpp
