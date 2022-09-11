#include <bits/stdc++.h>
using namespace std;
typedef long long LL;
typedef pair<int, int> pii;
#define fir first
#define sec second
const int MOD = 1e4 + 7;
mt19937 rng(time(0));
int get_rand()
{
    return (rng() % MOD + MOD) % MOD + 1;
}
int a, b, c, d;
int x;
int y[5];
int func2(int x, int y[])
{
    int ret;
    ret = d * a / b % c;
    while (x < y[1] != x >= y[3] && a + 817 / (y[0] * x) > 5 || c<x - b != x * b> 0 && d / 666 >= 0 == a + x / 2 > 0)
    {
        if (ret > 110000)
            break;
        ret = ret + b;
    }
    // printf("func2=%d\n", ret);
    return ret;
}
bool condition0()
{
    cout << "condition0=" << (x<b != y[0]> c) << "\n";
    return x<b != y[0]> c;
}
bool condition1()
{
    cout << "condition1=" << (y[2] * x >= 4869000) << "\n";
    return y[2] * x >= 4869000;
}
bool condition2()
{
    cout << "condition2=" << (func2(x, y) > 114514) << "\n";
    return func2(x, y) > 114514;
}
bool condition3()
{
    cout << "condition3=" << (y[4] + x < a % c) << "\n";
    return y[4] + x < a % c;
}
bool condition4()
{
    cout << "condition4=" << (x + x <= 2333) << "\n";
    return x + x <= 2333;
}
bool condition5()
{
    cout << "condition5=" << (x < y[1]) << "\n";
    return x < y[1];
}
bool condition6()
{
    cout << "condition6=" << (x >= y[3]) << "\n";
    return x >= y[3];
}
bool condition7()
{
    cout << "condition7=" << (a + 817 / (y[0] * x) > 5) << "\n";
    return a + 817 / (y[0] * x) > 5;
}
bool condition8()
{
    cout << "condition8=" << (c < x - b) << (x * b > 0) << (c<x - b != x * b> 0) << "\n";
    return c<x - b != x * b> 0;
}
bool condition9()
{
    cout << "condition9=" << (d / 666 >= 0 == a + x / 2 > 0) << "\n";
    return d / 666 >= 0 == a + x / 2 > 0;
}
void output_short_1()
{
    cout << a << "\n"
         << b << "\n"
         << c << "\n"
         << d << "\n";
    for (int i = 0; i < 5; i++)
        cout << y[i] << "\n";
    cout << x << "\n";
    // system("PAUSE");
}
void displayx()
{
    condition0();
    condition1();
    condition2();
    condition3();
    condition4();
    condition5();
    condition6();
    condition7();
    condition8();
    condition9();
    cout << "=======\n";
}
int main()
{
    // freopen("input1.txt", "w", stdout);
    // a = get_rand();
    // b = get_rand();
    // c = get_rand();
    // d = get_rand();
    // for (int i = 0; i < 5; i++)
    //     y[i] = get_rand();

    // do
    // {
    //     x = get_rand();
    // } while (condition1() == condition2());
    // output_short_1();

    // x = get_rand();
    // while (!(condition5() != condition6() && condition7()))
    // {
    //     x = get_rand();
    // }
    // cout << x << "\n"; // short_2

    // x = get_rand();
    // while (!(condition1() == condition2() && condition3() != condition4()))
    // {
    //     x = get_rand();
    // }
    // cout << x << "\n"; // non_short_func1

    // x = get_rand();
    // while (!(condition8() && condition9()) || (condition5() != condition6() && condition7()))
    // {
    //     x = get_rand();
    // }
    // cout << x << "\n"; // non_short_func2

    // for (int i = 5; i <= 9; i++)
    //     cout << get_rand() << "\n";

    freopen("input1.txt", "r", stdin);
    cin >> a;
    cin >> b;
    cin >> c;
    cin >> d;
    for (int i = 0; i < 5; i++)
        cin >> y[i];
    for (int i = 1; i <= 9; i++)
    {
        cout << "==== i=" << i << "====\n";
        cin >> x;
        displayx();
    }
    return 0;
}
