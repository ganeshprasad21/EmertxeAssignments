<<comments
name: Ganesh Prasad R

date: 25/10/2021

description: 
Write a script to perform arithmetic operation on digits of a given number depending upon the operator.

input : ./08_operator_dependent.sh 1234+

output: 
Sum is 10

comments

#!/bin/bash

function arithmaticOperation()
{
    case $2 in

    +)
        echo "`echo "$1 + $3" | bc`"
        ;;
    -)
        echo "`echo "$1 - $3" | bc`"
        ;;
    x)
        echo "`echo "$1 * $3" | bc`"
        ;;
    /)
        echo "`echo "scale=2;$1 / $3" | bc`"
        ;;
    *)
        echo "invalid or unsupported operator"
        ;;
    esac
    
}


if [ $# -eq 1 ]
    then
    num=$1
    if [[ $num =~ ^[0-9]+[+-/x]$ ]]
    then

        endIndex=`echo " ${#num} - 2 " | bc`
        answer=${num[@]:0:1}
        operation=${num[@]:(( ${#num} - 1 )):1}

        for i in `seq 1 $endIndex`
        do
            numToFunc=${num[@]:$i:1}
            answer=`arithmaticOperation $answer $operation $numToFunc`
        done

        if [ $operation = "+" ]
        then
            echo "Sum is $answer"
        elif [ $operation = "/" ]
        then
            echo "Div is $answer"
        elif [ $operation = "-" ]
        then
            echo "Sub is $answer"
        elif [ $operation = "x" ]
        then
            echo "Mul is $answer"
        fi
    else
        echo "Error: Operator missing or invalid operator, please pass"
        echo "operator as last digit (+,-,x,/)"
    fi
else
    echo "Error : Please pass the argument."
    echo "Usage : ./09_operator_dependent.sh 2345+"
fi

