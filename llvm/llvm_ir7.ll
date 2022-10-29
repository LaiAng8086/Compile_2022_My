declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@_str_0 = constant [2 x i8] c"\0a\00"
define i32 @foo1(i32 %l1, i32 %l3){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  %l5 = load i32, i32* %l2
  %l6 = load i32, i32* %l4
  %l7 = add i32 %l5, %l6
  ret i32 %l7
}
define i32 @foo2(i32 %l1, i32 %l3, i32 %l5, i32 %l7){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  %l8 = alloca i32
  %l9 = alloca i32
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  store i32 %l7, i32* %l8
  %l10 = load i32, i32* %l2
  %l11 = load i32, i32* %l4
  %l12 = mul i32 %l10, %l11
  %l13 = load i32, i32* %l6
  %l14 = load i32, i32* %l8
  %l15 = sdiv i32 %l13, %l14
  %l16 = add i32 %l12, %l15
  %l17 = load i32, i32* %l8
  %l18 = load i32, i32* %l6
  %l19 = add i32 %l17, %l18
  %l20 = load i32, i32* %l4
  %l21 = add i32 %l19, %l20
  %l22 = load i32, i32* %l2
  %l23 = add i32 %l21, %l22
  %l24 = call i32 @foo1(i32 %l16, i32 %l23)
  store i32 %l24, i32* %l9
  %l25 = load i32, i32* %l9
  ret i32 %l25
}
define i32 @main(){
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  %l3 = alloca i32
  %l4 = alloca i32
  %l5 = call i32 @getint()
  store i32 %l5, i32* %l1
  %l6 = call i32 @getint()
  store i32 %l6, i32* %l2
  %l7 = call i32 @getint()
  store i32 %l7, i32* %l3
  %l8 = call i32 @getint()
  store i32 %l8, i32* %l4
  %l9 = load i32, i32* %l1
  %l10 = load i32, i32* %l2
  %l11 = load i32, i32* %l3
  %l12 = load i32, i32* %l4
  %l13 = call i32 @foo2(i32 %l9, i32 %l10, i32 %l11, i32 %l12)
  call void @putint(i32 %l13)
  %l14 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l14)
  ret i32 0
}
