declare void @putint(i32)
define i32 @main(){
    %1 = alloca [2 x [2 x i32]]
    %2 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %1, i32 0, i32 0,i32 0
    store i32 1, i32* %2
    %3 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %1, i32 0, i32 0, i32 1
    store i32 2, i32* %3
    %4 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %1, i32 0, i32 1, i32 0
    store i32 3, i32* %4
    %5 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %1, i32 0, i32 1, i32 1
    store i32 4, i32* %5
    %6 = load i32, i32* %2
    call void @putint(i32 %6)
    %7 = load i32, i32* %3
    call void @putint(i32 %7)
    %8 = load i32, i32* %4
    call void @putint(i32 %8)
    %9 = load i32, i32* %5
    call void @putint(i32 %9)
    ret i32 0
}