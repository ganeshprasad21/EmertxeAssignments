<<comments
name: Ganesh Prasad R

date: 18/10/2021

description: 
Read 'n' and generate a pattern given below
1
1 2
1 2 3
1 2 3 4

input : bash 01_assignment.sh
Enter the number : 4

output: 
1
1 2
1 2 3
1 2 3 4

comments

#!/bin/bash

if [ $# -eq 1 ]  #valid case
then
    if [ -e $1 ] #check if file exists
    then
        if [ -s $1 ] #check if its not empty
        then
            totalLineInAFile=`wc -l $1 | cut -d ' ' -f1` #to get how many lines the given file has
            if [ $totalLineInAFile -ge 5 ] #if file has >= 5 lines then this runs
            then
                head -5 $1 | tail -1 #5th line only
            else
                echo "Error : $1 is having only $totalLineInAFile line(s). So can’t print the 5 th line."
            fi
        else
            echo "Error : No contents inside file"
        fi
    else
        echo "Error : file does not exist"
    fi
elif [ $# -eq 0 ] #0 clas passed
then
    echo "Error : Please pass the file name through command line"
else #more than 1
    echo "invalid number of cla-s please just give file name"
fi
