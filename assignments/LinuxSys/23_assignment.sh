<<comments
name: Ganesh Prasad R

date: 18/10/2021

description: 
Read 'n' and generate a pattern given below
1
1 2
1 2 3
1 2 3 4

input : bash 01_assignment.sh
Enter the number : 4

output: 
1
1 2
1 2 3
1 2 3 4

comments

#!/bin/bash

read -p "Enter the number :" num

if [ $num -ge 2 -a $num -le `echo "2 * 2 * 2 * 2 * 2" | bc` ]
then
    for row in $(seq 1 $num)
    do
        displayNumber=1
        for col in $(seq 1 $row)        
        do
            echo -n "$displayNumber "
            ((displayNumber=displayNumber + 1))
        done
        echo
    done
else
    echo "Error : Number out of range, Please enter 2 < number < 2^5"
fi
