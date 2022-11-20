int t[10][10];
int main(){
    int a[2][3]={{1,2,3},{4,5,6}};
    int t = a[1][1];
    a[1][2] = t;
    return 0;
}