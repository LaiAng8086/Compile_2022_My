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
  br i1 %l6, label %b3, label %b4

b3:
  ret i32 1

b4:
  %l9 = load i32, i32* %l2
  %l10 = icmp eq i32 %l9, 2
  br i1 %l10, label %b7, label %b8

b7:
  ret i32 2

b8:
  %l11 = load i32, i32* %l2
  %l12 = sub i32 %l11, 1
  %l13 = call i32 @fib(i32 %l12)
  %l14 = load i32, i32* %l2
  %l15 = sub i32 %l14, 2
  %l16 = call i32 @fib(i32 %l15)
  %l17 = add i32 %l13, %l16
  ret i32 %l17
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
  br label %b24

b24:
  %l27 = load i32, i32* %l1
  %l28 = icmp sle i32 %l27, 100
  br i1 %l28, label %b25, label %b26

b25:
  %l29 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 0
  %l30 = load i32, i32* %l23
  %l31 = load i32, i32* %l23
  %l32 = mul i32 %l30, %l31
  %l33 = load i32, i32* %l29
  %l34 = add i32 %l33, %l32
  %l35 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 0
  store i32 %l34, i32* %l35
  %l36 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 1
  %l37 = load i32, i32* %l23
  %l38 = load i32, i32* %l23
  %l39 = mul i32 %l37, %l38
  %l40 = load i32, i32* %l36
  %l41 = add i32 %l40, %l39
  %l42 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 1
  store i32 %l41, i32* %l42
  %l43 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 2
  %l44 = load i32, i32* %l23
  %l45 = load i32, i32* %l23
  %l46 = mul i32 %l44, %l45
  %l47 = load i32, i32* %l43
  %l48 = add i32 %l47, %l46
  %l49 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 2
  store i32 %l48, i32* %l49
  %l50 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 3
  %l51 = load i32, i32* %l23
  %l52 = load i32, i32* %l23
  %l53 = mul i32 %l51, %l52
  %l54 = load i32, i32* %l50
  %l55 = add i32 %l54, %l53
  %l56 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 3
  store i32 %l55, i32* %l56
  %l57 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 4
  %l58 = load i32, i32* %l23
  %l59 = load i32, i32* %l23
  %l60 = mul i32 %l58, %l59
  %l61 = load i32, i32* %l57
  %l62 = add i32 %l61, %l60
  %l63 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 4
  store i32 %l62, i32* %l63
  %l64 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 5
  %l65 = load i32, i32* %l23
  %l66 = load i32, i32* %l23
  %l67 = mul i32 %l65, %l66
  %l68 = load i32, i32* %l64
  %l69 = add i32 %l68, %l67
  %l70 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 5
  store i32 %l69, i32* %l70
  %l71 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 6
  %l72 = load i32, i32* %l23
  %l73 = load i32, i32* %l23
  %l74 = mul i32 %l72, %l73
  %l75 = load i32, i32* %l71
  %l76 = add i32 %l75, %l74
  %l77 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 6
  store i32 %l76, i32* %l77
  %l78 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 7
  %l79 = load i32, i32* %l23
  %l80 = load i32, i32* %l23
  %l81 = mul i32 %l79, %l80
  %l82 = load i32, i32* %l78
  %l83 = add i32 %l82, %l81
  %l84 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 7
  store i32 %l83, i32* %l84
  %l85 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 8
  %l86 = load i32, i32* %l23
  %l87 = load i32, i32* %l23
  %l88 = mul i32 %l86, %l87
  %l89 = load i32, i32* %l85
  %l90 = add i32 %l89, %l88
  %l91 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 8
  store i32 %l90, i32* %l91
  %l92 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 9
  %l93 = load i32, i32* %l23
  %l94 = load i32, i32* %l23
  %l95 = mul i32 %l93, %l94
  %l96 = load i32, i32* %l92
  %l97 = add i32 %l96, %l95
  %l98 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 9
  store i32 %l97, i32* %l98
  %l99 = load i32, i32* %l1
  %l100 = add i32 %l99, 1
  store i32 %l100, i32* %l1
  br label %b24

b26:
  store i32 0, i32* %l1
  br label %b101

b101:
  %l104 = load i32, i32* %l1
  %l105 = icmp slt i32 %l104, 10
  br i1 %l105, label %b102, label %b103

b102:
  %l106 = load i32, i32* %l1
  %l107 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 %l106
  %l108 = load i32, i32* %l107
  call void @putint(i32 %l108)
  %l109 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l109)
  %l110 = load i32, i32* %l1
  %l111 = add i32 %l110, 1
  store i32 %l111, i32* %l1
  br label %b101

b103:
  %l112 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l112)
  %l113 = load i32, i32* %l1
  call void @putint(i32 %l113)
  %l114 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l114)
  %l115 = load i32, i32* %l2
  call void @putint(i32 %l115)
  %l116 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l116)
  %l117 = load i32, i32* %l23
  call void @putint(i32 %l117)
  %l118 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l118)
  ret i32 0
}
