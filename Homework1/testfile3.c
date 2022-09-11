#include <stdio.h>
int getint()
{
    int c;
    scanf("%d", &c);
    return c;
}
int x[3];
int z[3][3] =
    {
        {89, 112, 45},
        {778, 772, 218},
        {897, 123, 898}};
void func1(int a, int b[], int c[][3])
{
    printf("%d\n", a * 2 % 100);
    printf("%d\n", b[0] + b[1] * b[2]);
    printf("%d\n", c[1][1] * c[2][2] * c[0][2] + c[0][1] - c[1][0]);
}
int main()
{
    freopen("output3.txt","w",stdout);
    printf("20373787\n");
    func1(1, z[0], z);
    x[0] = 1;
    x[1] = 4;
    x[2] = 7;
    func1(2, x, z);
    func1(3, x, z);
    return 0;
}