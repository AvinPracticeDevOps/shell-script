#!/bin/bash

SOURCE_DIR=/tmp/logs

R="\e[31m"
G="\e[32m"

if [ -d $SOURCE_DIR ]
then
    echo -e "$G $SOURCE_DIR is exists $N"
else
    echo -e "$R $SOURCE_DIR is not there $N"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

while IFS= read -r line
do
    echo "Deleting this file: $line"
    rm -rf $line
done <<< $FILES