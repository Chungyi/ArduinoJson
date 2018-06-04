# CAUTION: this file is invoked by https://github.com/google/oss-fuzz

CXXFLAGS += -I../src

all: \
	$(OUT)/json_fuzzer \
	$(OUT)/json_fuzzer_seed_corpus.zip \
	$(OUT)/json_fuzzer.options

$(OUT)/json_fuzzer: json_fuzzer.cpp $(shell find ../src -type f)
	$(CXX) $(CXXFLAGS) $< -o$@ $(LIB_FUZZING_ENGINE)

$(OUT)/json_fuzzer_seed_corpus.zip: json_corpus/*
	zip -j $@ $?

$(OUT)/json_fuzzer.options:
	@echo "[libfuzzer]" > $@
	@echo "max_len = 256" >> $@
	@echo "timeout = 10" >> $@
