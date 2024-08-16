#!/bin/bash

NAMES=("Avinash" "Kumar" "Bandela")

echo "FirstName is: ${NAMES[0]} "
echo "MiddleName is: ${NAMES[1]}"
echo "LastName is: ${NAMES[2]}"
echo "Full name is: ${NAMES[@]}"