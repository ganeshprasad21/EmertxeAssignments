<<comments
name: Ganesh Prasad R

date: 25/10/2021

description: 
Write a script to read 'n' and generate Fibonacci numbers <= n

input : ./09_fibonacci.sh
Enter limit for fib series: 10

output: 
0, 1, 1, 2, 3, 5, 8

comments

#!/bin/bash

read -p "Enter limit for fib series: " lim
firstFib=0
secondFib=1
Fib=0
if [[ $lim =~ ^[+-]?[0-9]+$ ]]
then
    if [ $lim -eq 0 ]
    then
        echo "0"
    elif [ $lim -eq 1 ]
    then
        echo "0, 1, 1"
    elif [ $lim -gt 1 ]
    then
        echo -n "0, 1, "
        while [ $lim -ge $Fib ]
        do
                Fib=`echo " $firstFib + $secondFib " | bc`
                firstFib=$secondFib
                secondFib=$Fib
                if [ $lim -ge $Fib ]
                then
                    echo -n "$Fib, "
                fi
        done
    elif [ $lim -lt 0 ]
    then
        echo "Error : Please enter only positive numbers."
    fi
else
    echo "Error : Please enter only numbers."
fi