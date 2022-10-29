declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@N = constant i32 555
@_str_0 = constant [2 x i8] c"\0a\00"
@_str_1 = constant [10 x i8] c"20373057\0a\00"
@_str_2 = constant [2 x i8] c"\0a\00"
@_str_3 = constant [2 x i8] c"\0a\00"
define i32 @func(){
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  store i32 114500, i32* %l1
  store i32 10, i32* %l2
  %l3 = load i32, i32* %l2
  %l4 = add i32 114500, %l3
  %l5 = sub i32 %l4, 4
  %l6 = add i32 %l5, 8
  ret i32 %l6
}
define i32 @func2(i32 %l1, i32 %l3, i32 %l5){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  %l7 = load i32, i32* %l2
  %l8 = load i32, i32* %l4
  %l9 = mul i32 %l7, %l8
  %l10 = load i32, i32* %l6
  %l11 = add i32 %l9, %l10
  ret i32 %l11
}
define void @printTotal(i32 %l1, i32 %l3, i32 %l5){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  %l7 = load i32, i32* %l2
  %l8 = load i32, i32* %l4
  %l9 = add i32 %l7, %l8
  %l10 = load i32, i32* %l6
  %l11 = add i32 %l9, %l10
  %l12 = load i32, i32* %l2
  %l13 = mul i32 %l11, %l12
  call void @putint(i32 %l13)
  %l14 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l14)
  ret void
}
define i32 @main(){
b0:
  %l1 = alloca i32
  store i32 666, i32* %l1
  %l2 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l2)
  %l3 = call i32 @func()
  call void @putint(i32 %l3)
  %l4 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l4)
  %l5 = call i32 @func2(i32 1, i32 2, i32 3)
  call void @putint(i32 %l5)
  %l6 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l6)
  call void @printTotal(i32 5, i32 -2, i32 -1)
  call void @putint(i32 666)
  ret i32 0
}
