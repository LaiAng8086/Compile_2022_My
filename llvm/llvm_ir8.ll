declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@_str_0 = constant [3 x i8] c"0\0a\00"
@_str_1 = constant [3 x i8] c"1\0a\00"
define i32 @main(){
b0:
  %l1 = alloca i32
  %l3 = alloca i32
  %l2 = call i32 @getint()
  store i32 %l2, i32* %l1
  %l4 = call i32 @getint()
  store i32 %l4, i32* %l3
  %l8 = load i32, i32* %l1
  %l9 = load i32, i32* %l3
  %l10 = icmp sle i32 %l8, %l9
  br i1 %l10, label %b5, label %b7

b5:
  %l11 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l11)
  br label %b6

b7:
  %l12 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l12)
  br label %b6

b6:
  ret i32 0
}
