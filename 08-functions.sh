#!/bin/bash

#Use case - Install Mysql, nginx, python3 packages by using function

#check wethere you are running with sudo user

USERID=$(id -u)

if [ $USERID -eq 0 ]   
then
    echo "✅ Running with sudo user..."
else
    echo "❌ Run with sudo user to install packages"
    exit 1
fi

#function to validate package installed succesfully or not

VALIDATE(){

    if [ $1 -eq 0 ]
    then
        echo "✅ $2 installed succesfully..."
    else
        echo "❌ $2 failed to install..."
        exit 1
    fi
}

#Installing Mysql package
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "✅ MySql is not installed. Installing now... "
    dnf install mysql -y
    VALIDATE $? mysql
else
    echo "Mysql already installed. Nothing to do"
fi

#Installing python3 package
dnf list installed python3
if [ $? -ne 0 ]
then
    echo "✅ Python3 is not installed. Installing now... "
    dnf install python3 -y
    VALIDATE $? python3
else
    echo "python3 already installed. Nothing to do"
fi


#Installing nginx package
dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "✅ nginx is not installed. Installing now... "
    dnf install nginx -y
    VALIDATE $? nginx
else
    echo "nginx already installed. Nothing to do"
fi

