declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@_str_0 = constant [2 x i8] c"\0a\00"
define i32 @main(){
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  %l3 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  store i32 1, i32* %l3
  store i32 5, i32* %l1
  store i32 5, i32* %l2
  store i32 -2, i32* %l4
  store i32 2, i32* %l5
  %l9 = load i32, i32* %l1
  %l10 = load i32, i32* %l2
  %l11 = add i32 %l9, %l10
  %l12 = load i32, i32* %l3
  %l13 = add i32 %l11, %l12
  %l14 = load i32, i32* %l4
  %l15 = add i32 %l13, %l14
  %l16 = icmp eq i32 %l15, 10
  br i1 %l16, label %b6, label %b8

b6:
  %l17 = load i32, i32* %l5
  %l18 = add i32 %l17, 1
  store i32 %l18, i32* %l5
  br label %b7

b8:
  %l22 = load i32, i32* %l1
  %l23 = load i32, i32* %l2
  %l24 = add i32 %l22, %l23
  %l25 = load i32, i32* %l3
  %l26 = add i32 %l24, %l25
  %l27 = load i32, i32* %l4
  %l28 = add i32 %l26, %l27
  %l29 = icmp eq i32 %l28, 8
  br i1 %l29, label %b19, label %b21

b19:
  %l30 = load i32, i32* %l5
  %l31 = add i32 %l30, 2
  store i32 %l31, i32* %l5
  br label %b20

b21:
  %l32 = load i32, i32* %l5
  %l33 = add i32 %l32, 4
  store i32 %l33, i32* %l5
  br label %b20

b20:
  br label %b7

b7:
  %l34 = load i32, i32* %l5
  call void @putint(i32 %l34)
  %l35 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l35)
  ret i32 0
}
