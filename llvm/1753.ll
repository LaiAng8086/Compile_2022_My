declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@u = global i32 0
@v = global i32 6
@s = global i32 9
@dim_2 = global [3 x [3 x i32]] zeroinitializer
@array = global [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 2, i32 4]]
@_str_0 = constant [10 x i8] c"20373394\0a\00"
@_str_1 = constant [5 x i8] c"a = \00"
@_str_2 = constant [2 x i8] c"\0a\00"
@_str_3 = constant [5 x i8] c"b = \00"
@_str_4 = constant [2 x i8] c"\0a\00"
@_str_5 = constant [8 x i8] c"first: \00"
@_str_6 = constant [9 x i8] c"first : \00"
@_str_7 = constant [2 x i8] c"\0a\00"
@_str_8 = constant [11 x i8] c" is not 2\0a\00"
@_str_9 = constant [6 x i8] c"xxxx\0a\00"
define i32 @add_three(i32 %l1, i32* %l3, i32 %l4){
b0:
  %l2 = alloca i32
  %l5 = alloca i32
  %l6 = getelementptr i32, i32* %l3, i32 0
  %l8 = load i32, i32* %l6
  %l9 = add i32 %l1, %l8
  %l11 = add i32 %l9, %l4
  store i32 %l1, i32* %l2
  store i32 %l4, i32* %l5
  ret i32 %l11
}
define i32 @add1(i32 %l1, i32 %l3){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  %l8 = add i32 %l1, %l3
  %l9 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l9)
  %l10 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l10)
  call void @putint(i32 %l1)
  %l11 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l11)
  %l12 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l12)
  call void @putint(i32 %l3)
  %l13 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l13)
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l8, i32* %l5
  ret i32 %l8
}
define i32 @addmmm(i32 %l1, i32 %l3, i32 %l5){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  %l9 = add i32 %l1, %l3
  %l11 = add i32 %l9, %l5
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  ret i32 %l11
}
define i32 @add(){
b0:
  ret i32 99
}
define void @printarrrr([2 x i32]* %l1){
b0:
  %l2 = getelementptr [2 x i32], [2 x i32]* %l1, i32 0, i32 0
  %l3 = getelementptr inbounds [8 x i8], [8 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l3)
  %l4 = load i32, i32* %l2
  call void @putint(i32 %l4)
  ret void
}
define void @printarr(i32* %l1, i32* %l2){
b0:
  %l3 = getelementptr i32, i32* %l1, i32 0
  %l4 = getelementptr inbounds [9 x i8], [9 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l4)
  %l5 = load i32, i32* %l3
  call void @putint(i32 %l5)
  ret void
}
define i32 @main(){
b0:
  %l1 = alloca [7 x i32]
  %l9 = alloca [2 x i32]
  %l12 = alloca [1 x i32]
  %l14 = alloca [2 x [2 x i32]]
  %l45 = alloca i32
  %l46 = alloca i32
  %l66 = alloca i32
  %l67 = alloca i32
  %l2 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 0
  store i32 1, i32* %l2
  %l3 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 1
  store i32 2, i32* %l3
  %l4 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 2
  store i32 3, i32* %l4
  %l5 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 3
  store i32 4, i32* %l5
  %l6 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 4
  store i32 5, i32* %l6
  %l7 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 5
  store i32 7, i32* %l7
  %l8 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 6
  store i32 8, i32* %l8
  %l10 = getelementptr [2 x i32], [2 x i32]* %l9, i32 0, i32 0
  store i32 2, i32* %l10
  %l11 = getelementptr [2 x i32], [2 x i32]* %l9, i32 0, i32 1
  store i32 6, i32* %l11
  %l13 = getelementptr [1 x i32], [1 x i32]* %l12, i32 0, i32 0
  store i32 1, i32* %l13
  %l17 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l14, i32 0, i32 0, i32 0
  store i32 1, i32* %l17
  %l18 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l14, i32 0, i32 0, i32 1
  store i32 2, i32* %l18
  %l19 = load i32, i32* %l2
  %l20 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l14, i32 0, i32 1, i32 0
  store i32 %l19, i32* %l20
  %l21 = load i32, i32* %l3
  %l22 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l14, i32 0, i32 1, i32 1
  store i32 %l21, i32* %l22
  br label %b25

b26:
  br label %b23

b23:
  %l27 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 1
  store i32 3, i32* %l27
  br label %b24

b25:
  br label %b28

b30:
  br label %b29

b28:
  %l33 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 0
  %l34 = load i32, i32* %l33
  %l35 = add i32 %l34, 99
  %l36 = icmp slt i32 %l35, 99
  br i1 %l36, label %b31, label %b32

b31:
  %l37 = call i32 @add()
  %l38 = sdiv i32 99, %l37
  %l39 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 1
  store i32 %l38, i32* %l39
  br label %b32

b32:
  br label %b29

b29:
  br label %b24

b24:
  %l40 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 1
  %l41 = load i32, i32* %l40
  %l42 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 2
  %l43 = load i32, i32* %l42
  %l44 = call i32 @add1(i32 %l41, i32 %l43)
  %l47 = call i32 @getint()
  %l49 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @array, i32 0, i32 0, i32 1
  %l50 = load i32, i32* %l49
  %l51 = call i32 @add1(i32 %l47, i32 %l50)
  %l52 = sub i32 0, %l47
  %l54 = load i32, i32* %l49
  %l55 = call i32 @add1(i32 %l52, i32 %l54)
  %l56 = call i32 @add1(i32 %l47, i32 1)
  %l57 = call i32 @addmmm(i32 1, i32 2, i32 3)
  %l58 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 3
  %l59 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 5
  %l60 = call i32 @add()
  %l61 = load i32, i32* %l59
  %l62 = mul i32 %l61, %l60
  %l63 = load i32, i32* %l58
  %l64 = sub i32 %l63, %l62
  store i32 %l64, i32* %l58
  %l68 = load i32, i32* %l66
  %l69 = sub i32 0, %l68
  %l70 = call i32 @add()
  %l71 = call i32 @add1(i32 1, i32 3)
  %l72 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 0
  %l74 = load i32, i32* %l72
  store i32 0, i32* %l66
  store i32 %l47, i32* %l45
  store i32 %l69, i32* %l67
  br label %b76

b76:
  br label %b77

b77:
  br label %b80

b80:
  br label %b81

b81:
  %l87 = load i32, i32* %l66
  %l88 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 %l87
  %l89 = load i32, i32* %l88
  %l90 = icmp eq i32 %l89, 2
  br i1 %l90, label %b86, label %b85

b86:
  %l91 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 0
  %l92 = load i32, i32* %l91
  %l93 = icmp sgt i32 %l92, 0
  br i1 %l93, label %b83, label %b85

b83:
  %l94 = load i32, i32* %l66
  %l95 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 %l94
  %l96 = load i32, i32* %l95
  call void @putint(i32 %l96)
  %l97 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l97)
  br label %b84

b85:
  br label %b84

b84:
  %l100 = load i32, i32* %l66
  %l101 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 %l100
  %l102 = load i32, i32* %l101
  %l103 = icmp ne i32 %l102, 2
  br i1 %l103, label %b98, label %b99

b98:
  %l104 = load i32, i32* %l66
  %l105 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 %l104
  %l106 = load i32, i32* %l105
  call void @putint(i32 %l106)
  %l107 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l107)
  br label %b99

b99:
  %l108 = getelementptr inbounds [6 x i8], [6 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l108)
  %l109 = load i32, i32* %l66
  %l110 = add i32 %l109, 1
  %l116 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 %l110
  %l117 = load i32, i32* %l116
  %l118 = sub i32 0, %l117
  %l119 = icmp sge i32 %l118, 0
  store i32 %l110, i32* %l66
  br i1 %l119, label %b111, label %b114

b114:
  %l121 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 0
  %l122 = load i32, i32* %l121
  %l123 = icmp sle i32 %l122, 0
  br i1 %l123, label %b120, label %b113

b120:
  br label %b111

b111:
  %l124 = load i32, i32* %l66
  %l125 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 %l124
  %l126 = load i32, i32* %l125
  %l127 = mul i32 %l126, 3
  store i32 %l127, i32* %l125
  br label %b82

b113:
  br label %b80

b112:
  br label %b80

b82:
  %l129 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @array, i32 0, i32 0, i32 0
  %l130 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @array, i32 0, i32 1, i32 0
  call void @printarr(i32* %l129, i32* %l130)
  %l132 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @array, i32 0, i32 0
  call void @printarrrr([2 x i32]* %l132)
  ret i32 0
}
