<<comments
name: Ganesh Prasad R

date: 6/11/2021

description: 
Write a script to determine whether a given file system or mount point is
mounted.

input : ./26_mounted_fs.sh /dev/sda2

output: 
File-system /dev/sda2 is mounted on / and it is having 98%
used space with 3298220 KB free.

comments

#!/bin/bash


fileSystemNames=(`df -h | cut -d " " -f1 | tail -n +2`)  #get all file system names , skip 1st line and store it in array
usageArray=(`df -h | tr -s " " | cut -d " " -f5 | tail -n +2`) #get usage details , skip 1st line and store it in array
availableSpaceArr=(`df | tr -s " " | cut -d " " -f4 | tail -n +2`)
mountedOnArr=(`df -h | tr -s " " | cut -d " " -f6 | tail -n +2`) #get mount points

if [ $# -eq 0 ]
then
    echo "Error : Please pass the name of the file-system through command line."
elif [ $# -eq 1 ]
then
    presentFlag=0 #to check if given filesystem is present
    indexForLoop=0 #count variable used in loop to access the usage value

    for aFileSystemName in ${fileSystemNames[@]}
    do 
        if [ $1 == $aFileSystemName ]  #if cla is there in file system then display detail and update the flag and index
        then
            echo "File-system $aFileSystemName is mounted on ${mountedOnArr[$indexForLoop]} and it is having ${usageArray[$indexForLoop]}" #display the fs name
            echo "used space with ${availableSpaceArr[$indexForLoop]} KB free"
            presentFlag=1    #set flag if found
           
        fi
        
        if [ $presentFlag -eq 1 ] #quit if file system is found to avoid multiple mount points of same file system , one can skip this if he/she wants to see all of it too
        then
            exit
        fi

        indexForLoop=$indexForLoop+1 #index variable updation

    done
    if [ $presentFlag -eq 0 ] #if $1 not found in df command
        then
            echo "$1 is not mounted (or) $1 is not a valid fileSystem !"
        fi
else
    echo "not valid arg list you have given more than 1 cla"
fi
