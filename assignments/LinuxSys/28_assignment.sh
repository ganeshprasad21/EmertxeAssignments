<<comments
name: Ganesh Prasad R

date: 8/11/2021

description: 
Write a script to locks down file permissions for a particular directory

input : ./28_lock_permissions.sh Dir/

output: 
Before locking
total 0
-rw-rw-r-- 1 biju biju 0 Jun 8 12:37 D2file1
-rw-rw-r-- 1 biju biju 0 Jun 8 12:37 D2file2
-rw-rw-r-- 1 biju biju 0 Jun 8 12:37 D2file3
After locking
total 0
-rw------- 1 biju biju 0 Jun 8 12:37 D2file1
-rw------- 1 biju biju 0 Jun 8 12:37 D2file2
-rw------- 1 biju biju 0 Jun 8 12:37 D2file3

comments

#!/bin/bash

if [ $# -eq 0 ] #no cla given
then
    echo "Error : Please pass the directory in command line"
elif [ $# -eq 1 ]
then
    if [ -d $1 ]
    then
        echo "Before locking"
        ls -l #display all fils and the permissions


        chmod -R g-rwx $1 #remove r w x access to g (all files of $1 dir )
        chmod -R o-rwx $1 #remove r w x access to o

        echo "After locking"
        ls -l #display all files and permission
    else
        echo "please enter valid directory name"
    fi
else #more than one cla given
    echo "enter only one cla and make sure its valid directory path else its going to be error again!"
fi
