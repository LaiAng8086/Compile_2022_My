declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@N = constant i32 10
@a = global [10 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9]
@_str_0 = constant [3 x i8] c", \00"
@_str_1 = constant [2 x i8] c"\0a\00"
@_str_2 = constant [3 x i8] c", \00"
@_str_3 = constant [3 x i8] c", \00"
@_str_4 = constant [2 x i8] c"\0a\00"
define i32 @fib(i32 %l1){
b0:
  %l2 = alloca i32
  store i32 %l1, i32* %l2
  %l5 = load i32, i32* %l2
  %l6 = icmp eq i32 %l5, 1

b3:
  ret i32 1

b4:
  %l9 = load i32, i32* %l2
  %l10 = icmp eq i32 %l9, 2

b7:
  ret i32 2

b8:
  %l11 = load i32, i32* %l2
  %l12 = sub i32 %l11, 1
  %l13 = call i32 @fib(i32 %l12)
  %l14 = sub i32 %l11, 2
  %l15 = call i32 @fib(i32 %l14)
  %l16 = add i32 %l13, %l15
  ret i32 %l16
}
define i32 @main(){
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  %l23 = alloca i32
  store i32 2, i32* %l1
  store i32 5, i32* %l2
  %l3 = call i32 @getint()
  store i32 %l3, i32* %l1
  %l4 = call i32 @getint()
  store i32 %l4, i32* %l2
  %l5 = load i32, i32* %l1
  %l6 = load i32, i32* %l2
  %l7 = mul i32 %l5, %l6
  %l8 = sub i32 0, %l7
  %l9 = call i32 @fib(i32 4)
  %l10 = mul i32 %l8, %l9
  %l11 = add i32 %l10, 0
  %l12 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 1
  %l13 = load i32, i32* %l12
  %l14 = mul i32 %l13, 1
  %l15 = add i32 %l11, %l14
  %l16 = sub i32 %l15, 0
  %l17 = mul i32 %l16, 5
  store i32 %l17, i32* %l1
  %l18 = call i32 @fib(i32 5)
  %l19 = add i32 %l18, 2
  %l20 = call i32 @fib(i32 %l19)
  %l21 = sub i32 1197, %l20
  %l22 = add i32 %l21, -10091
  store i32 %l22, i32* %l2
  store i32 -6, i32* %l23

b24:
  %l27 = load i32, i32* %l1
  %l28 = icmp sle i32 %l27, 100

b25:
  %l29 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 0
  %l30 = load i32, i32* %l23
  %l31 = mul i32 %l30, %l30
  %l32 = load i32, i32* %l29
  %l33 = add i32 %l32, %l31
  store i32 %l33, i32* %l29
  %l35 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 1
  %l37 = load i32, i32* %l35
  %l38 = add i32 %l37, %l31
  store i32 %l38, i32* %l35
  %l40 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 2
  %l42 = load i32, i32* %l40
  %l43 = add i32 %l42, %l31
  store i32 %l43, i32* %l40
  %l45 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 3
  %l47 = load i32, i32* %l45
  %l48 = add i32 %l47, %l31
  store i32 %l48, i32* %l45
  %l50 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 4
  %l52 = load i32, i32* %l50
  %l53 = add i32 %l52, %l31
  store i32 %l53, i32* %l50
  %l55 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 5
  %l57 = load i32, i32* %l55
  %l58 = add i32 %l57, %l31
  store i32 %l58, i32* %l55
  %l60 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 6
  %l62 = load i32, i32* %l60
  %l63 = add i32 %l62, %l31
  store i32 %l63, i32* %l60
  %l65 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 7
  %l67 = load i32, i32* %l65
  %l68 = add i32 %l67, %l31
  store i32 %l68, i32* %l65
  %l70 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 8
  %l72 = load i32, i32* %l70
  %l73 = add i32 %l72, %l31
  store i32 %l73, i32* %l70
  %l75 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 9
  %l77 = load i32, i32* %l75
  %l78 = add i32 %l77, %l31
  store i32 %l78, i32* %l75
  %l80 = load i32, i32* %l1
  %l81 = add i32 %l80, 1
  store i32 %l81, i32* %l1

b26:
  store i32 0, i32* %l1

b82:
  %l85 = load i32, i32* %l1
  %l86 = icmp slt i32 %l85, 10

b83:
  %l87 = load i32, i32* %l1
  %l88 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 %l87
  %l89 = load i32, i32* %l88
  call void @putint(i32 %l89)
  %l90 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l90)
  %l91 = add i32 %l87, 1
  store i32 %l91, i32* %l1

b84:
  %l92 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l92)
  %l93 = load i32, i32* %l1
  call void @putint(i32 %l93)
  %l94 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l94)
  %l95 = load i32, i32* %l2
  call void @putint(i32 %l95)
  %l96 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l96)
  %l97 = load i32, i32* %l23
  call void @putint(i32 %l97)
  %l98 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l98)
  ret i32 0
}
