#!/bin/bash

SOURCE_DIR=/tmp/logs/


while IFS= read -r line
do
    echo "$line"
done <<<$SOURCE_DIR