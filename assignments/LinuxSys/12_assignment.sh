<<comments
name: Ganesh Prasad R

date: 5/11/2021

description: 
Write a script to sort a given number in ascending or descending order.

input : ./12_sorting.sh -a 5 4 6 2 3 8 9 7 1


output: 
Ascending order of array is 1 2 3 4 5 6 7 8 9

comments

#!/bin/bash

ascending() #ascending order bubbler sort
{
    numbers=("$@")
    noOfSwappingRounds=$(( $# - 1 ))

    if [ $noOfSwappingRounds -eq 0 ] #only 1 number given
    then
        echo "Ascending order of array is : ${numbers[*]}"
        return
    else #more than 1 number is given
        
        totalNoOfLoops=$(( ${#numbers[@]} - 1 )) #get value of total number of while loop count
        numberOfLoopsSoFar=0;                    #initialize number of loops done
        while [ $totalNoOfLoops -gt $numberOfLoopsSoFar ] #repeat loop until we swap every adjacent numbersaccurately
        do
            for i in `seq 1 $totalNoOfLoops` #for looping across and swapping numbers
            do
                if [ ${numbers[$index]} -gt ${numbers[$(($index + 1))]} ] #to swap
                then
                    temp=${numbers[$index]}                           #swapping logic
                    numbers[$index]=${numbers[$(($index + 1))]}
                    numbers[$(($index + 1))]=$temp
                fi
                index=$(( $index + 1 ))
            done
            index=0              #reset index for next while
            numberOfLoopsSoFar=$(( $numberOfLoopsSoFar + 1 )) #update number of loops
        done
        echo "Ascending order of array is : ${numbers[@]}" #print sorted array
    fi
}

descending() #descending order bubble sort
{
    numbers=("$@")
    noOfSwappingRounds=$(( $# - 1 ))

    if [ $noOfSwappingRounds -eq 0 ] #only 1 number given
    then
        echo "Descending order of array is : ${numbers[*]}"
        return
    else #more than 1 number is given
        
        totalNoOfLoops=$(( ${#numbers[@]} - 1 )) #get value of total number of while loop count
        numberOfLoopsSoFar=0;                    #initialize number of loops done
        while [ $totalNoOfLoops -gt $numberOfLoopsSoFar ] #repeat loop until we swap every adjacent numbersaccurately
        do
            for i in `seq 1 $totalNoOfLoops` #for looping across and swapping numbers
            do
                if [ ${numbers[$index]} -lt ${numbers[$(($index + 1))]} ] #main logic
                then
                    temp=${numbers[$index]}                           #swapping logic
                    numbers[$index]=${numbers[$(($index + 1))]}
                    numbers[$(($index + 1))]=$temp
                fi
                index=$(( $index + 1 ))
            done
            index=0              #reset index for next while
            numberOfLoopsSoFar=$(( $numberOfLoopsSoFar + 1 )) #update number of loops
        done
        echo "Descending order of array is : ${numbers[@]}" #print sorted array
    fi
}


if [ $# -ge 2 ] #min reqirement to be valid criteria anything lesser than this is error
then
    if [[ $1 =~ ^-[ad]{1}$ ]]        #      starts with valid command
    then
        numbers=("$@")      #consider whole as numbers will update in future
        lenOfNumbers=$(( $# - 1 ))      #get total count of numbers which is 1 less than total cla
        numbers=${numbers[@]:1:${#numbers[@]}} #get numbers
        
        countForValidating=0 #validation variable that checks if the number arr has digits only
        for number in $numbers
        do
            if [[ $number =~ ^[0-9]+$ ]]
            then
                countForValidating=$(( countForValidating + 1 ))
            fi
            
        done

        if [ $countForValidating -eq $lenOfNumbers ] #given all are numbers so proceed
        then
            case "$1" in
            -a)
                ascending $numbers
                ;;
            -d)
                descending $numbers
                ;;
            *)
                echo "invalid args"
                ;;
            esac
        else #given arguments contains non numbers
            echo "please send only positive numbers in cla after -a / -d anything else is invalid"
        fi
    else #invalid options
        echo "Error : Please pass the choice. -a or -d"
        echo "Usage : ./12_sorting -a/-d 4 23 5 6 3"
    fi
else
    echo "Error : Please pass the argument through command line.(seems that u have passed only 1 argument)"
    echo "Usage : ./12_sorting -a/-d 4 23 5 6 3"
fi