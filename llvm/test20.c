int foo(){
    printf("%d\n",1);
    foo();
    return 0;
}
int main(){
    foo();
}