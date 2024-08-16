#!/bin/bash

NAME=Avinash

echo "Before calling script-2 Name: $NAME"
echo "PID of script-1: $$"
echo "------------------------------------"
#1st way
./16-script-2.sh

#2nd way
# source ./16-script-2.sh

echo "------------------------------------"
echo "After calling script-2 Name: $NAME"