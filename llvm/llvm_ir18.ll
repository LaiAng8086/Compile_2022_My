declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
define i32 @func1(i32* %l1){
b0:
  %l2 = getelementptr i32, i32* %l1, i32 2
  %l3 = load i32, i32* %l2
  call void @putint(i32 %l3)
  %l4 = getelementptr i32, i32* %l1, i32 2
  %l5 = load i32, i32* %l4
  ret i32 %l5
}
define i32 @func2([3 x i32]* %l1){
b0:
  %l2 = getelementptr [3 x i32], [3 x i32]* %l1, i32 1, i32 0
  %l3 = load i32, i32* %l2
  %l4 = call i32 @func1(i32 %l3)
  %l5 = load [3 x i32], [3 x i32]* %l1
  %l6 = call i32 @func2([3 x i32] %l5)
  %l7 = getelementptr [3 x i32], [3 x i32]* %l1, i32 1, i32 2
  %l8 = load i32, i32* %l7
  ret i32 %l8
}
define i32 @main(){
b0:
  %l1 = alloca [3 x [3 x i32]]
  %l2 = getelementptr [3 x [3 x i32]], [3 x [3 x i32]]* %l1, i32 0, i32 1, i32 2
  store i32 110, i32 %l2
  %l3 = getelementptr [3 x [3 x i32]], [3 x [3 x i32]]* %l1, i32 0, i32 2, i32 2
  store i32 1, i32 %l3
  %l4 = getelementptr [3 x [3 x i32]], [3 x [3 x i32]]* %l1, i32 0
  %l5 = load [3 x i32], [3 x i32]* %l4
  %l6 = call i32 @func2([3 x i32] %l5)
  call void @putint(i32 %l6)
  %l7 = getelementptr [3 x [3 x i32]], [3 x [3 x i32]]* %l1, i32 0, i32 2
  %l8 = load i32, i32* %l7
  %l9 = call i32 @func1(i32 %l8)
  call void @putint(i32 %l9)
  ret i32 0
}
