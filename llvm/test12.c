int tt;
int x = 6;
const int year = 2022;
int factorial(int val)
{
    int temp = 1;
    for (int i = 2; i <= val; ++i)
        temp *= i;
    return temp;
}
int main()
{
    const int year2 = 3456;
    x = 78;
    tt = 2;
    x = year + 1;
    tt = year2 + year / tt;
    return 0;
}