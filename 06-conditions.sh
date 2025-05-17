#!/bin/bash

#Conditions - If else elif 
#operators in shell -gt, -lt, -eq, -ne are greater, lesser, equal, not equal

NUMBER=$1

if [ $NUMBER -lt 10 ]
then
    echo "Given number is lesser than 10"
else
    echo "Given number is greater than 10"
fi


