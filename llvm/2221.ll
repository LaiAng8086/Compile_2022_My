declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@_str_0 = constant [5 x i8] c"True\00"
@_str_1 = constant [6 x i8] c"False\00"
define i32 @fun(i32 %l1){
b0:
  %l2 = alloca i32
  %l3 = alloca i32
  %l4 = alloca i32
  store i32 %l1, i32* %l2
  store i32 1, i32* %l3
  store i32 0, i32* %l4
  %l8 = load i32, i32* %l4
  %l9 = icmp eq i32 %l8, -3
  br i1 %l9, label %b5, label %b7

b5:
  store i32 1, i32* %l3
  br label %b6

b7:
  store i32 0, i32* %l3
  br label %b6

b6:
  %l10 = load i32, i32* %l3
  ret i32 %l10
}
define i32 @main(){
b0:
  %l1 = alloca i32
  store i32 1, i32* %l1
  %l2 = call i32 @getint()
  store i32 %l2, i32* %l1
  %l5 = load i32, i32* %l1
  %l6 = icmp eq i32 %l5, 1
  br i1 %l6, label %b3, label %b4

b3:
  %l7 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l7)
  br label %b4

b4:
  %l10 = load i32, i32* %l1
  %l11 = icmp ne i32 %l10, 0
  %l12 = xor i1 %l11, 1
  %l13 = zext i1 %l12 to i32
  %l14 = icmp ne i32 %l13, 0
  br i1 %l14, label %b8, label %b9

b8:
  %l15 = getelementptr inbounds [6 x i8], [6 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l15)
  br label %b9

b9:
  %l17 = call i32 @fun(i32 1)
  store i32 %l17, i32* %l16
  ret i32 0
}
