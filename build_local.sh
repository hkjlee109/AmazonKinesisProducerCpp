#! /bin/sh

CFLAGS="-fPIC" \
CXXFLAGS="-fPIC" \
cmake -S . -B build/local && cmake --build build/local
