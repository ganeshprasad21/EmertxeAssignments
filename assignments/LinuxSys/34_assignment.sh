<<comments
name: Ganesh Prasad R

date: 22/10/2021

description: 
WAS to calculate the BMI.
               weight(kg)
BMI = -------------------------------
          height(m) * height(m)

input : ./34_BMI.sh
Enter the weight in Kg : 45.5
Enter the height in meters : 1.5

output: 
You are Normal.

comments

#!/bin/bash

read -p "Enter the weight in Kg : " weight
read -p "Enter the height in meters : " height

function checkIfRealNumber()
{
    if [[ $1 =~ ^[+-]?[0-9]*[.]?[0-9]*$ ]]
    then
        echo "real"
    else
        echo "notReal"
    fi 
}

function checkValidity()
{
    if [ `checkIfRealNumber $1` = "real" -a `echo "$1 > 0" | bc` -eq 1 ]
    then
        echo "valid"
    else
        echo "invalid"
    fi
}

#starts here
if [ `checkValidity $height` = "valid" -a `checkValidity $weight` = "valid" ]
then
    bmi=`echo "scale=2;$weight / ( $height * $height) " | bc`
    if [ `echo "$bmi < 18.5" | bc` -eq 1 ]
        then
            echo "You are Underweight."
        elif [ `echo "$bmi >= 18.5" | bc` -eq 1 -a `echo "$bmi <= 24.9" | bc` -eq 1 ]
        then
            echo "You are Normal."
        elif [ `echo "$bmi >= 25" | bc` -eq 1 -a `echo "$bmi <= 29.9" | bc` -eq 1 ]
        then
            echo "You are Overweight."
        elif [ `echo "$bmi >= 30" | bc` -eq 1 ]
        then
            echo "You are Obese."  
    fi
else
    echo "Error : Invalid input"
    echo "Please enter only positive values"
fi