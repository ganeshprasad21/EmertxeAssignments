<<comments
name: Ganesh Prasad R

date: 25/10/2021

description: 
Write a script to delete empty lines from a file


input : ./07_delete_empty_lines.sh file.txt

output: 
Empty lines are deleted

comments

#!/bin/bash

if [ $# -ge 1 ] #check if file is passed any thing after 1st command ine arg is ignored
then
    if [ -e $1 ] #check if file exists
    then
        if [ -s $1 ] #check if its not empty
        then
            sed -i '/^[[:space:]]*$/d' $1
            echo "Empty lines are deleted."
        else
            echo "Empty file passed"
        fi
    else
        echo "File does not exist"
    fi
else
    echo "Error: Please pass the file name through command line."
fi