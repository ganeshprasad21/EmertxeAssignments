/*

name-Ganesh Prasad R

date-2-11-2021

description =  In number theory, a perfect number is a positive integer that is equal to the sum of its proper positive divisors, that is, the sum of its positive divisors excluding the number itself (also known as its aliquot sum).

sample input=
Enter a number: 6

sample output=
Yes, entered number is perfect number

*/

#include <stdio.h>
int is_perfect(int n)
{
    int sum = 0;
    int num;
    for (num = 1; num < n; num++)
    {
        if (n % num == 0) //if its a perfect devisor
        {
            sum = sum + num;
        }
    }

    if (sum != num) //if not perfect
    {
        return 0;
    }
    return 1; //if it is perfect
}
int main()
{
    int n;
    printf("Enter a number: ");
    scanf("%d", &n);
    if (n >= 0) //n>o then check for perfect num
    {
        if (is_perfect(n))
        {
            printf("Yes, entered number is perfect number\n");
        }
        else
        {
            printf("No, entered number is not a perfect number\n");
        }
    }
    else
    {
        printf("Error : Invalid Input, Enter only positive number\n");
    }
}