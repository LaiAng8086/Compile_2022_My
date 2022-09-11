#include <stdio.h>
const int a[4][5] = {
    {1, 2, 3, 4, 5},
    {6, 7, 8, 9, 10},
    {11, 12, 13, 14, 15},
    {16, 17, 18, 19, 20}};
const int b[3] = {0, 1, 2};
const int c = 1114514;
int x, y = 6;
int va[3] = {a[2][2], a[0][2], a[1][1]};
int vb[3][3] = {
    {1919810, a[1][2], a[2][1]},
    {a[0][3], 70, 68},
    {a[1][2], 5656, 777}};
void func(int p, int q[], int r[][3])
{
    printf("%d\n", p);
    printf("%d\n", q[2]);
    printf("%d\n", r[0][1]);
}
void func2(int p)
{
    printf("%d\n", p);
    printf("%d\n", p);
    printf("%d\n", p);
}
void func3(int t[])
{
    printf("%d\n", t[0]);
    printf("%d\n", t[1]);
    printf("%d\n", t[2]);
}
int main()
{
    freopen("output2.txt", "w", stdout);
    int k, m, t;
    printf("20373787\n");
    k = a[1][2];
    m = y;
    t = va[2];
    func(y, va, vb);
    func2(m);
    func3(vb[0]);
    return 0;
}