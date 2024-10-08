#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "you are not super user, please access with super user"
    exit 1
else
    echo "you are super user"
fi

check_exit(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is FAILED"
        exit 1
    else
        echo "$2 is SUCCESS"
    fi
}

dnf install git -y
check_exit $? "Installing git"

dnf install mysqll -y
check_exit $? "Installing mysql"

echo "Is script proceeding..!"