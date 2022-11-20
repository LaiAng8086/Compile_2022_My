declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@_str_0 = constant [2 x i8] c"\0a\00"
define i32 @main(){
b0:
  %l1 = alloca i32
  %l3 = alloca i32
  %l4 = alloca i32
  %l2 = call i32 @getint()
  store i32 %l2, i32* %l1
  store i32 0, i32* %l3
  store i32 0, i32* %l4
  br label %b5

b5:
  %l8 = load i32, i32* %l3
  %l9 = load i32, i32* %l1
  %l10 = icmp slt i32 %l8, %l9
  br i1 %l10, label %b6, label %b7

b6:
  %l13 = load i32, i32* %l3
  %l14 = srem i32 %l13, 2
  %l15 = icmp eq i32 %l14, 0
  br i1 %l15, label %b11, label %b12

b11:
  %l16 = load i32, i32* %l3
  %l17 = add i32 %l16, 1
  store i32 %l17, i32* %l3
  br label %b5

b12:
  %l18 = load i32, i32* %l3
  %l19 = add i32 %l18, 1
  store i32 %l19, i32* %l3
  %l20 = load i32, i32* %l4
  %l21 = load i32, i32* %l3
  %l22 = add i32 %l20, %l21
  store i32 %l22, i32* %l4
  %l23 = load i32, i32* %l4
  call void @putint(i32 %l23)
  %l24 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l24)
  br label %b5

b7:
  ret i32 0
}
