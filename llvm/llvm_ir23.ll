declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@_str_0 = constant [2 x i8] c"\0a\00"
define i32 @main(){
b0:
  %l1 = alloca [2 x [2 x i32]]
  %l6 = alloca [2 x [2 x i32]]
  %l2 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l1, i32 0, i32 0, i32 0
  store i32 1, i32* %l2
  %l3 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l1, i32 0, i32 0, i32 1
  store i32 2, i32* %l3
  %l4 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l1, i32 0, i32 1, i32 0
  store i32 2, i32* %l4
  %l5 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l1, i32 0, i32 1, i32 1
  store i32 3, i32* %l5
  %l7 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l1, i32 0, i32 0, i32 0
  %l8 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l1, i32 0, i32 1, i32 1
  %l9 = load i32, i32* %l7
  %l10 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 0, i32 0
  store i32 %l9, i32* %l10
  %l11 = load i32, i32* %l8
  %l12 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 0, i32 1
  store i32 %l11, i32* %l12
  %l13 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 0
  store i32 5, i32* %l13
  %l14 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  store i32 6, i32* %l14
  %l15 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  %l16 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l1, i32 0, i32 1, i32 0
  %l17 = load i32, i32* %l15
  %l18 = load i32, i32* %l16
  %l19 = add i32 %l17, %l18
  call void @putint(i32 %l19)
  %l20 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l20)
  ret i32 0
}
