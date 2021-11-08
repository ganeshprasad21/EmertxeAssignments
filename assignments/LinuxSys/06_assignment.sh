<<comments
name: Ganesh Prasad R

date: 22/10/2021

description: 
Write a script to print a given number in reverse order

input : /06_reverse.sh 1540

output: 
Reversed number – 451

comments

#!/bin/bash
function reverseNumber()
{
    ((num=`echo " $1 + 0" | bc`)) #protect from trailing 0s as it used to convert str to weird numbers
    reversedNumber=0
    while [ $num -gt 0 ]
    do
        ((reminder=`echo $num % 10 | bc`))
        ((num=$num / 10 ))
        ((reversedNumber=(($reversedNumber * 10)) + reminder))
    done
    echo $reversedNumber
}

if [ $# -eq 0 ]
then
    echo "Error: No argument passed"
elif [[ $1 =~ ^[0-9]+$ ]]
then
    if [ $1 -gt 9 ]
    then
        echo -n "Reversed number – "
        echo `reverseNumber $1`
    else
        echo "Error: pass a multi-digit number"
    fi
else
    echo "Error: Enter only numbers"
fi
