/*

name-Ganesh Prasad R

date-30-11-2021

description =  In mathematics, the Fibonacci numbers or Fibonacci sequence are the numbers in the following integer sequence 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144 . . . OR 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144 . . .

sample input=
Enter a number:8

sample output=
0, 1, 1, 2, 3, 5, 8

*/

#include <stdio.h>
void fib(int n)
{
    if(n == 0)
    printf("0\n");
    else if(n == 1)
    printf("0,1,1\n");
    else
    {
        int n1=0;
        int n2=1;
        int fibn = n1+n2;
        printf("0,1");
        while (n >= fibn)
        {
            if(fibn <= n)
                printf(",%d",fibn);
            n1=n2;
            n2=fibn;
            fibn=n1+n2;
        }
        printf("\n");
    }
}
int main()
{
    int n;
    printf("Enter a number:");
    scanf("%d",&n);
    getchar();
    if (n < 0)
    {
        printf("please enter n > 0\n")
    }
    else
    {
        fib(n);
    }
    return 0;
}