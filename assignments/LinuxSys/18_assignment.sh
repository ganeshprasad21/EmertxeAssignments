<<comments
name: Ganesh Prasad R

date: 31/10/2021

description: 
Display the longest and shortest user-names on the system.

input : ./19_largest_username.sh


output: 
The Longest Name is: speech-dispatcher
The Shortest Name is: lp

comments

#!/bin/bash

allUsernames=(`cat /etc/passwd | cut -d ':' -f1`) #get all usernames

smallestName=${allUsernames[0]} #initialize the smallest and largest before looping and setting correct
largestName=${allUsernames[0]}

for username in ${allUsernames[@]}    #logic to find largest and smallet  names
do
    if [ ${#username} -gt ${#largestName} ]
    then
        largestName=$username
    fi
    if [ ${#username} -lt ${#smallestName} ]
    then
        smallestName=$username
    fi
done

echo "The Longest Name is:             $largestName"
echo "The Shortest Name is:            $smallestName"
