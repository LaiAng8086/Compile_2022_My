#include <stdio.h>
int getint()
{
    int c;
    scanf("%d", &c);
    return c;
}
int main()
{
    freopen("output4.txt","w",stdout);
    int i;
    int j;
    printf("20373787\n");
    i = 0;
    j = 1;
    while (i < 10)
    {
        printf("%d\n", j);
        j = j * 2;
        i++;
    }
    return 0;
}