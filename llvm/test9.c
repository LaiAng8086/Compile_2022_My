int x[10],y[15][3];
int foo(int a,int b[],int c[][3])
{
    a=b[0]*b[1];
    b[2]=c[0][2]*b[3];
    return a+b[2];
}
int main()
{
    x[0]=101;
    x[1]=102;
    x[3]=676;
    y[0][2]=1011;
    y[0][1]=998;
    foo(100,x,y);
}