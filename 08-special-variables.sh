#!/bin/bash

echo "All varibales: $@"
echo "Number of variables passed: $#"
echo "Current script name: $0"
echo "Hostname: $HOSTNAME"
echo "present working directory: $PWD"
echo "Home directory: $HOME"
echo "PID of current shell script: $$"
sleep 20 &
echo "PID of last background command: $!"