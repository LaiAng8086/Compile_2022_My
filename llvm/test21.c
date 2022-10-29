int foo1(int a, int b)
{
    return a + b;
}
int foo2(int a, int b, int c, int d)
{
    int ret;
    ret = foo1(a * b + c / d, d + c + b + a);
    return ret;
}
int main()
{
    int x, y, z, w;
    x = getint();
    y = getint();
    z = getint();
    w = getint();
    printf("%d\n", foo2(x, y, z, w));
    return 0;
}