declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@aaa = constant i32 1
@bbb = constant i32 2
@ccc = constant i32 3
@ggg = constant i32 3
@hhh = constant i32 -1
@iii = constant i32 2
@arr1 = constant [2 x i32] [i32 0, i32 1]
@arr2 = constant [1 x i32] [i32 0]
@arr3 = constant [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4]]
@_str_0 = constant [10 x i8] c"19231240\0a\00"
@_str_1 = constant [2 x i8] c"\0a\00"
@_str_2 = constant [2 x i8] c"\0a\00"
@_str_3 = constant [2 x i8] c"\0a\00"
@_str_4 = constant [2 x i8] c"\0a\00"
@_str_5 = constant [2 x i8] c"\0a\00"
@_str_6 = constant [2 x i8] c"\0a\00"
define void @nothing(){
b0:
  ret void
}
define void @nothing1(i32 %l1){
b0:
  %l2 = alloca i32
  store i32 %l1, i32* %l2
  ret void
}
define void @nothing2(i32 %l1, i32 %l3, i32 %l5){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  ret void
}
define void @nothing3(i32* %l1, [1 x i32]* %l2){
b0:
  ret void
}
define i32 @zero(){
b0:
  ret i32 0
}
define i32 @main(){
b0:
  %l1 = alloca i32
  %l2 = alloca [3 x i32]
  %l6 = alloca [2 x [2 x i32]]
  %l11 = alloca i32
  %l12 = alloca i32
  %l13 = alloca i32
  %l17 = alloca i32
  %l64 = alloca i32
  %l65 = alloca i32
  %l66 = alloca i32
  %l3 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  store i32 0, i32* %l3
  %l4 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 1
  store i32 1, i32* %l4
  %l5 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 2
  store i32 2, i32* %l5
  %l7 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 0, i32 0
  store i32 1, i32* %l7
  %l8 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 0, i32 1
  store i32 2, i32* %l8
  %l9 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 0
  store i32 3, i32* %l9
  %l10 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  store i32 4, i32* %l10
  store i32 2, i32* %l11
  store i32 3, i32* %l12
  %l14 = load i32, i32* %l11
  %l15 = load i32, i32* %l12
  %l16 = add i32 %l14, %l15
  store i32 %l16, i32* %l13
  store i32 0, i32* %l17
  br label %b18

b18:
  br i1 0, label %b19, label %b20

b19:
  %l24 = load i32, i32* %l17
  %l25 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 %l24
  %l26 = load i32, i32* %l25
  %l27 = icmp eq i32 %l26, 3
  br i1 %l27, label %b21, label %b23

b21:
  br label %b20

b23:
  br label %b18

b22:
  %l28 = load i32, i32* %l17
  %l29 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 %l28
  store i32 1, i32* %l29
  %l30 = load i32, i32* %l17
  %l31 = add i32 %l30, 1
  store i32 %l31, i32* %l17
  br label %b18

b20:
  %l32 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 1
  %l33 = load i32, i32* %l32
  %l34 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  store i32 %l33, i32* %l34
  %l38 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  %l39 = load i32, i32* %l38
  %l40 = icmp eq i32 %l39, 1
  br i1 %l40, label %b35, label %b37

b35:
  %l41 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  store i32 1, i32* %l41
  br label %b36

b37:
  %l42 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  store i32 0, i32* %l42
  br label %b36

b36:
  %l43 = call i32 @getint()
  store i32 %l43, i32* %l1
  %l44 = load i32, i32* %l12
  %l45 = load i32, i32* %l13
  %l46 = add i32 %l44, %l45
  store i32 %l46, i32* %l11
  %l47 = load i32, i32* %l12
  %l48 = load i32, i32* %l13
  %l49 = mul i32 %l47, %l48
  store i32 %l49, i32* %l11
  %l50 = load i32, i32* %l12
  %l51 = load i32, i32* %l13
  %l52 = sub i32 %l50, %l51
  store i32 %l52, i32* %l11
  %l53 = load i32, i32* %l12
  %l54 = load i32, i32* %l13
  %l55 = add i32 %l53, %l54
  %l56 = load i32, i32* %l13
  %l57 = add i32 %l55, %l56
  store i32 %l57, i32* %l11
  %l58 = load i32, i32* %l12
  %l59 = sdiv i32 %l58, 1
  store i32 %l59, i32* %l11
  store i32 1, i32* %l13
  %l60 = load i32, i32* %l12
  %l61 = sdiv i32 %l60, 1
  store i32 %l61, i32* %l11
  %l62 = load i32, i32* %l12
  %l63 = srem i32 %l62, 1
  store i32 %l63, i32* %l11
  store i32 1, i32* %l64
  store i32 0, i32* %l65
  %l69 = load i32, i32* %l64
  %l70 = load i32, i32* %l65
  %l71 = add i32 %l69, %l70
  %l72 = icmp ne i32 %l71, 0
  br i1 %l72, label %b67, label %b68

b67:
  store i32 1, i32* %l64
  br label %b68

b68:
  %l75 = load i32, i32* %l65
  %l76 = icmp ne i32 %l75, 0
  %l77 = xor i1 %l76, 1
  %l78 = zext i1 %l77 to i32
  %l79 = icmp ne i32 %l78, 0
  br i1 %l79, label %b73, label %b74

b73:
  store i32 1, i32* %l64
  br label %b74

b74:
  %l82 = load i32, i32* %l64
  %l83 = load i32, i32* %l65
  %l84 = sub i32 %l82, %l83
  %l85 = icmp ne i32 %l84, 0
  br i1 %l85, label %b80, label %b81

b80:
  store i32 1, i32* %l64
  br label %b81

b81:
  %l88 = load i32, i32* %l64
  %l89 = load i32, i32* %l65
  %l90 = icmp slt i32 %l88, %l89
  br i1 %l90, label %b86, label %b87

b86:
  store i32 1, i32* %l64
  br label %b87

b87:
  %l93 = load i32, i32* %l64
  %l94 = load i32, i32* %l65
  %l95 = icmp sle i32 %l93, %l94
  br i1 %l95, label %b91, label %b92

b91:
  store i32 1, i32* %l64
  br label %b92

b92:
  %l98 = load i32, i32* %l64
  %l99 = load i32, i32* %l65
  %l100 = icmp sge i32 %l98, %l99
  br i1 %l100, label %b96, label %b97

b96:
  store i32 1, i32* %l64
  br label %b97

b97:
  %l103 = load i32, i32* %l64
  %l104 = load i32, i32* %l65
  %l105 = icmp ne i32 %l103, %l104
  br i1 %l105, label %b101, label %b102

b101:
  store i32 1, i32* %l64
  br label %b102

b102:
  %l106 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l106)
  %l107 = load i32, i32* %l1
  call void @putint(i32 %l107)
  %l108 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l108)
  %l109 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  %l110 = load i32, i32* %l109
  call void @putint(i32 %l110)
  %l111 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l111)
  %l112 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  %l113 = load i32, i32* %l112
  call void @putint(i32 %l113)
  %l114 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l114)
  %l115 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  %l116 = load i32, i32* %l115
  call void @putint(i32 %l116)
  %l117 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l117)
  %l118 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  %l119 = load i32, i32* %l118
  call void @putint(i32 %l119)
  %l120 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l120)
  %l121 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  %l122 = load i32, i32* %l121
  call void @putint(i32 %l122)
  %l123 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l123)
  ret i32 0
}
