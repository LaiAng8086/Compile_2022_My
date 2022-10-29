void foo()
{
    int a = 111;
    if (a + 3 > 100)
    {
        int c = 12;
        a = a - 4;
    }
    else
    {
        int d = 16;
        a = a + 5;
    }
    int b = 100;
}
int main()
{
    foo();
    return 1;
}