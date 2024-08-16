#!/bin/bash

SOURCE_DIR=/tmp/logs

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

while IFS= read -r line
do
    echo "$line"
done <<<$FILES