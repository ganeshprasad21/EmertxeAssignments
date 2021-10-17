<<comments
name: Ganesh Prasad R
date: 17/10/2021
description: 
Write a script for addition of two numbers for real numbers also

input : Enter the numbers to addition
    10  20
output: 
Answer is 30

comments


#!/bin/bash
function checkIfRealNumber()
{
    if [[ $1 =~ ^[0-9]*[.]?[0-9]*$ ]]
    then
        echo "real"
    else
        echo "notReal"
    fi 
}

read -p "$'Enter the numbers to addition \n'" number1 number2
if [ "real" = `checkIfRealNumber $number1` -a "real" = `checkIfRealNumber $number2` ]
then
    echo $(echo "$number1 + $number2" | bc)
else
    echo "Error : Please enter only integers or real numbers"
fi

