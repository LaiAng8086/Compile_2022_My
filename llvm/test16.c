const int c1 = 2;
const int c2 = 1;
int foo(int a, int b)
{
    return a + b;
}
int func()
{
    return c1 * c2;
}
int main()
{
    int v1 = 0, v2 = 1;
    int res;
    if (v1 == 0 && v2 <= 1)
    {
        res = foo(v1, v2) + 1;
    }
    else
    {
        res = func();
    }
    printf("%d\n", res);
    return 0;
}