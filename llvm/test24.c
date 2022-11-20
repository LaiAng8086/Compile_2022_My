void putint(int a);
int func1(int a[])
{
    return a[2];
}
int func2(int b[][3])
{
    return b[1][2];
}
int main(){
    int b[3][3];
    b[1][2]=110;
    b[2][2]=1;
    putint(func2(b));
    return func1(b[2]);
}