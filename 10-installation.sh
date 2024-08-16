#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    "you are not super user, please access with super user access priviliges"
else
    "you are super user"
fi

dnf install mysqll -y

echo "Is script proceeding"