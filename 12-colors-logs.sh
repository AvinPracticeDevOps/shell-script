#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$RED you are not super, please access with super user $N"
    exit 1
else
    echo -e " $GREEN you are super user $N"
fi

check_exit(){
    if [ $1 -ne 0 ]
    then
        echo -e "$RED $2... is FAILED $N"
        exit 1
    else
        echo -e "$GREEN $2... is SUCCESS $N"
}

dnf install git -y &>>$LOGFILE
check_exit $? "Installing git"

dnf install mysqll -y &>>$LOGFILE
check_exit $? "Installing mysql"

echo "end of scripting"