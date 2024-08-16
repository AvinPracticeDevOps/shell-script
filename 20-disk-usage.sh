#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=6
MESSAGE=""

# FOLDER=$(df -hT | grep xfs | awk -F " " '{print $NF}')

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    
    if [ $USAGE -gt $THRESHOLD ]
    then
        MESSAGE+="$FOLDER is more than $THRESHOLD, current usage is: $USAGE \n"
    fi
done <<< $DISK_USAGE

echo "Message: $MESSAGE"
