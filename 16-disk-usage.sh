#!/bin/bash

#Get the disk utilization of a mounted files and send an automated email to the user

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 #usually in projects we use 75%
MSG=""
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)  #It will provide the current IP address of the running server

while IFS= read line
do
    USAGE=$(echo $line | awk '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk '{print $7F}')  /dev 
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="High Disk usage of $PARTITION: $USAGE % <br>"   #HTML br to break the line   #+ concats the previous output with new output and \n and -e works as new line and prints out 
    fi
done <<< $DISK_USAGE

#echo -e $MSG
sh mail.sh "DevOps Team" "High Disk Usage" "$IP_ADDRESS" "$MSG" "Johnson.john3939@gmail.com" "Alert - High Disk Usage" 