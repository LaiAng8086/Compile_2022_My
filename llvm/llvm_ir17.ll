declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@_str_0 = constant [2 x i8] c"1\00"
@_str_1 = constant [2 x i8] c"0\00"
@_str_2 = constant [2 x i8] c"\0a\00"
define i32 @main(){
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  %l8 = alloca i32
  store i32 48, i32* %l1
  store i32 1, i32* %l2
  br label %b3

b3:
  %l6 = load i32, i32* %l2
  %l7 = icmp slt i32 %l6, 12
  br i1 %l7, label %b4, label %b5

b4:
  store i32 0, i32* %l8
  br label %b9

b9:
  br i1 1, label %b10, label %b11

b10:
  %l15 = load i32, i32* %l8
  %l16 = srem i32 %l15, 3
  %l17 = icmp eq i32 %l16, 1
  br i1 %l17, label %b12, label %b14

b12:
  %l18 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l18)
  br label %b13

b14:
  %l19 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l19)
  br label %b13

b13:
  %l20 = load i32, i32* %l8
  %l21 = add i32 %l20, 1
  store i32 %l21, i32* %l8
  %l24 = load i32, i32* %l2
  %l25 = mul i32 2, %l24
  %l26 = sub i32 %l25, 1
  %l27 = load i32, i32* %l8
  %l28 = icmp sge i32 %l27, %l26
  br i1 %l28, label %b22, label %b23

b22:
  br label %b11

b23:
  br label %b9

b11:
  %l29 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l29)
  %l30 = load i32, i32* %l2
  %l31 = add i32 %l30, 1
  store i32 %l31, i32* %l2
  br label %b3

b5:
  ret i32 0
}
