<<comments
name: Ganesh Prasad R

date: 5/11/2021

description: 
Use a recursive function to print each argument passed to the function.

input : ./25_recursion.sh How are you? I am fine


output: 
How
are
you?
I
am
fine

comments

#!/bin/bash

printRecursive()
{
    argumentArray=("$@") #to save the complete cla in an array

    if [ ${#argumentArray} -gt 0 ]
    then
        echo "${argumentArray[0]}" #print the 1st arg <where the magic happens>

        lenOfArr=${#argumentArray[@]}                   #get length of clas to find substring for recursive call
        lenOfArrForRecursiveCall=$(( $lenOfArr - 1 ))

        argumentArrayForRecursiveCall=${argumentArray[@]:1:lenOfArrForRecursiveCall} #get substring for recursive call

        printRecursive ${argumentArrayForRecursiveCall[@]} #recursive call

        #return #it is optional here
    elif [ ${#argumentArray} -eq 0 ]
    then
        return
    fi

}
if [ $# -gt 0 ]
then
    printRecursive $@
else
    echo "Error : Pass the arguments through command line."
fi