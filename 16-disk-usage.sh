#!/bin/bash

#Get the disk utilization of a mounted files and send an automated email to the user

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 #Usually in companies will have 75%


while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7F}')
    echo "$PARTITION: $USAGE"
done <<< "$DISK_USAGE"