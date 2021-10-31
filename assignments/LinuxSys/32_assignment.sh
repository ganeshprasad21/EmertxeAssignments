<<comments
name: Ganesh Prasad R

date: 1/11/2021

description: 
Write a script to search a user present in your system.

input : ./33_user_present.sh xyz 

output: 
xyz not present

comments

#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Error : Please pass the argument through command line."
elif [ $# -eq 1 ]
then
    userNames=(`cat /etc/passwd | cut -d ':' -f1`) #get array of usernames
    for userName in ${userNames[@]}
    do
        if [[ $userName == $1 ]] #if username matches or not
        then
            echo "$userName is present"
            exit #exit after identifying user
        fi
    done
    #if the user is not prsent the program will say this
    echo "$1 not present"
else
    echo "not valid argument count ... only 1 argument accepted "
fi
