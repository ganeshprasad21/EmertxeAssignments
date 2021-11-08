	
<<comments
name: Ganesh Prasad R

date: 6/11/2021

description: 
Write a script that takes any number of directories as command-line arguments
and then lists the contents of each of these directories.

input : 
./27_ouput_ls.sh ~ ~/ECEP 

output: 
/home/user:
Downloads Documents Desktop Music Pictures Public Videos
ECEP
/home/user/ECEP:
Linux_Systems Advnc_C Linux_Internals Data_Structures MC

comments

#!/bin/bash

if [ $# -eq 0 ]
then
    echo "$PWD :"
    echo * #print current directory contents
else
    for dirName in $@
    do
        if [ -d $dirName ]
        then
            cd $dirName
            echo "$PWD :"
            echo * #print current directory contents
        else
            echo "Cannot access '$dirName' : No such a file or directory. "
        fi
    done
fi