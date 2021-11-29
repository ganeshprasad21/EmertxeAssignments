/*

name-Ganesh Prasad R

date-29-11-2021

description = The user entered number should identified whether its a odd or a even number. Mention its sign too.

sample input=
Enter the value of 'n' : -2

sample output=
-2 is negative even number

*/

#include<stdio.h>
int isZero(int num)
{
    //return 0 if false(not zero) 1 if true
    return num == 0 ? 1:0;
}
int isEven(int num)
{
    //return 1 if even 0 if not
    return num % 2 == 0 ? 1 : 0;
}

int main()
{
    int num;
    printf("Enter the value of 'n' : ");
    scanf("%d",&num);
    getchar();
    if (isZero(num))
    {
        printf("%d is neither even nor odd\n",num);
    }
    else if (num > 0) //it is positive number
    {
        if(isEven(num))
        {
            printf("%d is positive even number\n",num);
        }
        else //it is not even implies its odd
        {
            printf("%d is positive odd number\n",num);
        }
    }
    else //it is negative number
    {
        if(isEven(num))
        {
            printf("%d is negative even number\n",num);
        }
        else //it is not even
        {
            printf("%d is negative odd number\n",num);
        }
    }
        
    return 0;

}