#!/bin/bash

#Get the disk utilization of a mounted files and send an automated email to the user

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 #usually in projects we use 75%
MSG=""


while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F}' | cut -d "%" -f1)  #it will read line by line and gives the utilization number
    PARTITION=$(echo $line | awk '{print $7F}')

    if [ $DISK_USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="High Disk usage of $PARTITION: $USAGE \n"      #Since loop resets the everyline + will concantenate all lines. In shell \n and -e uses separte them in lines
    fi
done <<< $DISK_USAGE

echo -e $MSG