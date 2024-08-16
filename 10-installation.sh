#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "you are not super user, please access with super user access priviliges"
else
    echo "you are super user"
fi

dnf install git -y
if [ $? -ne 0 ]
then
    echo "Installation is FAILED"
    exit 1
else
    echo "Installation is SUCCESS"
fi

dnf install mysqll -y
if [ $? -ne 0 ]
then
    echo "Installation is FAILED"
    exit 1
else
    echo "Installation is SUCCESS"
fi

echo "Is script proceeding"