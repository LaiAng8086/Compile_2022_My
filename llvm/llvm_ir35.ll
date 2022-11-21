declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
define i32 @main(){
b0:
  %l1 = alloca [4 x [2 x i32]]
  %l10 = alloca [4 x [2 x i32]]
  %l19 = alloca [4 x [2 x i32]]
  %l28 = alloca [4 x [2 x i32]]
  %l37 = alloca [4 x [2 x i32]]
  %l2 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l1, i32 0, i32 0, i32 0
  store i32 0, i32* %l2
  %l3 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l1, i32 0, i32 0, i32 1
  store i32 0, i32* %l3
  %l4 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l1, i32 0, i32 1, i32 0
  store i32 0, i32* %l4
  %l5 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l1, i32 0, i32 1, i32 1
  store i32 0, i32* %l5
  %l6 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l1, i32 0, i32 2, i32 0
  store i32 0, i32* %l6
  %l7 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l1, i32 0, i32 2, i32 1
  store i32 0, i32* %l7
  %l8 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l1, i32 0, i32 3, i32 0
  store i32 0, i32* %l8
  %l9 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l1, i32 0, i32 3, i32 1
  store i32 0, i32* %l9
  %l11 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l10, i32 0, i32 0
  store i32 1, i32* %l11
  %l12 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l10, i32 0, i32 1
  store i32 2, i32* %l12
  %l13 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l10, i32 0, i32 2
  store i32 3, i32* %l13
  %l14 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l10, i32 0, i32 3
  store i32 4, i32* %l14
  %l15 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l10, i32 0, i32 4
  store i32 5, i32* %l15
  %l16 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l10, i32 0, i32 5
  store i32 6, i32* %l16
  %l17 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l10, i32 0, i32 6
  store i32 7, i32* %l17
  %l18 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l10, i32 0, i32 7
  store i32 8, i32* %l18
  %l20 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l19, i32 0, i32 0, i32 0
  store i32 1, i32* %l20
  %l21 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l19, i32 0, i32 0, i32 1
  store i32 2, i32* %l21
  %l22 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l19, i32 0, i32 1, i32 0
  store i32 3, i32* %l22
  %l23 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l19, i32 0, i32 1, i32 1
  store i32 4, i32* %l23
  %l24 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l19, i32 0, i32 2, i32 0
  store i32 5, i32* %l24
  %l25 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l19, i32 0, i32 2, i32 1
  store i32 6, i32* %l25
  %l26 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l19, i32 0, i32 3, i32 0
  store i32 7, i32* %l26
  %l27 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l19, i32 0, i32 3, i32 1
  store i32 8, i32* %l27
  %l29 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l28, i32 0, i32 0, i32 0
  store i32 1, i32* %l29
  %l30 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l28, i32 0, i32 0, i32 1
  store i32 2, i32* %l30
  %l31 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l28, i32 0, i32 1, i32 0
  store i32 3, i32* %l31
  %l32 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l28, i32 0, i32 1, i32 1
  store i32 0, i32* %l32
  %l33 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l28, i32 0, i32 2, i32 0
  store i32 5, i32* %l33
  %l34 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l28, i32 0, i32 2, i32 1
  store i32 0, i32* %l34
  %l35 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l28, i32 0, i32 3, i32 0
  store i32 7, i32* %l35
  %l36 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l28, i32 0, i32 3, i32 1
  store i32 8, i32* %l36
  %l38 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l28, i32 0, i32 2, i32 1
  %l39 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l19, i32 0, i32 2, i32 1
  %l40 = load i32, i32* %l38
  %l41 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 0, i32 0
  store i32 %l40, i32* %l41
  %l42 = load i32, i32* %l39
  %l43 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 0, i32 1
  store i32 %l42, i32* %l43
  %l44 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 1, i32 0
  store i32 3, i32* %l44
  %l45 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 1, i32 1
  store i32 4, i32* %l45
  %l46 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 2, i32 0
  store i32 5, i32* %l46
  %l47 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 2, i32 1
  store i32 6, i32* %l47
  %l48 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 3, i32 0
  store i32 7, i32* %l48
  %l49 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 3, i32 1
  store i32 8, i32* %l49
  %l50 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 3, i32 1
  %l51 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 0, i32 0
  %l52 = load i32, i32* %l50
  %l53 = load i32, i32* %l51
  %l54 = add i32 %l52, %l53
  %l55 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 0, i32 1
  %l56 = load i32, i32* %l55
  %l57 = add i32 %l54, %l56
  %l58 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l1, i32 0, i32 2, i32 0
  %l59 = load i32, i32* %l58
  %l60 = add i32 %l57, %l59
  call void @putint(i32 %l60)
  %l61 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 3, i32 1
  %l62 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 0, i32 0
  %l63 = load i32, i32* %l61
  %l64 = load i32, i32* %l62
  %l65 = add i32 %l63, %l64
  %l66 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l37, i32 0, i32 0, i32 1
  %l67 = load i32, i32* %l66
  %l68 = add i32 %l65, %l67
  %l69 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %l1, i32 0, i32 2, i32 0
  %l70 = load i32, i32* %l69
  %l71 = add i32 %l68, %l70
  ret i32 %l71
}
