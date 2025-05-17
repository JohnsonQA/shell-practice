#!/bin/bash
#userId - id -u or sudo id -u

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR: Run the script with root access"
    exit 1 #exit status other than 0 is a failure
else
    echo "Running with root access..."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL not installed. Going to install..."
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "MYSQL installed Sucessfully..."
    else
        echo "MYSQL installation Failed"
        exit 1
else
    echo "MYSQL already installed... Nothing to do"
fi