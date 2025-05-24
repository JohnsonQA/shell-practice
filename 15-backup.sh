#!/bin/bash

#Real-Time Use-case: Find the 14 days older files and zip it then move to destination directory

#Script Test Scenarios:
#Check sourec and destination dir are present or not
#If present, find the files from source and zip them
#Then move it to destination
#Then remove the files from source dir


SOURCE_DIR=$1  #passing it as runtime arguments
DEST_DIR=$2
DAYS=${3:-14}  #syntax to pass 3rd argument as optional. If not pass default value is 14
START_TIME=$(date +%s)   #will give time in seconds
USER_ID=$(id -u)         #Good to delete files using root user
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER="/var/log/backup-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER
echo -e "Script executing at: $Y $(date) $N" | tee -a $LOG_FILE

if [ $USER_ID -eq 0 ]
then 
    echo -e "$G Running with root user... $N" | tee -a $LOG_FILE
else
    echo -e "$R Error: Run with root user $N" | tee -a $LOG_FILE
    exit 1
fi

USAGE(){
    echo -e "$R USAGE :: $N sh 15-backup.sh <source_dir> <dest_dir> <days(optional)>"
    exit 1
}
#Passing 2 args as mandatory. If not passed throw an error
if [ $# -lt 2 ]
then
    USAGE
fi

#Check Source and dest directories are exists or not
if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R Source Dir $SOURCE_DIR doesn't exists $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo -e "$R Destination Dir $DEST_DIR doesn't exists $N"
    exit 1
fi

#Find files in the source directory
FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

#Check files are present or empty
if [ ! -z "$FILES" ]   #-n not empty -z empty. can use anything
then
    echo "Files found to zip are: $FILES"
else
    echo -e "No files found. $Y SKIPPING $N"
fi
