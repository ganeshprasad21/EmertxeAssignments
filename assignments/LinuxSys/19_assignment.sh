<<comments
name: Ganesh Prasad R

date: 1/11/2021

description: 
Write a script to delete all the .swp files found in your system or directory

input : ./20_delete_display_swp.sh


output: 
swp file found : 
/home/user/ConventionalMethod/.pic16F887.as.swp
/home/user/Development/BeagleBone-Xm/VideoApp/.cmds.swp
/home/user/Development/LDD/.expt_drv.c.swp/home/user/Development/LDD/.ddk_block.c.swp

comments

#!/bin/bash

#logic to find all swp files
if [ $# -eq 1 ] #dir passed
then
    if [ -d $1 ] #if arg is a dir
    then
        swpFiles=(`find $1 -name "*.swp"`)
    else
        if [ -f $1 ]
        then 
            echo "the given arg is not dir"
            exit
        else
            echo "Error : $1 no such a file or directory"
            exit
        fi
    fi
elif [ $# -eq 0 ] #check in ~
then
    swpFiles=(`find ~ -name "*.swp"`)
else #more than 1 arguments
    swpFiles=()
    for dirctry in $@
    do
    	if [ -d $dirctry ] #if arg is a dir
    	then
            swpFiles+=(`find $dirctry -name "*.swp"`)
    	else
		if [ -f $dirctry ] #if dirctry is a file
		then
		    echo "the given arg $dirctry is not dir hence skipping"
		else
		    echo "Error : no such a file or directory - $dirctry so skipping"
		fi
    	fi  
    done
fi

#check if no swap files are found
if [ ${#swpFiles} -eq 0 ]
then
    echo "No swp files found in given dir."
    echo "thanks"
    exit
fi

#display and remove all swp files accordingly if swp files exist
echo "swp file found :"
for swpFile in ${swpFiles[@]}
do
    echo $swpFile
    rm $swpFile
done