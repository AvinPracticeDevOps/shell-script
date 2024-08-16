#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs | awk -F " " 'print $NF' | cut -d "%" -f1)
THRESHOLD=10

FOLDER=$(df -hT | grep xfs | awk -F " " '{print $NF}')

while IFS= read -r line
do
    echo "$FOLDER disk usage is : $line and threshold is: $THRESHOLD"
done <<< $DISK_USAGE

