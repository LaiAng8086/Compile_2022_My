int x = 1;
int y = 2;
void foo(int a, int b)
{
    foo(a + 1, b + 1);
    return ;
}
int main()
{
    foo(x, y);
    return 0;
}