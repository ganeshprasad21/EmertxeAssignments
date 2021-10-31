<<comments
name: Ganesh Prasad R

date: 1/11/2021

description: 
Count the number of users with user IDs between given range.

input : ./30_user_ids.sh 0 100


output: 
Total count of user ID between 0 to 100 is : 3

comments

#!/bin/bash
uids=(`cat /etc/passwd | cut -d ':' -f3`)
count=0

if [ $# -eq 2 ] #check if 2 arguments are passed
then
    if [[ $1 =~ ^[0-9]+$ ]] && [[ $2 =~ ^[0-9]+$ ]] #check if both are numbers no signed numbers are allowed
    then
        if [ $1 -le $2 ] #2 numberss in correct order
        then
            for uid in ${uids[@]}
            do
                if [ $uid -ge $1 -a $uid -le $2 ]
                then
                count=`echo "$count+1" | bc`
                fi
            done
            echo "Total count of user ID between $1 to $2 is : $count"
        else # wrong order of 2 arguments
            echo "Invalid range. Please enter the valid range through CL."
            exit
        fi
    else #if any of 2 are not numbers
        echo "enter only numbers"
        exit
    fi
elif [ $# -eq 0 ]
then
    for uid in ${uids[@]}
    do
        if [ $uid -ge 500 -a $uid -le 10000 ]
        then
        count=$(expr $count + 1 )
        fi
    done
    echo "Total count of user ID between 500 to 10000 is : $count"
else
    echo "Error : Please pass 2 arguments through CL."
    exit
fi



