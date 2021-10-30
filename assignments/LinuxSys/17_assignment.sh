<<comments
name: Ganesh Prasad R

date: 30/10/2021

description: 
Write script to print contents of file from given line number to next given
number of lines.

input : ./17_print_lines.sh 5 3 myfile.txt

output: 
line number 5
line number 6
line number 7

comments

#!/bin/bash

if [ $# -eq 3 ] #valid case
then
    if [ -e $3 ] #check if file exists
    then
        if [ -s $3 ] #check if its not empty
        then
            totalLineInAFile=`wc -l $3 | cut -d ' ' -f1` #to get how many lines the given file has
            totalLineForHead=`echo "$1 + $2 - 1" | bc` #to get count for head command
            if [ $totalLineInAFile -gt $totalLineForHead ]
            then
                head -$totalLineForHead $3 | tail -$2 #display required lines
            else
                echo "Error: $3 is having only $totalLineInAFile lines, file should have atleast $totalLineForHead lines. " 
            fi
        else
            echo "Empty file passed"
        fi
    else
        echo "File does not exist"
    fi
else #the cla is not correct
    echo "Error: arguments missing! or in excess"
    echo "Usage: ./file_filter.sh start_line upto_line file_name"
    echo "For eg. ./20_file_filter.sh 5 5 <file_name>"
fi
