<<comments
name: Ganesh Prasad R

date: 9/11/2021

description: Write a script to replace 20% lines in a C file randomly and replace it with the pattern

input : ./33_replace<DEL>.sh main.c

output: 
Before replacing
#incude <stdio.h>
int main()
{
         printf(“Hello world\n”);
}
After replacing
#incude <stdio.h>
int main()
{
<-----------Deleted------------>
}


comments

#!/bin/bash

findNValue () #gives value of N that is 20 % of total lines in a file
{
    noOfLines=`wc -l < $1`
    ans=`echo "  ( 20 * $noOfLines ) / 100 " | bc`
    echo "$ans"
}

replceNLine()  #replaces $1 = n lines in given file $2 = file
{   
    noOfLines=`wc -l < $2` #no of lines in $2
    lines=`shuf -i 1-$noOfLines | head -$1`        #get random n line numbers
    for num in ${lines[@]}
    do
        `sed -i "${num}s/^.*$/<-----------Deleted------------>/" $2`      #replace the line with given pattern
    done
}




if [ $# -eq 0 ]
then
    echo "Error : Please pass the file name through command line."
elif [ $# -eq 1 ] #if 1 arg is given
then
    if [ -f $1 ] #given arg is a file
    then 
        if [ -s $1 ] #file is non empty
        then

            echo "Before replacing :"
            echo
            cat $1 #display content
            echo
            n=`findNValue $1` #find n val

            replceNLine $n $1 #replace 20% line
            echo "After replaced :"
            echo
            cat $1
            echo     
        else
            echo "Error : $1 is empty file. So can’t replace the string."
        fi
    else
        echo "Error : No such a file."
    fi
else #more than one command line argument is given
    echo "please send only one argument to the script"
fi


#thank you