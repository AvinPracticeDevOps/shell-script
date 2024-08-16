#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo "$0" | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R you are not super user, please access with super user $N"
    exit 1
else
    echo -e "$G you are super user $N"
fi

check_exit(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2... is FAILED $N"
        exit 1
    else
        echo -e "$G $2... is SUCCESS $N"
    fi
}

for i in $@
do
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "$G $i is installed $N...$Y skipping it $N"
    else
        dnf install $i -y &>>$LOGFILE
        check_exit $? "Installing $i"
    fi
done