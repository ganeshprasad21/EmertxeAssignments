<<comments
name: Ganesh Prasad R

date: 5/11/2021

description: 
Display the names of any file-system which have less than 10% free space
available

input : ./29_free_space.sh

output: 
Filesystem /dev/sda5 have less than 10% free space

comments

#!/bin/bash

fileSystemNames=(`df -h | cut -d " " -f1 | tail -n +2`)  #get all file system names , skip 1st line and store it in array
usageArray=(`df -h | tr -s " " | cut -d " " -f5 | tr -s '%' ' ' | tail -n +2`) #get usage details , skip 1st line and store it in array

indexForLoop=0 #count variable used in loop to access the usage value

for aFileSystemName in ${fileSystemNames[@]}
do 
    if [ `echo " 100 - ${usageArray[$indexForLoop]} " | bc ` -gt 10 ] #get free % and comnpare if its less than 10 
    then
        echo "Filesystem $aFileSystemName have less than 10% free space" #display the fs name
    fi
    indexForLoop=$indexForLoop+1 #index variable
done