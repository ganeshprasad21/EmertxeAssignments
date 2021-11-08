<<comments
name: Ganesh Prasad R

date: 18/10/2021

description: 
Read 'n' and generate a pattern given below
1
2 3
4 5 6
7 8 9 10

input : bash 02_assignment.sh
Enter the number : 4

output: 
1
2 3
4 5 6
7 8 9 10

comments

#!/bin/bash

read -p "Enter the number :" num

if [ $num -ge 2 -a $num -le `echo "2 * 2 * 2 * 2 * 2" | bc` ]
then
displayNum=1
    for row in $(seq 1 $num)
    do
        for col in $(seq 1 $row)     
        do
            echo -n "$displayNum "
            ((displayNum=displayNum + 1))
        done
        echo
    done
else
    echo "Error : Number out of range, Please enter 2 < number < 2^5"
fi
