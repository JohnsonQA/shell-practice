#!/bin/bash

#Use case - Install Mysql, nginx, python3 packages by using function

#check wethere you are running with sudo user

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -eq 0 ]   
then
    echo "Running with sudo user..."
else
    echo -e "$R Run with sudo user to install packages $N"
    exit 1
fi

#function to validate package installed succesfully or not

VALIDATE(){

    if [ $1 -eq 0 ]
    then
        echo -e "$G $2 installed succesfully... $N"
    else
        echo -e "$R $2 failed to install... $N"
        exit 1
    fi
}

#Installing Mysql package
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySql is not installed. Installing now... "
    dnf install mysql -y
    VALIDATE $? mysql
else
    echo -e "$Y Mysql already installed. Nothing to do $N"
fi

#Installing python3 package
dnf list installed python3
if [ $? -ne 0 ]
then
    echo "Python3 is not installed. Installing now... "
    dnf install python3 -y
    VALIDATE $? python3
else
    echo -e "$Y python3 already installed. Nothing to do $N"
fi


#Installing nginx package
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed. Installing now... "
    dnf install nginx -y
    VALIDATE $? nginx
else
    echo -e "$Y nginx already installed. Nothing to do $N"
fi

