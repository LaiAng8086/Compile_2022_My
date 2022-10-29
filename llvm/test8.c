int a[2][3];
int main()
{
    int b = 780;
    int k = 0;
    if(b>100)
    {
        k = b+1;
    }
    else
    {
        k = b%3;
    }
    return k;
}