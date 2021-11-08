<<comments
name: Ganesh Prasad R

date: 8/11/2021

description:
For each directory in the $PATH, display the number of executable files in that
directory.

input : ./31_executable_path.sh

output: 
Current dir: /usr/local/sbin
current count: 0
Current dir: /usr/local/bin
current count: 0
Current dir: /usr/sbin
current count: 205
Current dir: /usr/bin
current count: 1889
Current dir: /sbin
current count: 187
Current dir: /bin
current count: 159
Current dir: /usr/games
current count: 5
Current dir: /usr/local/games
current count: 0
Total – 2445

comments

#!/bin/bash

totalCount=0 #to store total count
allPATHArr=(`echo $PATH | tr ":" " "`) #converts path variable into array of dir containing executables by using tr by translating : into spaces
for aPath in ${allPATHArr[@]} #for every path in $PATH
do
    cd $aPath #changing the $pwd 
    echo "Current dir: $PWD"
    localCount=0     #used to track how many executables in current path
    for aFile in *
    do   
        if [ -x $aFile ]
        then
            localCount=`echo "$localCount + 1" | bc`         #update current count
        fi
    done
    echo "current count : $localCount"
    totalCount=`echo "$totalCount + $localCount" | bc`
done
echo "Total - $totalCount"