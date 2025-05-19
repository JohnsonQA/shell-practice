#!/bin/bash

#Use case - Install Mysql, nginx, python3 packages by using function and loop
#Redirect the output into logs folder
#Display only information on the console


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
M="\e[35m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)       #It will split the scriptName and gives only 10-logs which is field 1
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("Mysql" "python3" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo -e "$M Script executing at : $N $(date)"  | tee -a $LOG_FILE

if [ $USERID -eq 0 ]   
then
    echo -e "$M Running with sudo user... $N" | tee -a $LOG_FILE
else
    echo -e "$R Run with sudo user to install packages $N" | tee -a $LOG_FILE
    exit 1
fi

#function to validate package installed succesfully or not
VALIDATE(){

    if [ $1 -eq 0 ]
    then
        echo -e "$G $2 installed succesfully... $N" | tee -a $LOG_FILE
    else
        echo -e "$R $2 failed to install... $N" | tee -a $LOG_FILE
        exit 1
    fi
}

#Installing packages using loop
for package in ${PACKAGES[@]}
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$Y $package is not installed. Installing now... $N" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$Y $package already installed. Nothing to do $N" | tee -a $LOG_FILE
    fi
done
