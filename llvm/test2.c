// main.c
int foo(int first, int second, int third)
{
    return first + second;
}

int a = 5;

int main()
{
    int b = 4;
    return foo(a, b, b);
}