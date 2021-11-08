<<comments
name: Ganesh Prasad R

date: 22/10/2021

description: 
Write a script for arithmetic calculator using command line arguments

input : ./04_calculator.h 25 + 41

output: 
25 + 41 = 66

comments

#!/bin/bash

function arithmaticOperation()
{
    case $2 in

    +)
        echo "$1 + $3 = `echo "$1 + $3" | bc`"
        ;;
    -)
        echo "$1 - $3 = `echo "$1 - $3" | bc`"
        ;;
    x)
        echo "$1 x $3 = `echo "$1 * $3" | bc`"
        ;;
    /)
        echo "$1 / $3 = `echo "scale=2;$1 / $3" | bc`"
        ;;
    *)
        echo "invalid or unsupported operator"
        ;;
    esac
    
}



if [ $# -eq 0 ]
then
    echo "Error : Please pass the arguments through command line."
    echo "Usage:./04_arithmatic_calc 2.3 + 6.7"
elif [ $# -gt 0 -a $# -lt 3 ]
then
    echo "Error:Please pass 3 arguments."
    echo "Usage:./04_arithmatic_calc 2.3 + 6.7"
elif [ $# -eq 3 ]
then
    echo `arithmaticOperation $1 $2 $3`
fi