<<comments
name: Ganesh Prasad R

date: 9/11/2021

description: 


input : 

output: 
Write script called say_hello, which will print greetings based on time.

comments

#!/bin/bash

timeIn24H=`date +%H` #get required data
dayNo=`date +%d`
day=`date +%A`
month=`date +%B`
year=`date +%Y`
timeIn12=`date | tr -s " " | cut -d " " -f4-5`

if [ `echo "$timeIn24H >= 5 " | bc ` -eq 1 -a `echo "$timeIn24H < 12 " | bc ` -eq 1 ] #check time and print accordingly
then
    echo "Good morning user, Have nice day!"
    echo "This is $day  $dayNo in $month of $year ($timeIn12)" #display
elif [ `echo "$timeIn24H >= 12 " | bc ` -eq 1 -a `echo " $timeIn24H <= 13 " | bc ` -eq  1 ]
then
    echo "Good noon user, Have nice day!"
    echo "This is $day  $dayNo in $month of $year ($timeIn12)"
elif [ `echo "$timeIn24H >= 14 " | bc ` -eq 1 -a `echo "$timeIn24H < 17 " | bc ` -eq 1 ]
then
    echo "Good  afternoon user, Have nice day!"
    echo "This is $day  $dayNo in $month of $year ($timeIn12)"
elif [ `echo "$timeIn24H >= 17 " | bc ` -eq 1 -a `echo "$timeIn24H < 21 " | bc ` -eq 1 ]
then
    echo "Good evening user, Have nice day!"
    echo "This is $day  $dayNo in $month of $year ($timeIn12)"
elif [ `echo "$timeIn24H >= 21 && $timeIn24H<24 " | bc ` -eq 1 -o `echo "$timeIn24H >= 0 && $timeIn24H < 5 " | bc ` -eq 1 ]
then
    echo "Good night user, Have nice day!"
    echo "This is $day  $dayNo in $month of $year ($timeIn12)"
fi


#to get the functionality of this script running when user loggs into shell export bash <this_script_name.sh> into .bashrc in ~
