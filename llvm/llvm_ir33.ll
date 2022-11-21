declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@_str_0 = constant [10 x i8] c"20373361\0a\00"
@_str_1 = constant [5 x i8] c" ia-\00"
@_str_2 = constant [5 x i8] c" aa-\00"
@_str_3 = constant [2 x i8] c"-\00"
@_str_4 = constant [2 x i8] c"-\00"
@_str_5 = constant [5 x i8] c" ab-\00"
@_str_6 = constant [2 x i8] c"-\00"
@_str_7 = constant [2 x i8] c"-\00"
@_str_8 = constant [2 x i8] c"-\00"
@_str_9 = constant [2 x i8] c"\0a\00"
@_str_10 = constant [2 x i8] c" \00"
@_str_11 = constant [2 x i8] c" \00"
@_str_12 = constant [2 x i8] c" \00"
@_str_13 = constant [2 x i8] c" \00"
@_str_14 = constant [2 x i8] c" \00"
@_str_15 = constant [2 x i8] c" \00"
@_str_16 = constant [2 x i8] c" \00"
@_str_17 = constant [2 x i8] c" \00"
@_str_18 = constant [2 x i8] c"\0a\00"
@_str_19 = constant [19 x i8] c"in in block i_a = \00"
@_str_20 = constant [2 x i8] c"\0a\00"
@_str_21 = constant [16 x i8] c"in block i_a = \00"
@_str_22 = constant [2 x i8] c"\0a\00"
@_str_23 = constant [17 x i8] c"out block i_a = \00"
@_str_24 = constant [2 x i8] c"\0a\00"
@_str_25 = constant [3 x i8] c"t\0a\00"
@_str_26 = constant [3 x i8] c"t\0a\00"
@_str_27 = constant [3 x i8] c"t\0a\00"
@_str_28 = constant [2 x i8] c"t\00"
define void @f0(){
b0:
  ret void
}
define i32 @main(){
b0:
  %l2 = alloca [3 x i32]
  %l6 = alloca [2 x [2 x i32]]
  %l34 = alloca i32
  %l35 = alloca i32
  %l36 = alloca [3 x i32]
  %l37 = alloca i32
  %l38 = alloca i32
  %l56 = alloca i32
  %l57 = alloca [1 x i32]
  %l59 = alloca [2 x [1 x i32]]
  %l93 = alloca i32
  %l94 = alloca i32
  %l1 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l1)
  %l3 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0
  store i32 21, i32* %l3
  %l4 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0
  store i32 -2, i32* %l4
  %l5 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0
  store i32 19, i32* %l5
  %l7 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 0
  store i32 1, i32* %l7
  %l8 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 0
  store i32 40, i32* %l8
  %l9 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1
  store i32 6, i32* %l9
  %l10 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1
  store i32 5, i32* %l10
  %l11 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  %l12 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 1
  %l13 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 2
  %l14 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 0, i32 0
  %l15 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 0, i32 1
  %l16 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 0
  %l17 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  call void @putint(i32 1)
  %l18 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l18)
  call void @putint(i32 2)
  %l19 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l19)
  %l20 = load i32, i32* %l11
  call void @putint(i32 %l20)
  %l21 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l21)
  %l22 = load i32, i32* %l12
  call void @putint(i32 %l22)
  %l23 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l23)
  %l24 = load i32, i32* %l13
  call void @putint(i32 %l24)
  %l25 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l25)
  %l26 = load i32, i32* %l14
  call void @putint(i32 %l26)
  %l27 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l27)
  %l28 = load i32, i32* %l15
  call void @putint(i32 %l28)
  %l29 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l29)
  %l30 = load i32, i32* %l16
  call void @putint(i32 %l30)
  %l31 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l31)
  %l32 = load i32, i32* %l17
  call void @putint(i32 %l32)
  %l33 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l33)
  store i32 -10, i32* %l34
  store i32 13, i32* %l37
  %l39 = call i32 @getint()
  store i32 %l39, i32* %l38
  %l40 = load i32, i32* %l38
  %l41 = srem i32 %l40, 3
  %l42 = load i32, i32* %l37
  %l43 = add i32 %l42, %l41
  %l44 = sdiv i32 %l43, 2
  %l45 = getelementptr [3 x i32], [3 x i32]* %l36, i32 0, i32 0
  store i32 %l44, i32* %l45
  %l46 = getelementptr [3 x i32], [3 x i32]* %l36, i32 0, i32 1
  store i32 97, i32* %l46
  %l47 = getelementptr [3 x i32], [3 x i32]* %l36, i32 0, i32 0
  %l48 = getelementptr [3 x i32], [3 x i32]* %l36, i32 0, i32 1
  %l49 = load i32, i32* %l48
  %l50 = sub i32 9, %l49
  %l51 = load i32, i32* %l47
  %l52 = mul i32 %l51, %l50
  %l53 = load i32, i32* %l37
  %l54 = sub i32 %l53, 11
  %l55 = getelementptr [3 x i32], [3 x i32]* %l36, i32 0, i32 %l54
  store i32 %l52, i32* %l55
  store i32 1, i32* %l56
  %l58 = getelementptr [1 x i32], [1 x i32]* %l57, i32 0, i32 0
  store i32 10, i32* %l58
  %l60 = load i32, i32* %l34
  %l61 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %l59, i32 0, i32 0, i32 0
  store i32 %l60, i32* %l61
  %l62 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %l59, i32 0, i32 1, i32 0
  store i32 -9, i32* %l62
  %l63 = call i32 @getint()
  store i32 %l63, i32* %l35
  %l64 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %l59, i32 0, i32 1, i32 0
  %l65 = load i32, i32* %l64
  %l66 = sub i32 %l65, 1
  %l67 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %l59, i32 0, i32 1, i32 0
  store i32 %l66, i32* %l67
  %l68 = getelementptr [3 x i32], [3 x i32]* %l36, i32 0, i32 0
  %l69 = getelementptr [3 x i32], [3 x i32]* %l36, i32 0, i32 1
  %l70 = getelementptr [3 x i32], [3 x i32]* %l36, i32 0, i32 2
  %l71 = getelementptr [1 x i32], [1 x i32]* %l57, i32 0, i32 0
  %l72 = getelementptr [1 x i32], [1 x i32]* %l57, i32 0, i32 0
  %l73 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %l59, i32 0, i32 0, i32 0
  %l74 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* %l59, i32 0, i32 1, i32 0
  %l75 = load i32, i32* %l35
  call void @putint(i32 %l75)
  %l76 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l76)
  %l77 = load i32, i32* %l56
  call void @putint(i32 %l77)
  %l78 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_11, i32 0, i32 0
  call void @putstr(i8* %l78)
  %l79 = load i32, i32* %l68
  call void @putint(i32 %l79)
  %l80 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_12, i32 0, i32 0
  call void @putstr(i8* %l80)
  %l81 = load i32, i32* %l69
  call void @putint(i32 %l81)
  %l82 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_13, i32 0, i32 0
  call void @putstr(i8* %l82)
  %l83 = load i32, i32* %l70
  call void @putint(i32 %l83)
  %l84 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_14, i32 0, i32 0
  call void @putstr(i8* %l84)
  %l85 = load i32, i32* %l71
  call void @putint(i32 %l85)
  %l86 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_15, i32 0, i32 0
  call void @putstr(i8* %l86)
  %l87 = load i32, i32* %l72
  call void @putint(i32 %l87)
  %l88 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_16, i32 0, i32 0
  call void @putstr(i8* %l88)
  %l89 = load i32, i32* %l73
  call void @putint(i32 %l89)
  %l90 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_17, i32 0, i32 0
  call void @putstr(i8* %l90)
  %l91 = load i32, i32* %l74
  call void @putint(i32 %l91)
  %l92 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_18, i32 0, i32 0
  call void @putstr(i8* %l92)
  store i32 100, i32* %l93
  store i32 200, i32* %l94
  %l95 = getelementptr inbounds [19 x i8], [19 x i8]* @_str_19, i32 0, i32 0
  call void @putstr(i8* %l95)
  %l96 = load i32, i32* %l94
  call void @putint(i32 %l96)
  %l97 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_20, i32 0, i32 0
  call void @putstr(i8* %l97)
  call void @f0()
  %l99 = getelementptr inbounds [16 x i8], [16 x i8]* @_str_21, i32 0, i32 0
  call void @putstr(i8* %l99)
  %l100 = load i32, i32* %l93
  call void @putint(i32 %l100)
  %l101 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_22, i32 0, i32 0
  call void @putstr(i8* %l101)
  %l102 = getelementptr inbounds [17 x i8], [17 x i8]* @_str_23, i32 0, i32 0
  call void @putstr(i8* %l102)
  %l103 = load i32, i32* %l35
  call void @putint(i32 %l103)
  %l104 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_24, i32 0, i32 0
  call void @putstr(i8* %l104)
  %l105 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_25, i32 0, i32 0
  call void @putstr(i8* %l105)
  %l106 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_26, i32 0, i32 0
  call void @putstr(i8* %l106)
  %l107 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_27, i32 0, i32 0
  call void @putstr(i8* %l107)
  %l108 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_28, i32 0, i32 0
  call void @putstr(i8* %l108)
  ret i32 0
}
