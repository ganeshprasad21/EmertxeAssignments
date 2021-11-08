<<comments
name: Ganesh Prasad R

date: 5/11/2021

description: 
Write a script to print the following:
• Currently logged users
• Your shell directory
• Home directory
• OS name & version
• Current working directory
• Number of users logged in
• Show all available shells in your system
• Hard disk information
• CPU information.
• Memory information.
• File system information.
• Currently running process

input :./13_system_info.sh  

output: 
1. Currently logged users
2. Your shell directory
3. Home directory
4. OS name & version
5. Current working directory
6. Number of users logged in
7. Show all available shells in your system
8. Hard disk information
9. CPU information.
10. Memory Informations
11. File system information.
12. Currently running process.
Enter the choice : 2
Your shell directory is /bin/bash
Do you want to continue (y/n) ? y

comments

#!/bin/bash


userChoiceForWhile='y' #default
while [[ $userChoiceForWhile = "y" ]]
do                                    #logic to loop infinitely until n is given is captured in the loop
    echo -e "1. Currently logged users \n2. Your shell directory\n3. Home directory"
    echo -e "4. OS name & version\n5. Current working directory\n6. Number of users logged in"
    echo -e "7. Show all available shells in your system\n8. Hard disk information\n9. CPU information."
    echo -e "10. Memory Informations\n11. File system information.\n12. Currently running process."
    read -p "Enter the choice : " choice
    if [[ $choice =~ ^[0-9]+$ ]]
    then
        case $choice in
            1)
                echo "Currently logged users are : `users` "
                ;;
            2)
                echo "Your Shell directory is : $SHELL"
                ;;
            3)
                echo "Your Home directory is As follows : $HOME"
                ;;
            4)
                echo "Your os name is : `uname` ,and version is : `uname -a | cut -d " " -f3` "
                ;;
            5)
                echo "Your current working directory is : `pwd`"
                ;;
            6)
                echo "Total number of users logged in are : `who -q | tail -1 | cut -d " " -f2 | cut -d "=" -f2` "
                ;;
            7)
                echo "All available shells in this systema are :" #first line in /etc/shell isnt much useful so trimming it out
                cat /etc/shells | tail -n +2 
                ;;
            8)
                echo "Hard disk information is a s follows : "
                sudo hwinfo --disk
                ;;
            9)
                echo "Cpu information is as follows : "
                lscpu
                ;;
            10)
                echo "Memory information is as follows : "
                cat /proc/meminfo
                ;;
            11)
                echo "file system information is as follows : "
                df
                ;;
            12)
                echo "Currently running proceses and their info are as follows : "
                ps -ef
                ;;
            *)
                echo "Error : Invalid option, please enter valid option"
                ;;
            esac
    else
        echo "please enter number"
    fi
    read -p "Do you want to continue(y/n) ?: " userChoiceForWhile #read from user
    if [[ $userChoiceForWhile =~ ^[ny]{1}$ ]]
    then
        echo ---------------++++++++++----------------- #print seperator line and decide based on input whether to run again
    else
        echo "please use n or y only--- defaulting to y as u have given invalid choice"
        echo ---------------++++++++++----------------- #print seperator and default to running again
        userChoiceForWhile='y'
    fi

done
