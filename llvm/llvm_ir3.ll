declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@_str_0 = constant [2 x i8] c"\0a\00"
define i32 @main(){
b0:
  %l1 = alloca i32
  %l3 = alloca i32
  %l2 = call i32 @getint()
  store i32 %l2, i32* %l1
  %l4 = load i32, i32* %l1
  %l5 = sub i32 0, %l4
  store i32 %l5, i32* %l3
  %l6 = load i32, i32* %l3
  call void @putint(i32 %l6)
  %l7 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l7)
  ret i32 0
}
