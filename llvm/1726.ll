declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@a = constant i32 1
@b = constant i32 2
@c = constant i32 2
@d = constant i32 3
@e = constant i32 0
@f = constant i32 0
@g = constant i32 1
@h = constant i32 -1
@l = constant i32 7800451
@o = constant i32 0
@p = constant i32 3
@q = constant i32 1965
@qq = constant i32 1965
@qqq = constant i32 1965
@arr = constant [3 x i32] [i32 0, i32 -45, i32 0]
@brr = constant [3 x [1 x i32]] [[1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1]]
@awa = global i32 0
@awd = global i32 141
@crr = global [2 x [3 x i32]] [[3 x i32] [i32 -389617, i32 228, i32 -22], [3 x i32] [i32 16, i32 4, i32 10]]
@drr = global [1 x [2 x i32]] [[2 x i32] [i32 141, i32 116]]
@err = global [2 x i32] [i32 225, i32 747]
@_str_0 = constant [10 x i8] c"20231204\0a\00"
@_str_1 = constant [12 x i8] c"awadwad is \00"
@_str_2 = constant [6 x i8] c" now\0a\00"
@_str_3 = constant [30 x i8] c"awadwad has changed in block\0a\00"
@_str_4 = constant [12 x i8] c"awadwad is \00"
@_str_5 = constant [6 x i8] c" now\0a\00"
@_str_6 = constant [11 x i8] c"double if\0a\00"
@_str_7 = constant [20 x i8] c"cur val in loop is \00"
@_str_8 = constant [2 x i8] c"\0a\00"
@_str_9 = constant [96 x i8] c"input n and the array which length is n, then will sort this array, n is required less than 20\0a\00"
@_str_10 = constant [27 x i8] c"after sort, the array is: \00"
@_str_11 = constant [2 x i8] c" \00"
@_str_12 = constant [4 x i8] c"414\00"
@_str_13 = constant [4 x i8] c"414\00"
define void @foo1(){
b0:
  ret void
  ret void
  ret void
}
define void @foo2(i32 %l1){
b0:
  %l2 = alloca i32
  store i32 %l1, i32* %l2
  ret void
}
define void @mqsort(i32 %l1, i32 %l3, i32* %l5){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l11 = alloca i32
  %l18 = alloca i32
  %l20 = alloca i32
  %l57 = alloca i32
  %l10 = icmp sge i32 %l1, %l3
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  br i1 %l10, label %b6, label %b7

b6:
  ret void

b7:
  %l12 = load i32, i32* %l2
  %l13 = load i32, i32* %l4
  %l14 = add i32 %l12, %l13
  %l15 = sdiv i32 %l14, 2
  %l16 = getelementptr i32, i32* %l5, i32 %l15
  %l17 = load i32, i32* %l16
  %l19 = sub i32 %l12, 1
  %l21 = add i32 %l13, 1
  store i32 %l17, i32* %l11
  store i32 %l21, i32* %l20
  store i32 %l19, i32* %l18
  br label %b22

b22:
  %l25 = load i32, i32* %l18
  %l26 = load i32, i32* %l20
  %l27 = icmp slt i32 %l25, %l26
  br i1 %l27, label %b23, label %b24

b23:
  %l28 = load i32, i32* %l18
  %l29 = add i32 %l28, 1
  store i32 %l29, i32* %l18
  br label %b30

b30:
  %l33 = load i32, i32* %l18
  %l34 = getelementptr i32, i32* %l5, i32 %l33
  %l35 = load i32, i32* %l34
  %l36 = load i32, i32* %l11
  %l37 = icmp slt i32 %l35, %l36
  br i1 %l37, label %b31, label %b32

b31:
  %l38 = load i32, i32* %l18
  %l39 = add i32 %l38, 1
  store i32 %l39, i32* %l18
  br label %b30

b32:
  %l40 = load i32, i32* %l20
  %l41 = sub i32 %l40, 1
  store i32 %l41, i32* %l20
  br label %b42

b42:
  %l45 = load i32, i32* %l20
  %l46 = getelementptr i32, i32* %l5, i32 %l45
  %l47 = load i32, i32* %l46
  %l48 = load i32, i32* %l11
  %l49 = icmp sgt i32 %l47, %l48
  br i1 %l49, label %b43, label %b44

b43:
  %l50 = load i32, i32* %l20
  %l51 = sub i32 %l50, 1
  store i32 %l51, i32* %l20
  br label %b42

b44:
  %l54 = load i32, i32* %l18
  %l55 = load i32, i32* %l20
  %l56 = icmp slt i32 %l54, %l55
  br i1 %l56, label %b52, label %b53

b52:
  %l58 = load i32, i32* %l18
  %l59 = getelementptr i32, i32* %l5, i32 %l58
  %l60 = load i32, i32* %l59
  %l61 = load i32, i32* %l20
  %l62 = getelementptr i32, i32* %l5, i32 %l61
  %l63 = load i32, i32* %l62
  store i32 %l63, i32* %l59
  store i32 %l60, i32* %l62
  store i32 %l60, i32* %l57
  br label %b53

b53:
  br label %b22

b24:
  %l67 = load i32, i32* %l2
  %l68 = load i32, i32* %l20
  call void @mqsort(i32 %l67, i32 %l68, i32* %l5)
  %l70 = add i32 %l68, 1
  %l71 = load i32, i32* %l4
  call void @mqsort(i32 %l70, i32 %l71, i32* %l5)
  ret void
}
define i32 @foo3(i32 %l1, i32 %l3){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l7 = add i32 %l1, %l3
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  ret i32 %l7
}
define void @mqsort2(i32 %l1, i32 %l3, [20 x i32]* %l5){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l11 = alloca i32
  %l18 = alloca i32
  %l20 = alloca i32
  %l57 = alloca i32
  %l10 = icmp sge i32 %l1, %l3
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  br i1 %l10, label %b6, label %b7

b6:
  ret void

b7:
  %l12 = load i32, i32* %l2
  %l13 = load i32, i32* %l4
  %l14 = add i32 %l12, %l13
  %l15 = sdiv i32 %l14, 2
  %l16 = getelementptr [20 x i32], [20 x i32]* %l5, i32 1, i32 %l15
  %l17 = load i32, i32* %l16
  %l19 = sub i32 %l12, 1
  %l21 = add i32 %l13, 1
  store i32 %l17, i32* %l11
  store i32 %l21, i32* %l20
  store i32 %l19, i32* %l18
  br label %b22

b22:
  %l25 = load i32, i32* %l18
  %l26 = load i32, i32* %l20
  %l27 = icmp slt i32 %l25, %l26
  br i1 %l27, label %b23, label %b24

b23:
  %l28 = load i32, i32* %l18
  %l29 = add i32 %l28, 1
  store i32 %l29, i32* %l18
  br label %b30

b30:
  %l33 = load i32, i32* %l18
  %l34 = getelementptr [20 x i32], [20 x i32]* %l5, i32 1, i32 %l33
  %l35 = load i32, i32* %l34
  %l36 = load i32, i32* %l11
  %l37 = icmp slt i32 %l35, %l36
  br i1 %l37, label %b31, label %b32

b31:
  %l38 = load i32, i32* %l18
  %l39 = add i32 %l38, 1
  store i32 %l39, i32* %l18
  br label %b30

b32:
  %l40 = load i32, i32* %l20
  %l41 = sub i32 %l40, 1
  store i32 %l41, i32* %l20
  br label %b42

b42:
  %l45 = load i32, i32* %l20
  %l46 = getelementptr [20 x i32], [20 x i32]* %l5, i32 1, i32 %l45
  %l47 = load i32, i32* %l46
  %l48 = load i32, i32* %l11
  %l49 = icmp sgt i32 %l47, %l48
  br i1 %l49, label %b43, label %b44

b43:
  %l50 = load i32, i32* %l20
  %l51 = sub i32 %l50, 1
  store i32 %l51, i32* %l20
  br label %b42

b44:
  %l54 = load i32, i32* %l18
  %l55 = load i32, i32* %l20
  %l56 = icmp slt i32 %l54, %l55
  br i1 %l56, label %b52, label %b53

b52:
  %l58 = load i32, i32* %l18
  %l59 = getelementptr [20 x i32], [20 x i32]* %l5, i32 1, i32 %l58
  %l60 = load i32, i32* %l59
  %l61 = load i32, i32* %l20
  %l62 = getelementptr [20 x i32], [20 x i32]* %l5, i32 1, i32 %l61
  %l63 = load i32, i32* %l62
  store i32 %l63, i32* %l59
  store i32 %l60, i32* %l62
  store i32 %l60, i32* %l57
  br label %b53

b53:
  br label %b22

b24:
  %l67 = load i32, i32* %l2
  %l68 = load i32, i32* %l20
  call void @mqsort2(i32 %l67, i32 %l68, [20 x i32]* %l5)
  %l70 = add i32 %l68, 1
  %l71 = load i32, i32* %l4
  call void @mqsort2(i32 %l70, i32 %l71, [20 x i32]* %l5)
  ret void
}
define i32 @main(){
b0:
  %l1 = alloca i32
  %l6 = alloca i32
  %l11 = alloca i32
  %l30 = alloca i32
  %l46 = alloca i32
  %l67 = alloca i32
  %l69 = alloca [20 x i32]
  %l90 = alloca i32
  %l91 = alloca [2 x [20 x i32]]
  %l178 = alloca i32
  %l2 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  store i32 10, i32* @awa
  call void @putstr(i8* %l2)
  %l3 = getelementptr inbounds [12 x i8], [12 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l3)
  call void @putint(i32 545)
  %l5 = getelementptr inbounds [6 x i8], [6 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l5)
  %l7 = getelementptr inbounds [30 x i8], [30 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l7)
  %l8 = getelementptr inbounds [12 x i8], [12 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l8)
  call void @putint(i32 11)
  %l10 = getelementptr inbounds [6 x i8], [6 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l10)
  store i32 14, i32* %l11
  store i32 545, i32* %l1
  store i32 11, i32* %l6
  br label %b12

b12:
  br label %b13

b13:
  %l18 = load i32, i32* %l11
  %l19 = icmp sgt i32 0, %l18
  br i1 %l19, label %b16, label %b17

b16:
  br label %b17

b17:
  %l22 = load i32, i32* %l11
  %l23 = icmp eq i32 0, %l22
  br i1 %l23, label %b20, label %b21

b20:
  br label %b21

b21:
  %l26 = load i32, i32* %l11
  %l27 = icmp ne i32 %l26, 1
  br i1 %l27, label %b24, label %b25

b24:
  br label %b29

b28:
  %l31 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* @crr, i32 0, i32 0, i32 1
  %l32 = load i32, i32* %l31
  store i32 %l32, i32* %l30
  br label %b29

b29:
  br label %b25

b25:
  %l35 = load i32, i32* %l11
  %l36 = icmp sge i32 78881, %l35
  br i1 %l36, label %b33, label %b34

b33:
  %l39 = load i32, i32* %l11
  %l40 = icmp eq i32 %l39, %l39
  br i1 %l40, label %b37, label %b38

b37:
  %l43 = load i32, i32* %l11
  %l44 = icmp ne i32 %l43, 0
  br i1 %l44, label %b41, label %b42

b41:
  %l45 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l45)
  br label %b42

b42:
  br label %b38

b38:
  br label %b34

b34:
  store i32 11, i32* %l46
  br label %b47

b47:
  %l50 = load i32, i32* %l46
  %l51 = icmp sle i32 %l50, 10000
  br i1 %l51, label %b48, label %b49

b48:
  %l52 = load i32, i32* %l46
  %l53 = add i32 %l52, 1
  %l58 = icmp sgt i32 %l53, 100
  store i32 %l53, i32* %l46
  br i1 %l58, label %b54, label %b56

b54:
  %l59 = getelementptr inbounds [20 x i8], [20 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l59)
  %l60 = load i32, i32* %l46
  call void @putint(i32 %l60)
  %l61 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l61)
  br label %b55

b56:
  br label %b47

b55:
  %l64 = load i32, i32* %l46
  %l65 = icmp eq i32 %l64, 101
  br i1 %l65, label %b62, label %b63

b62:
  br label %b49

b63:
  br label %b47

b49:
  %l66 = getelementptr inbounds [96 x i8], [96 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l66)
  %l68 = call i32 @getint()
  %l70 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 0
  store i32 0, i32* %l70
  %l71 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 1
  store i32 0, i32* %l71
  %l72 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 2
  store i32 0, i32* %l72
  %l73 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 3
  store i32 0, i32* %l73
  %l74 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 4
  store i32 0, i32* %l74
  %l75 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 5
  store i32 0, i32* %l75
  %l76 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 6
  store i32 0, i32* %l76
  %l77 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 7
  store i32 0, i32* %l77
  %l78 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 8
  store i32 0, i32* %l78
  %l79 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 9
  store i32 0, i32* %l79
  %l80 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 10
  store i32 0, i32* %l80
  %l81 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 11
  store i32 0, i32* %l81
  %l82 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 12
  store i32 0, i32* %l82
  %l83 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 13
  store i32 0, i32* %l83
  %l84 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 14
  store i32 0, i32* %l84
  %l85 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 15
  store i32 0, i32* %l85
  %l86 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 16
  store i32 0, i32* %l86
  %l87 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 17
  store i32 0, i32* %l87
  %l88 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 18
  store i32 0, i32* %l88
  %l89 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 19
  store i32 0, i32* %l89
  %l92 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 0
  store i32 0, i32* %l92
  %l93 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 1
  store i32 0, i32* %l93
  %l94 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 2
  store i32 0, i32* %l94
  %l95 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 3
  store i32 0, i32* %l95
  %l96 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 4
  store i32 0, i32* %l96
  %l97 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 5
  store i32 0, i32* %l97
  %l98 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 6
  store i32 0, i32* %l98
  %l99 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 7
  store i32 0, i32* %l99
  %l100 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 8
  store i32 0, i32* %l100
  %l101 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 9
  store i32 0, i32* %l101
  %l102 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 10
  store i32 0, i32* %l102
  %l103 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 11
  store i32 0, i32* %l103
  %l104 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 12
  store i32 0, i32* %l104
  %l105 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 13
  store i32 0, i32* %l105
  %l106 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 14
  store i32 0, i32* %l106
  %l107 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 15
  store i32 0, i32* %l107
  %l108 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 16
  store i32 0, i32* %l108
  %l109 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 17
  store i32 0, i32* %l109
  %l110 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 18
  store i32 0, i32* %l110
  %l111 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 19
  store i32 0, i32* %l111
  %l112 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 0
  store i32 0, i32* %l112
  %l113 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 1
  store i32 0, i32* %l113
  %l114 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 2
  store i32 0, i32* %l114
  %l115 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 3
  store i32 0, i32* %l115
  %l116 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 4
  store i32 0, i32* %l116
  %l117 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 5
  store i32 0, i32* %l117
  %l118 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 6
  store i32 0, i32* %l118
  %l119 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 7
  store i32 0, i32* %l119
  %l120 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 8
  store i32 0, i32* %l120
  %l121 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 9
  store i32 0, i32* %l121
  %l122 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 10
  store i32 0, i32* %l122
  %l123 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 11
  store i32 0, i32* %l123
  %l124 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 12
  store i32 0, i32* %l124
  %l125 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 13
  store i32 0, i32* %l125
  %l126 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 14
  store i32 0, i32* %l126
  %l127 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 15
  store i32 0, i32* %l127
  %l128 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 16
  store i32 0, i32* %l128
  %l129 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 17
  store i32 0, i32* %l129
  %l130 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 18
  store i32 0, i32* %l130
  %l131 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 19
  store i32 0, i32* %l131
  store i32 %l68, i32* %l67
  store i32 0, i32* %l90
  br label %b132

b132:
  %l135 = load i32, i32* %l90
  %l136 = load i32, i32* %l67
  %l137 = icmp slt i32 %l135, %l136
  br i1 %l137, label %b133, label %b134

b133:
  %l138 = load i32, i32* %l90
  %l139 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 %l138
  %l140 = load i32, i32* %l139
  %l141 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 %l138
  store i32 %l140, i32* %l141
  %l142 = add i32 %l138, 1
  store i32 %l142, i32* %l90
  br label %b132

b134:
  store i32 0, i32* %l90
  br label %b143

b143:
  %l146 = load i32, i32* %l90
  %l147 = load i32, i32* %l67
  %l148 = icmp slt i32 %l146, %l147
  br i1 %l148, label %b144, label %b145

b144:
  %l149 = load i32, i32* %l90
  %l150 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 %l149
  %l151 = call i32 @getint()
  store i32 %l151, i32* %l150
  %l152 = add i32 %l149, 1
  store i32 %l152, i32* %l90
  br label %b143

b145:
  %l153 = load i32, i32* %l67
  %l154 = sub i32 %l153, 1
  %l155 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 0
  call void @mqsort(i32 0, i32 %l154, i32* %l155)
  %l157 = getelementptr inbounds [27 x i8], [27 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l157)
  store i32 0, i32* %l90
  br label %b158

b158:
  %l161 = load i32, i32* %l90
  %l162 = load i32, i32* %l67
  %l163 = icmp slt i32 %l161, %l162
  br i1 %l163, label %b159, label %b160

b159:
  %l164 = load i32, i32* %l90
  %l165 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 %l164
  %l166 = load i32, i32* %l165
  call void @putint(i32 %l166)
  %l167 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_11, i32 0, i32 0
  call void @putstr(i8* %l167)
  %l168 = add i32 %l164, 1
  store i32 %l168, i32* %l90
  br label %b158

b160:
  %l169 = getelementptr inbounds [4 x i8], [4 x i8]* @_str_12, i32 0, i32 0
  call void @putstr(i8* %l169)
  %l170 = getelementptr inbounds [4 x i8], [4 x i8]* @_str_13, i32 0, i32 0
  call void @putstr(i8* %l170)
  %l171 = load i32, i32* %l67
  %l172 = sub i32 %l171, 1
  %l173 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0
  call void @mqsort2(i32 0, i32 %l172, [20 x i32]* %l173)
  %l176 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 0
  call void @mqsort(i32 0, i32 %l172, i32* %l176)
  %l179 = getelementptr [2 x i32], [2 x i32]* @err, i32 0, i32 0
  %l180 = load i32, i32* %l179
  %l181 = call i32 @foo3(i32 %l171, i32 %l180)
  %l183 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* @crr, i32 0, i32 0, i32 1
  store i32 %l181, i32* %l183
  %l185 = load i32, i32* %l183
  %l186 = getelementptr [2 x i32], [2 x i32]* @err, i32 0, i32 1
  store i32 %l185, i32* %l186
  %l188 = load i32, i32* %l186
  store i32 %l188, i32* %l183
  store i32 %l181, i32* %l178
  ret i32 0
}
