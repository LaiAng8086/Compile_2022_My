declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@_str_0 = constant [11 x i8] c"Move from \00"
@_str_1 = constant [5 x i8] c" to \00"
@_str_2 = constant [2 x i8] c"\0a\00"
@_str_3 = constant [11 x i8] c"Move from \00"
@_str_4 = constant [5 x i8] c" to \00"
@_str_5 = constant [2 x i8] c"\0a\00"
@_str_6 = constant [11 x i8] c"Move from \00"
@_str_7 = constant [5 x i8] c" to \00"
@_str_8 = constant [2 x i8] c"\0a\00"
@_str_9 = constant [11 x i8] c"Move from \00"
@_str_10 = constant [5 x i8] c" to \00"
@_str_11 = constant [2 x i8] c"\0a\00"
@_str_12 = constant [11 x i8] c"Move from \00"
@_str_13 = constant [5 x i8] c" to \00"
@_str_14 = constant [2 x i8] c"\0a\00"
@_str_15 = constant [11 x i8] c"Move from \00"
@_str_16 = constant [5 x i8] c" to \00"
@_str_17 = constant [2 x i8] c"\0a\00"
@_str_18 = constant [11 x i8] c"Move from \00"
@_str_19 = constant [5 x i8] c" to \00"
@_str_20 = constant [2 x i8] c"\0a\00"
@_str_21 = constant [11 x i8] c"Move from \00"
@_str_22 = constant [5 x i8] c" to \00"
@_str_23 = constant [2 x i8] c"\0a\00"
@_str_24 = constant [11 x i8] c"Move from \00"
@_str_25 = constant [5 x i8] c" to \00"
@_str_26 = constant [2 x i8] c"\0a\00"
@_str_27 = constant [2 x i8] c" \00"
@_str_28 = constant [2 x i8] c"\0a\00"
@_str_29 = constant [2 x i8] c" \00"
@_str_30 = constant [2 x i8] c"\0a\00"
@_str_31 = constant [10 x i8] c"19373354\0a\00"
@_str_32 = constant [10 x i8] c"19373354\0a\00"
define void @move(i32 %l1, i32 %l3, i32 %l5, i32 %l7){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  %l8 = alloca i32
  %l12 = icmp eq i32 %l1, 2
  store i32 %l7, i32* %l8
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  br i1 %l12, label %b9, label %b10

b9:
  %l13 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l13)
  %l14 = load i32, i32* %l4
  call void @putint(i32 %l14)
  %l15 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l15)
  %l16 = load i32, i32* %l8
  call void @putint(i32 %l16)
  %l17 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l17)
  %l18 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l18)
  call void @putint(i32 %l14)
  %l19 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l19)
  call void @putint(i32 %l16)
  %l20 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l20)
  ret void

b10:
  %l21 = load i32, i32* %l2
  %l22 = sub i32 %l21, 2
  %l23 = load i32, i32* %l4
  %l24 = load i32, i32* %l8
  %l25 = load i32, i32* %l6
  call void @move(i32 %l22, i32 %l23, i32 %l24, i32 %l25)
  %l27 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l27)
  call void @putint(i32 %l23)
  %l28 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l28)
  call void @putint(i32 %l24)
  %l29 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l29)
  %l30 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l30)
  call void @putint(i32 %l23)
  %l31 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l31)
  call void @putint(i32 %l24)
  %l32 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_11, i32 0, i32 0
  call void @putstr(i8* %l32)
  call void @move(i32 %l22, i32 %l25, i32 %l23, i32 %l24)
  ret void
}
define void @solve(i32 %l1, i32 %l3, i32 %l5, i32 %l7){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  %l8 = alloca i32
  %l12 = icmp eq i32 %l1, 2
  store i32 %l7, i32* %l8
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  br i1 %l12, label %b9, label %b10

b9:
  %l13 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_12, i32 0, i32 0
  call void @putstr(i8* %l13)
  %l14 = load i32, i32* %l4
  call void @putint(i32 %l14)
  %l15 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_13, i32 0, i32 0
  call void @putstr(i8* %l15)
  %l16 = load i32, i32* %l6
  call void @putint(i32 %l16)
  %l17 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_14, i32 0, i32 0
  call void @putstr(i8* %l17)
  %l18 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_15, i32 0, i32 0
  call void @putstr(i8* %l18)
  call void @putint(i32 %l14)
  %l19 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_16, i32 0, i32 0
  call void @putstr(i8* %l19)
  %l20 = load i32, i32* %l8
  call void @putint(i32 %l20)
  %l21 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_17, i32 0, i32 0
  call void @putstr(i8* %l21)
  ret void

b10:
  %l22 = load i32, i32* %l2
  %l23 = sub i32 %l22, 2
  %l24 = load i32, i32* %l4
  %l25 = load i32, i32* %l6
  %l26 = load i32, i32* %l8
  call void @move(i32 %l23, i32 %l24, i32 %l25, i32 %l26)
  %l28 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_18, i32 0, i32 0
  call void @putstr(i8* %l28)
  call void @putint(i32 %l24)
  %l29 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_19, i32 0, i32 0
  call void @putstr(i8* %l29)
  call void @putint(i32 %l25)
  %l30 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_20, i32 0, i32 0
  call void @putstr(i8* %l30)
  %l31 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_21, i32 0, i32 0
  call void @putstr(i8* %l31)
  call void @putint(i32 %l24)
  %l32 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_22, i32 0, i32 0
  call void @putstr(i8* %l32)
  call void @putint(i32 %l25)
  %l33 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_23, i32 0, i32 0
  call void @putstr(i8* %l33)
  call void @move(i32 %l23, i32 %l26, i32 %l25, i32 %l24)
  %l36 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_24, i32 0, i32 0
  call void @putstr(i8* %l36)
  call void @putint(i32 %l25)
  %l37 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_25, i32 0, i32 0
  call void @putstr(i8* %l37)
  call void @putint(i32 %l26)
  %l38 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_26, i32 0, i32 0
  call void @putstr(i8* %l38)
  call void @solve(i32 %l23, i32 %l24, i32 %l25, i32 %l26)
  ret void
}
define void @dfs(i32* %l1, i32* %l2, i32* %l3, i32 %l4, i32 %l6){
b0:
  %l5 = alloca i32
  %l7 = alloca i32
  %l13 = alloca i32
  %l30 = alloca i32
  %l12 = icmp eq i32 %l4, %l6
  store i32 %l6, i32* %l7
  store i32 %l4, i32* %l5
  br i1 %l12, label %b8, label %b9

b8:
  store i32 0, i32* %l13
  br label %b14

b14:
  %l17 = load i32, i32* %l13
  %l18 = load i32, i32* %l7
  %l19 = icmp slt i32 %l17, %l18
  br i1 %l19, label %b15, label %b16

b15:
  %l20 = load i32, i32* %l13
  %l21 = getelementptr i32, i32* %l1, i32 %l20
  %l22 = add i32 %l20, 1
  %l23 = getelementptr i32, i32* %l3, i32 %l22
  %l24 = load i32, i32* %l21
  %l25 = load i32, i32* %l23
  %l26 = add i32 %l24, %l25
  call void @putint(i32 %l26)
  %l27 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_27, i32 0, i32 0
  call void @putstr(i8* %l27)
  store i32 %l22, i32* %l13
  br label %b14

b16:
  %l29 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_28, i32 0, i32 0
  call void @putstr(i8* %l29)
  ret void

b9:
  store i32 0, i32* %l30
  br label %b31

b31:
  %l34 = load i32, i32* %l30
  %l35 = load i32, i32* %l7
  %l36 = icmp slt i32 %l34, %l35
  br i1 %l36, label %b32, label %b33

b32:
  %l39 = load i32, i32* %l30
  %l40 = getelementptr i32, i32* %l2, i32 %l39
  %l41 = load i32, i32* %l40
  %l42 = icmp ne i32 %l41, 0
  %l43 = xor i1 %l42, 1
  %l44 = zext i1 %l43 to i32
  %l45 = icmp ne i32 %l44, 0
  br i1 %l45, label %b37, label %b38

b37:
  %l46 = load i32, i32* %l30
  %l47 = getelementptr i32, i32* %l2, i32 %l46
  store i32 1, i32* %l47
  %l48 = load i32, i32* %l5
  %l49 = getelementptr i32, i32* %l1, i32 %l48
  store i32 %l46, i32* %l49
  %l50 = add i32 %l48, 1
  %l51 = load i32, i32* %l7
  call void @dfs(i32* %l1, i32* %l2, i32* %l3, i32 %l50, i32 %l51)
  store i32 0, i32* %l47
  br label %b38

b38:
  %l54 = load i32, i32* %l30
  %l55 = add i32 %l54, 1
  store i32 %l55, i32* %l30
  br label %b31

b33:
  ret void
}
define void @matrixPrint([5 x i32]* %l1, i32 %l2){
b0:
  %l3 = alloca i32
  %l4 = alloca i32
  %l11 = alloca i32
  store i32 %l2, i32* %l3
  store i32 0, i32* %l4
  br label %b5

b5:
  %l8 = load i32, i32* %l4
  %l9 = load i32, i32* %l3
  %l10 = icmp slt i32 %l8, %l9
  br i1 %l10, label %b6, label %b7

b6:
  store i32 0, i32* %l11
  br label %b12

b12:
  %l15 = load i32, i32* %l11
  %l16 = load i32, i32* %l3
  %l17 = icmp slt i32 %l15, %l16
  br i1 %l17, label %b13, label %b14

b13:
  %l18 = load i32, i32* %l4
  %l19 = load i32, i32* %l11
  %l20 = getelementptr [5 x i32], [5 x i32]* %l1, i32 %l18, i32 %l19
  %l21 = load i32, i32* %l20
  call void @putint(i32 %l21)
  %l22 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_29, i32 0, i32 0
  call void @putstr(i8* %l22)
  %l23 = add i32 %l19, 1
  store i32 %l23, i32* %l11
  br label %b12

b14:
  %l24 = load i32, i32* %l4
  %l25 = add i32 %l24, 1
  store i32 %l25, i32* %l4
  br label %b5

b7:
  %l26 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_30, i32 0, i32 0
  call void @putstr(i8* %l26)
  ret void
}
define void @matrixMul([5 x i32]* %l1, [5 x i32]* %l2, [5 x i32]* %l3, i32 %l4){
b0:
  %l5 = alloca i32
  %l6 = alloca i32
  %l16 = alloca i32
  %l23 = alloca i32
  call void @matrixPrint([5 x i32]* %l2, i32 %l4)
  call void @matrixPrint([5 x i32]* %l3, i32 %l4)
  store i32 %l4, i32* %l5
  store i32 0, i32* %l6
  br label %b10

b10:
  %l13 = load i32, i32* %l6
  %l14 = load i32, i32* %l5
  %l15 = icmp slt i32 %l13, %l14
  br i1 %l15, label %b11, label %b12

b11:
  store i32 0, i32* %l16
  br label %b17

b17:
  %l20 = load i32, i32* %l16
  %l21 = load i32, i32* %l5
  %l22 = icmp slt i32 %l20, %l21
  br i1 %l22, label %b18, label %b19

b18:
  %l24 = load i32, i32* %l6
  %l25 = load i32, i32* %l16
  %l26 = getelementptr [5 x i32], [5 x i32]* %l1, i32 %l24, i32 %l25
  store i32 0, i32* %l26
  store i32 0, i32* %l23
  br label %b27

b27:
  %l30 = load i32, i32* %l23
  %l31 = load i32, i32* %l5
  %l32 = icmp slt i32 %l30, %l31
  br i1 %l32, label %b28, label %b29

b28:
  %l33 = load i32, i32* %l6
  %l34 = load i32, i32* %l16
  %l35 = getelementptr [5 x i32], [5 x i32]* %l1, i32 %l33, i32 %l34
  %l36 = load i32, i32* %l23
  %l37 = getelementptr [5 x i32], [5 x i32]* %l2, i32 %l33, i32 %l36
  %l38 = getelementptr [5 x i32], [5 x i32]* %l3, i32 %l36, i32 %l34
  %l39 = load i32, i32* %l37
  %l40 = load i32, i32* %l38
  %l41 = mul i32 %l39, %l40
  %l42 = load i32, i32* %l35
  %l43 = add i32 %l42, %l41
  store i32 %l43, i32* %l35
  %l45 = add i32 %l36, 1
  store i32 %l45, i32* %l23
  br label %b27

b29:
  %l46 = load i32, i32* %l16
  %l47 = add i32 %l46, 1
  store i32 %l47, i32* %l16
  br label %b17

b19:
  %l48 = load i32, i32* %l6
  %l49 = add i32 %l48, 1
  store i32 %l49, i32* %l6
  br label %b10

b12:
  %l50 = load i32, i32* %l5
  call void @matrixPrint([5 x i32]* %l2, i32 %l50)
  call void @matrixPrint([5 x i32]* %l3, i32 %l50)
  call void @matrixPrint([5 x i32]* %l1, i32 %l50)
  ret void
}
define i32 @main(){
b0:
  %l1 = alloca i32
  %l7 = alloca [10 x i32]
  %l8 = alloca [10 x i32]
  %l19 = alloca [10 x i32]
  %l20 = alloca [10 x i32]
  %l31 = alloca [3 x [10 x i32]]
  %l62 = alloca i32
  %l165 = alloca [5 x [5 x i32]]
  %l191 = alloca [5 x [5 x i32]]
  %l217 = alloca [5 x [5 x i32]]
  %l2 = call i32 @getint()
  %l3 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_31, i32 0, i32 0
  call void @putstr(i8* %l3)
  call void @solve(i32 %l2, i32 1, i32 2, i32 3)
  %l6 = call i32 @getint()
  %l9 = getelementptr [10 x i32], [10 x i32]* %l8, i32 0, i32 0
  store i32 9, i32* %l9
  %l10 = getelementptr [10 x i32], [10 x i32]* %l8, i32 0, i32 1
  store i32 8, i32* %l10
  %l11 = getelementptr [10 x i32], [10 x i32]* %l8, i32 0, i32 2
  store i32 7, i32* %l11
  %l12 = getelementptr [10 x i32], [10 x i32]* %l8, i32 0, i32 3
  store i32 6, i32* %l12
  %l13 = getelementptr [10 x i32], [10 x i32]* %l8, i32 0, i32 4
  store i32 5, i32* %l13
  %l14 = getelementptr [10 x i32], [10 x i32]* %l8, i32 0, i32 5
  store i32 4, i32* %l14
  %l15 = getelementptr [10 x i32], [10 x i32]* %l8, i32 0, i32 6
  store i32 3, i32* %l15
  %l16 = getelementptr [10 x i32], [10 x i32]* %l8, i32 0, i32 7
  store i32 2, i32* %l16
  %l17 = getelementptr [10 x i32], [10 x i32]* %l8, i32 0, i32 8
  store i32 1, i32* %l17
  %l18 = getelementptr [10 x i32], [10 x i32]* %l8, i32 0, i32 9
  store i32 0, i32* %l18
  %l21 = getelementptr [10 x i32], [10 x i32]* %l20, i32 0, i32 0
  store i32 8, i32* %l21
  %l22 = getelementptr [10 x i32], [10 x i32]* %l20, i32 0, i32 1
  store i32 7, i32* %l22
  %l23 = getelementptr [10 x i32], [10 x i32]* %l20, i32 0, i32 2
  store i32 6, i32* %l23
  %l24 = getelementptr [10 x i32], [10 x i32]* %l20, i32 0, i32 3
  store i32 5, i32* %l24
  %l25 = getelementptr [10 x i32], [10 x i32]* %l20, i32 0, i32 4
  store i32 4, i32* %l25
  %l26 = getelementptr [10 x i32], [10 x i32]* %l20, i32 0, i32 5
  store i32 3, i32* %l26
  %l27 = getelementptr [10 x i32], [10 x i32]* %l20, i32 0, i32 6
  store i32 2, i32* %l27
  %l28 = getelementptr [10 x i32], [10 x i32]* %l20, i32 0, i32 7
  store i32 1, i32* %l28
  %l29 = getelementptr [10 x i32], [10 x i32]* %l20, i32 0, i32 8
  store i32 0, i32* %l29
  %l30 = getelementptr [10 x i32], [10 x i32]* %l20, i32 0, i32 9
  store i32 9, i32* %l30
  %l32 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 0, i32 0
  store i32 7, i32* %l32
  %l33 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 0, i32 1
  store i32 6, i32* %l33
  %l34 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 0, i32 2
  store i32 5, i32* %l34
  %l35 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 0, i32 3
  store i32 4, i32* %l35
  %l36 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 0, i32 4
  store i32 3, i32* %l36
  %l37 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 0, i32 5
  store i32 2, i32* %l37
  %l38 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 0, i32 6
  store i32 1, i32* %l38
  %l39 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 0, i32 7
  store i32 0, i32* %l39
  %l40 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 0, i32 8
  store i32 9, i32* %l40
  %l41 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 0, i32 9
  store i32 8, i32* %l41
  %l42 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 1, i32 0
  store i32 6, i32* %l42
  %l43 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 1, i32 1
  store i32 5, i32* %l43
  %l44 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 1, i32 2
  store i32 4, i32* %l44
  %l45 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 1, i32 3
  store i32 3, i32* %l45
  %l46 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 1, i32 4
  store i32 2, i32* %l46
  %l47 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 1, i32 5
  store i32 1, i32* %l47
  %l48 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 1, i32 6
  store i32 0, i32* %l48
  %l49 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 1, i32 7
  store i32 9, i32* %l49
  %l50 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 1, i32 8
  store i32 8, i32* %l50
  %l51 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 1, i32 9
  store i32 7, i32* %l51
  %l52 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 2, i32 0
  store i32 5, i32* %l52
  %l53 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 2, i32 1
  store i32 4, i32* %l53
  %l54 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 2, i32 2
  store i32 3, i32* %l54
  %l55 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 2, i32 3
  store i32 2, i32* %l55
  %l56 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 2, i32 4
  store i32 1, i32* %l56
  %l57 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 2, i32 5
  store i32 0, i32* %l57
  %l58 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 2, i32 6
  store i32 9, i32* %l58
  %l59 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 2, i32 7
  store i32 8, i32* %l59
  %l60 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 2, i32 8
  store i32 7, i32* %l60
  %l61 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 2, i32 9
  store i32 6, i32* %l61
  store i32 0, i32* %l62
  store i32 %l6, i32* %l1
  br label %b63

b63:
  %l66 = load i32, i32* %l62
  %l67 = load i32, i32* %l1
  %l68 = icmp slt i32 %l66, %l67
  br i1 %l68, label %b64, label %b65

b64:
  %l69 = load i32, i32* %l62
  %l70 = getelementptr [10 x i32], [10 x i32]* %l8, i32 0, i32 %l69
  %l71 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 2, i32 %l69
  %l72 = load i32, i32* %l70
  %l73 = load i32, i32* %l71
  %l74 = add i32 %l72, %l73
  %l75 = add i32 %l74, 1
  store i32 %l75, i32* %l70
  %l77 = getelementptr [10 x i32], [10 x i32]* %l20, i32 0, i32 %l69
  %l79 = load i32, i32* %l77
  %l81 = add i32 %l79, %l73
  %l82 = add i32 %l81, 2
  store i32 %l82, i32* %l77
  %l84 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 0, i32 %l69
  %l86 = load i32, i32* %l84
  %l88 = add i32 %l86, %l73
  %l89 = add i32 %l88, 3
  store i32 %l89, i32* %l84
  %l91 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 1, i32 %l69
  %l93 = load i32, i32* %l91
  %l95 = add i32 %l93, %l73
  %l96 = add i32 %l95, 4
  store i32 %l96, i32* %l91
  %l98 = add i32 %l69, 1
  store i32 %l98, i32* %l62
  br label %b63

b65:
  store i32 0, i32* %l62
  br label %b99

b99:
  br label %b100

b100:
  %l102 = load i32, i32* %l62
  %l103 = getelementptr [10 x i32], [10 x i32]* %l19, i32 0, i32 %l102
  store i32 0, i32* %l103
  %l104 = add i32 %l102, 1
  %l108 = load i32, i32* %l1
  %l109 = icmp sge i32 %l104, %l108
  store i32 %l104, i32* %l62
  br i1 %l109, label %b105, label %b106

b105:
  br label %b101

b106:
  br label %b99

b101:
  %l110 = getelementptr [10 x i32], [10 x i32]* %l7, i32 0, i32 0
  %l111 = getelementptr [10 x i32], [10 x i32]* %l19, i32 0, i32 0
  %l112 = getelementptr [10 x i32], [10 x i32]* %l8, i32 0, i32 0
  %l113 = load i32, i32* %l1
  call void @dfs(i32* %l110, i32* %l111, i32* %l112, i32 0, i32 %l113)
  store i32 0, i32* %l62
  br label %b115

b115:
  br label %b116

b116:
  %l118 = load i32, i32* %l62
  %l119 = getelementptr [10 x i32], [10 x i32]* %l19, i32 0, i32 %l118
  store i32 0, i32* %l119
  %l120 = add i32 %l118, 1
  %l125 = load i32, i32* %l1
  %l126 = icmp sge i32 %l120, %l125
  store i32 %l120, i32* %l62
  br i1 %l126, label %b121, label %b123

b121:
  br label %b117

b123:
  br label %b122

b122:
  br label %b115

b117:
  %l127 = getelementptr [10 x i32], [10 x i32]* %l7, i32 0, i32 0
  %l128 = getelementptr [10 x i32], [10 x i32]* %l19, i32 0, i32 0
  %l129 = getelementptr [10 x i32], [10 x i32]* %l20, i32 0, i32 0
  %l130 = load i32, i32* %l1
  call void @dfs(i32* %l127, i32* %l128, i32* %l129, i32 0, i32 %l130)
  store i32 0, i32* %l62
  br label %b132

b132:
  br label %b133

b133:
  %l135 = load i32, i32* %l62
  %l136 = getelementptr [10 x i32], [10 x i32]* %l19, i32 0, i32 %l135
  store i32 0, i32* %l136
  %l137 = add i32 %l135, 1
  %l141 = load i32, i32* %l1
  %l142 = icmp slt i32 %l137, %l141
  store i32 %l137, i32* %l62
  br i1 %l142, label %b138, label %b139

b138:
  br label %b132

b139:
  br label %b134

b134:
  %l143 = getelementptr [10 x i32], [10 x i32]* %l7, i32 0, i32 0
  %l144 = getelementptr [10 x i32], [10 x i32]* %l19, i32 0, i32 0
  %l145 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 0, i32 0
  %l146 = load i32, i32* %l1
  call void @dfs(i32* %l143, i32* %l144, i32* %l145, i32 0, i32 %l146)
  store i32 0, i32* %l62
  br label %b148

b148:
  br label %b149

b149:
  %l151 = load i32, i32* %l62
  %l152 = getelementptr [10 x i32], [10 x i32]* %l19, i32 0, i32 %l151
  store i32 0, i32* %l152
  %l153 = add i32 %l151, 1
  %l158 = load i32, i32* %l1
  %l159 = icmp slt i32 %l153, %l158
  store i32 %l153, i32* %l62
  br i1 %l159, label %b154, label %b156

b154:
  br label %b148

b156:
  br label %b150

b155:
  br label %b148

b150:
  %l160 = getelementptr [10 x i32], [10 x i32]* %l7, i32 0, i32 0
  %l161 = getelementptr [10 x i32], [10 x i32]* %l19, i32 0, i32 0
  %l162 = getelementptr [3 x [10 x i32]], [3 x [10 x i32]]* %l31, i32 0, i32 1, i32 0
  %l163 = load i32, i32* %l1
  call void @dfs(i32* %l160, i32* %l161, i32* %l162, i32 0, i32 %l163)
  %l166 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 0, i32 0
  store i32 307728049, i32* %l166
  %l167 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 0, i32 1
  store i32 -1625382311, i32* %l167
  %l168 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 0, i32 2
  store i32 1271106322, i32* %l168
  %l169 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 0, i32 3
  store i32 309930583, i32* %l169
  %l170 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 0, i32 4
  store i32 2007032850, i32* %l170
  %l171 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 1, i32 0
  store i32 1074055550, i32* %l171
  %l172 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 1, i32 1
  store i32 2036831205, i32* %l172
  %l173 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 1, i32 2
  store i32 -492323543, i32* %l173
  %l174 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 1, i32 3
  store i32 -252604752, i32* %l174
  %l175 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 1, i32 4
  store i32 1295820596, i32* %l175
  %l176 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 2, i32 0
  store i32 728458994, i32* %l176
  %l177 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 2, i32 1
  store i32 1673642498, i32* %l177
  %l178 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 2, i32 2
  store i32 -51943305, i32* %l178
  %l179 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 2, i32 3
  store i32 -1854253096, i32* %l179
  %l180 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 2, i32 4
  store i32 -1024571774, i32* %l180
  %l181 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 3, i32 0
  store i32 1430035460, i32* %l181
  %l182 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 3, i32 1
  store i32 1705232663, i32* %l182
  %l183 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 3, i32 2
  store i32 -1803769826, i32* %l183
  %l184 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 3, i32 3
  store i32 -1485716863, i32* %l184
  %l185 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 3, i32 4
  store i32 -1192520056, i32* %l185
  %l186 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 4, i32 0
  store i32 -1503793409, i32* %l186
  %l187 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 4, i32 1
  store i32 2027983592, i32* %l187
  %l188 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 4, i32 2
  store i32 -1911831470, i32* %l188
  %l189 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 4, i32 3
  store i32 -1387735054, i32* %l189
  %l190 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 4, i32 4
  store i32 -274170342, i32* %l190
  %l192 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 0, i32 0
  store i32 -39878981, i32* %l192
  %l193 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 0, i32 1
  store i32 1475936537, i32* %l193
  %l194 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 0, i32 2
  store i32 1944942266, i32* %l194
  %l195 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 0, i32 3
  store i32 1579815806, i32* %l195
  %l196 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 0, i32 4
  store i32 1734290467, i32* %l196
  %l197 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 1, i32 0
  store i32 1606724733, i32* %l197
  %l198 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 1, i32 1
  store i32 -1839064934, i32* %l198
  %l199 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 1, i32 2
  store i32 1749681186, i32* %l199
  %l200 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 1, i32 3
  store i32 1409364573, i32* %l200
  %l201 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 1, i32 4
  store i32 -68127266, i32* %l201
  %l202 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 2, i32 0
  store i32 1869282840, i32* %l202
  %l203 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 2, i32 1
  store i32 1574753938, i32* %l203
  %l204 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 2, i32 2
  store i32 1959861217, i32* %l204
  %l205 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 2, i32 3
  store i32 -425501077, i32* %l205
  %l206 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 2, i32 4
  store i32 -1281736928, i32* %l206
  %l207 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 3, i32 0
  store i32 -1304579021, i32* %l207
  %l208 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 3, i32 1
  store i32 -1777897472, i32* %l208
  %l209 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 3, i32 2
  store i32 -1921297034, i32* %l209
  %l210 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 3, i32 3
  store i32 1623258471, i32* %l210
  %l211 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 3, i32 4
  store i32 -226241316, i32* %l211
  %l212 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 4, i32 0
  store i32 824482268, i32* %l212
  %l213 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 4, i32 1
  store i32 -1840038765, i32* %l213
  %l214 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 4, i32 2
  store i32 -1238621050, i32* %l214
  %l215 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 4, i32 3
  store i32 1453319654, i32* %l215
  %l216 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 4, i32 4
  store i32 -1338682930, i32* %l216
  %l218 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l217, i32 0, i32 0
  %l219 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l165, i32 0, i32 0
  %l220 = getelementptr [5 x [5 x i32]], [5 x [5 x i32]]* %l191, i32 0, i32 0
  call void @matrixMul([5 x i32]* %l218, [5 x i32]* %l219, [5 x i32]* %l220, i32 4)
  call void @matrixMul([5 x i32]* %l218, [5 x i32]* %l220, [5 x i32]* %l219, i32 5)
  br label %b226

b226:
  br label %b227

b227:
  ret i32 0
  %l229 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_32, i32 0, i32 0
  call void @putstr(i8* %l229)
  br label %b226

b228:
  ret i32 0
}
