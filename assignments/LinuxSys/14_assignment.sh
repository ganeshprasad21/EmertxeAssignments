<<comments
name: Ganesh Prasad R

date: 6/11/2021

description: 
Write a script to rename a file/directory replaced by lower/upper case letters.

input : 

output: 
Files are rename in lowercase and directories are renamed in upper case

comments

#!/bin/bash


if [ $# -eq 1 ] #valid number of arguments
then
    if [ -d $1 ]                                #if its a valid directory (path)
    then

        cd $1                                   #jump to the path
        echo "Files are rename in lowercase and directories are renamed in upper case"

        for fileOrDirectory in *
        do
            if [ -f $fileOrDirectory ] #if its file
            then
                newname=`echo $fileOrDirectory | tr [:upper:] [:lower:]`
                mv $fileOrDirectory $newname  #rename files into lower case
            elif [ -d $fileOrDirectory ] #if its directory
            then
                newname=`echo $fileOrDirectory | tr [:lower:] [:upper:]`
                mv $fileOrDirectory $newname #rename directories into upper case
            fi 
        done
    else #invalid directory path specified
        echo "enter a valid dir path"
    fi

else #0 or more than 1 arguments passed
    echo "please give 1 cla and that should be valid directory path... "
fi
