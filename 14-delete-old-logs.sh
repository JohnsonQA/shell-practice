#!/bin/bash

#Delete log files that are older than 14 days

#Navigate to source directory where files are present
#Using find command get all the log files which are older than 14 days
# remove or archive them

START_TIME=$(date +%s)   #will give time in seconds
USER_ID=$(id -u)         #Good to delete files using root user
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIR="/home/ec2-user/app-logs"

mkdir -p $LOG_FOLDER
echo -e "Script executing at: $Y $(date) $N" | tee -a $LOG_FILE

if [ $USER_ID -eq 0 ]
then 
    echo -e "$G Running with root user... $N" | tee -a $LOG_FILE
else
    echo -e "$R Error: Run with root user $N" | tee -a $LOG_FILE
    exit 1
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14) 

while IFS= read -r filepath
do
    echo -e "Deleting the log files: $Y $filepath $N" | tee -a $LOG_FILE
    rm -rf $filepath
done <<<$FILES_TO_DELETE    #To get the lines from command output then we give <<<

END_TIME=$(date +%s) 
TOTAL_TIME=$(($START_TIME - $END_TIME))

echo -e "Logs deleted succesfully. $Y Total Time Taken : $TOTAL_TIME seconds $N" | tee -a $LOG_FILE







