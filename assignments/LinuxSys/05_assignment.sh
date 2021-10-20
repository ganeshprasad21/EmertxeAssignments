<<comments
name: Ganesh Prasad R

date: 18/10/2021

description: 
Write a script to compare larger integer values from a 'n' number of arguments


input : ./05_largest.sh 6 8 4 2 1

output: 
Largest value is 8

comments

#!/bin/bash

function findLargest()
{
    largest=$1
    for num in $@
    do
        if [ $num -gt $largest ]
        then
            ((largest=$num))
        fi
    done
    echo "$largest"
}

if [ $# -eq 0 ]
then
    echo "Error: No arguments passed"
elif [ $# -eq 1 ]
then
    echo "Largest value is $1 "
else
    largest=$1
    for num in $@
    do
        if [ $num -gt $largest ]
        then
            ((largest=$num))
        fi
    done
    echo "Largest value is $largest"
fi