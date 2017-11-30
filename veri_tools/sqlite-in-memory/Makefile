CC = gcc
CFLAGS = -Wall -O2 -g `mysql_config --cflags` -I. -DSQLITE_THREADSAFE=0 -DSQLITE_OMIT_LOAD_EXTENSION #-DDUMP_REWRITE_LOG
LIBS = -lstdc++ -lboost_regex `mysql_config --libs`
DEPS = sqlite3.h init_query.h common.h

all: sqlite_ttdb_build check

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

%.o: %.cc $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

sqlite_ttdb_build: main.o sqlite3.o common.o
	$(CC) -o $@ $^ $(LIBS)

check: check.o common.o
	$(CC) -o $@ $^ $(LIBS)

.PHONY: clean

clean:
	rm -rf *.o
	rm -rf sqlite_ttdb_build check

