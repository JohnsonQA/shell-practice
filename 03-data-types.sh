#!/bin/bash

#In shell, no need to declare the data type explicitly. As per its intelligence it automatically converts it to specific type.
#Ex: Num1=John Num2=300 Sum=$(($NUM1+$NUM2)) then in NUM1 it takes as 0 and add it and gives the result as 300

TIMESTAMP=$(date)   #Get the output of date and store it in Timestamp. 
NUMBER1=100
NUMBER2=300

SUM=$(($NUMBER1+$NUMBER2))  #() performs an action on any operators. Here addition. (()) outer braces which stores the output and pass it to $ so that output prints
echo "Sum of $NUMBER1 and $NUMBER2 is: $SUM"
echo "Script executed at: $TIMESTAMP"



