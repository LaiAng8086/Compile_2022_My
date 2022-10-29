int gcd(int m, int n) {
    printf("m=%d n=%d\n",m,n);
    gcd(m+1,n+1);
    return 0;
}

int main() {
    int a = 100, b = 48;
    printf("a=%d, b=%d, gcd=%d\n",a,b,gcd(a, b));
    return 0;
}