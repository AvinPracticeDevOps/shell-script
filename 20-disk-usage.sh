#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=6
MESSAGE="" #creating empty variable to send mail

while IFS= read -r line
do 
    USAGE=$(echo "$line" | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo "$line" | awk -F " " '{print $NF}')

    if [ $USAGE -gt $DISK_THRESHOLD ]
    then
        MESSAGE+="$FOLDER is more usage than $DISK_THRESHOLD, current usage is: $USAGE \n"
    fi
done <<< $DISK_USAGE

echo -e "$MESSAGE"