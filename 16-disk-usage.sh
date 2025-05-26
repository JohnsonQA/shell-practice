#!/bin/bash

#Get the disk utilization of a mounted files and send an automated email to the user

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 #usually in projects we use 75%
MSG=""


while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F}' | cut -d "%" -f1) 
    PARTITION=$(echo $line | awk '{print $7F}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="High Disk usage of $PARTITION: $USAGE \n"      #+ concats the previous output with new output and \n and -e works as new line and prints out 
    fi
done <<< $DISK_USAGE

echo -e $MSG