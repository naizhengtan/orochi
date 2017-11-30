#!/bin/bash

(
rm /tmp/wiki_debug.log;
./workload_gen.sh;
cp /tmp/wiki_debug.log /tmp/record_wiki_debug.log;

rm /tmp/wiki_debug.log;
cd ../verification/;
./verify.sh single wiki 1 non-skip;
cp /tmp/wiki_debug.log /tmp/replay_wiki_debug.log;
)
