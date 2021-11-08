<<comments
name: Ganesh Prasad R

date: 25/10/2021

description: 
Write a script to print the length of each and every string using arrays

input : ./10_string_length.sh hello hai how are you ?

output: 
Length of string (hello) – 5
Length of string (hai) – 3
Length of string (how) – 3
Length of string (are) – 3
Length of string (you) – 3
Length of string (?)   – 1

comments

#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Error : Please pass the arguments through command-line."
else
    for aString in $@
    do
        echo "Length of string ($aString) is ${#aString}"
    done
fi

