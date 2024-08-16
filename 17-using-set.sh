#!/bin/bash

source ./18-common.sh

# check_exit

dnf install git -y &>>$LOGFILE

dnf install mysqll -y &>>LOGFILE

echo "Is script proceeding..!"