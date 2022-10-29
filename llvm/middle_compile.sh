#!/bin/bash
echo "Input the C-code name."
sudo clang -S -emit-llvm $1.c -o $1_tmp.ll -O0
llvm-link $1_tmp.ll lib.ll -S -o $1.ll

