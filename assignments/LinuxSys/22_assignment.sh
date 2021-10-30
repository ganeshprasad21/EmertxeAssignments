<<comments
name: Ganesh Prasad R

date: 30/10/2021

description: 
Shell script to convert string lower to upper and upper to lower.

input : ./22_upper_lower.sh file.txt
1 – Lower to upper
2 – Upper to lower
Please select option : 1

output: 
WHAT ARE THE DIFFERENT OS?
WHEN IS OS USED?
WHAT IS PARTITION AND ITS USE?
HOW MANY PARTITIONS CAN BE DONE?

comments

#!/bin/bash

if [ $# -eq 1 ]  #valid case
then
    if [ -e $1 ] #check if file exists
    then
        if [ -s $1 ] #check if its not empty
        then
            echo -e "1 – Lower to upper \n2 – Upper to lower: " 
            read -p "Please select option : " option
            if [ 1 -eq $option ] #if 1 is choosen
            then
                tr [:lower:] [:upper:] < $1 #tr lower to upper
                echo #extra space
            elif [ 2 -eq $option ] #if 2 is chosen
            then
                tr [:upper:] [:lower:] < $1 #tr upper to lower
                echo
            else
                echo "Error: choose 1 or 2 ... your number is not a valid choice ... invalid!" 
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
