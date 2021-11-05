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

#read -p "Enter the number :" num
numbers=$#-1
arr=("$@")
    numbers="${arr[@]:1:numbers}"
echo ${numbers[@]}