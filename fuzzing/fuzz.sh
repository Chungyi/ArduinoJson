#!/bin/bash
# This script mimics an invocation from https://github.com/google/oss-fuzz

cd $(dirname $0)
export CXX='clang++'
export CXXFLAGS='-fsanitize-coverage=trace-pc-guard -fsanitize=address,fuzzer'
export LIB_FUZZING_ENGINE=
make OUT=.
./json_fuzzer my_json_corpus json_corpus -max_len=1024 -timeout=10
