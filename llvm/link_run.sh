#!/bin/bash
llvm-link $1.ll lib.ll -S -o $1_run.ll
lli $1_run.ll
