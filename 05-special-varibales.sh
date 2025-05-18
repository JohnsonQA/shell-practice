#!/bin/bash


echo "The file name of the script: $0"
echo "Arguments size passed to a script: $#"
echo "All varibales passed to the script: $@"
echo "All varibale passed in double quotes: $*"
echo "Present working Directory: $PWD"
echo "Present Home Directory: $HOME"
echo "Present user who running the script: $USER"
echo "PID of current script: $$"
sleep 10 &
echo "Previous exit status: $?"
echo "PID of last command running in the background: $!"
