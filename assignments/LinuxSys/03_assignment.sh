<<comments
name: Ganesh Prasad R

date: 18/10/2021

description: 
Write a script for addition of two numbers for real numbers also

input : ./03_assignment.sh
Enter the numbers to addition
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

echo "Enter the numbers to addition"
read number1 number2

if [ `checkIfRealNumber $number1` = "real" -a `checkIfRealNumber $number2` = "real" ]
then
    echo "Answer is $(echo "$number1 + $number2" | bc)"
else
    echo "Error : Please enter only integers or real numbers"
fi

