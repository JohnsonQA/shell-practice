#!/bin/bash

#Conditions - If else elif 
#operators in shell -gt, -lt, -eq, -ne are greater, lesser, equal, not equal

NUMBER=$1
CONSTNUM=0
NUMCHECK=$(($CONSTNUM+$NUMBER))

if [ $# -gt 1 ]
then
    echo "Pass only one arg"
    exit 1
fi

if [ $NUMCHECK -lt 0 ]
then
    echo "Given number is negative number"
else
    echo "Given number is positive number"
fi

