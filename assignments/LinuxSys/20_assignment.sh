<<comments
name: Ganesh Prasad R

date: 8/11/2021

description: 
Write a script for generating random 8-character passwords including alpha
numeric characters.

input : ./20_random_password.sh

output: 
nH@Rh0Pv

comments

#!/bin/bash
echo "Generating 8 digit random password ... "
randomPassword=`cat /dev/urandom | tr -dc [:print:] | head -c 8 ` #dev urandom gives random characters we translate that and trim non print-ble characters and get first 8 characters
echo "generated random password is : $randomPassword"
