#!/bin/bash

echo "Hey, Good Morning"

echo "PID of script 1 is: $$"

 #./script2.sh   # this is one way of calling script 2 in script 1. when running this PID are different

 source ./script2.sh # another way. Here we no need to give exeute permissions to script 2 whereas for above we should
