const int c[2][1] = {{1}, {3}};
int b[2][3] = {{1, 0, 0}, {0, 0, 0}}, e[4][4];
int d[5], a[3] = {1, 2};
void putint(int a);
int main()
{
    putint(c[1][0] + b[0][0] + c[0][0] + a[1] + d[4]);
    return 0;
}