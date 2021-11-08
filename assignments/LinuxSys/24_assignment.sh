<<comments
name: Ganesh Prasad R

date: 5/11/2021

description: 
Use pipes or redirection to create an infinite feedback loop.

input : ./24_redirection.sh

output: 
Before loop file contents
Hai hello
After loop file contents
Hai hello
Hai hello
Hai hello
Hai hello
Hai hello
Hai hello
Hai hello
.
.
.

comments

#!/bin/bash
if [ $# -eq 1 ]  #correct number of cla given
then
    fileName=$1
    if [ -f $fileName ] #if file exists
    then
        if [ -s $fileName ]  #if file is not empty
        then
            tail -f $fileName >> $fileName | tail -f $fileName #feedback loop step
        else #if file is empty
            echo "empty file please put some content before running the script"
            fi
    else
        echo "the given file appears to be inexistent"
    fi
elif [ $# -eq 0 ] #0 arguments given
then
    echo "please send 1 argument and that argument should be a file name"
else #more than 1 arguments given
    echo "invalid number of arguments [:only one supported:]"
fi