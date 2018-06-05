#!/bin/bash
# This script mimics an invocation from https://github.com/google/oss-fuzz

cd $(dirname $0)
export CXX='clang++'
export CXXFLAGS='-fsanitize=address,fuzzer'
export LIB_FUZZING_ENGINE=
make OUT=.
# ./json_fuzzer json_corpus json_seed_corpus -max_len=1024 -max_total_time=10
./msgpack_fuzzer msgpack_corpus msgpack_seed_corpus -max_len=1024
