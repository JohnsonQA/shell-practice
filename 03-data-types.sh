#!/bin/bash

TIMESTAMP=$(date)   #Get the output of date and store it in Timestamp. 
NUMBER1=100
NUMBER2=300

SUM=$(($NUMBER1+$NUMBER2))
echo "Sum of $NUMBER1 and $NUMBER2 is: $SUM"
echo "Script executed at: $TIMESTAMP"
