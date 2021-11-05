<<comments
name: Ganesh Prasad R

date: 5/11/2021

description: 
Given album name and corresponding directory this scripts renames them
properly by inserting index numbers. For example given file numbers .

input : 16_rename_album.sh day_out

output: 
day_out001.jpg day_out002.jpgday_out003.jpg

comments

#!/bin/bash


if [ $# -eq 1 ] #valid case
then
    echo "All matching .jpg files in current directory is renamed as"
    for fileName in * #loop for every filename
    do    
        if [ -f $fileName ]
        then
            if [[ $fileName =~ ^DSN[0-9]{3}.jpg$ ]] #checks for the kind of files we are wanting to alter = dsr-"3 numbers".jpg
            then
                alteredFileName=$1
                alteredFileName+=`echo "$fileName" | sed 's/DSN//1'` #altration
                mv $fileName $alteredFileName #rename
                echo -n "$alteredFileName   "
            fi
        fi
    done 
    echo
elif [ $# -eq 0 ] #0 cla sent
then
    echo "Error : Please pass the prefix name through command line."
else #more than 1
    echo "please send only one cla which represents the prefix"
fi