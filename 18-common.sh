#!bin/bash

set -e

Error_Handler(){
    echo "Error_LineNo: $1"
    echo "Error_Description: $2"   
}

trap 'Error_Handler '${LINENUMBER}' "$BASH_COMMAND"'ERR

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
    echo -e "$R you are not super user, please access with root user $N"
    exit 1
else
    echo -e "$R you are super user $N"
fi

check_exit(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2.....is FAILED $N"
        exit 1
    else
        echo -e "$Y $2.....is SUCCESS $N"
    fi
}