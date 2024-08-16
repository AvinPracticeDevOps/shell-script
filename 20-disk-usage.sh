#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD=10

# FOLDER=$(df -hT | grep xfs | awk -F " " '{print $NF}')

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(df -hT | grep xfs | awk -F " " '{print $NF}')
    
    if [ $USAGE -gt $THRESHOLD ]
    then
        echo "$FOLDER is more than $THRESHOLD, current usage is: $USAGE \n"
    fi
done <<< $DISK_USAGE

