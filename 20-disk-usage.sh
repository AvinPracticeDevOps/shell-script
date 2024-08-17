#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=6
MESSAGE=""

while IFS= read -r line
do 
    USAGE=$(echo "$line" | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo "$line" | awk -F " " '{print $NF}')

    if [ $USAGE -gt $DISK_THRESHOLD ]
    then
        MESSAGE+="$FOLDER is more usage than $DISK_THRESHOLD, current usage is: $USAGE"
    fi
done <<< $DISK_USAGE

echo "$MESSAGE"