<<comments
name: Ganesh Prasad R

date: 26/10/2021

description: 
Write a script to print chess board

input : ./11_chess_board.sh

output: 
"a chess board"

comments

#!/bin/bash

for row in `seq 0 7`
do
    for col in `seq 0 7`
    do
        rowPlusCol=`echo "$row + $col" | bc`
        if [ ` echo " $rowPlusCol % 2 " | bc ` -eq 0 ]
        then
            echo -e -n "\e[47m" " " #white
        elif [ ` echo " $rowPlusCol % 2 "| bc ` -eq 1 ]
        then
            echo -e -n "\e[40m" " " #black
        fi
    done
    echo -e -n "\e[0m" " "
    echo
done
