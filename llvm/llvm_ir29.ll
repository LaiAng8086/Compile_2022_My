declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@Mod = constant i32 389
@N = constant i32 100005
@a_to_the_a = global i32 0
@cnt = global i32 0
@n = global i32 0
@_str_0 = constant [26 x i8] c"funcTest: move disk from \00"
@_str_1 = constant [5 x i8] c" to \00"
@_str_2 = constant [2 x i8] c"\0a\00"
@_str_3 = constant [17 x i8] c"blockTest: 7 == \00"
@_str_4 = constant [8 x i8] c", 8 == \00"
@_str_5 = constant [2 x i8] c"\0a\00"
@_str_6 = constant [17 x i8] c"blockTest: 5 == \00"
@_str_7 = constant [9 x i8] c", 12 == \00"
@_str_8 = constant [2 x i8] c"\0a\00"
@_str_9 = constant [10 x i8] c"Exptest: \00"
@_str_10 = constant [2 x i8] c" \00"
@_str_11 = constant [2 x i8] c" \00"
@_str_12 = constant [2 x i8] c" \00"
@_str_13 = constant [2 x i8] c" \00"
@_str_14 = constant [2 x i8] c" \00"
@_str_15 = constant [2 x i8] c" \00"
@_str_16 = constant [2 x i8] c" \00"
@_str_17 = constant [2 x i8] c"\0a\00"
@_str_18 = constant [21 x i8] c"20373569 the mafia~\0a\00"
@_str_19 = constant [10 x i8] c"Exptest: \00"
@_str_20 = constant [2 x i8] c"\0a\00"
define void @move(i32 %l1, i32 %l2){
b0:
  %l3 = load i32, i32* @cnt
  %l4 = add i32 %l3, 1
  store i32 %l4, i32* @cnt
  %l7 = load i32, i32* @cnt
  %l8 = srem i32 %l7, 389
  %l9 = icmp eq i32 %l8, 0
  br i1 %l9, label %b5, label %b6

b5:
  %l10 = getelementptr inbounds [26 x i8], [26 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l10)
  call void @putint(i32 %l1)
  %l11 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l11)
  call void @putint(i32 %l2)
  %l12 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l12)
  br label %b6

b6:
  ret void
}
define void @hanoi(i32 %l1, i32 %l2, i32 %l3, i32 %l4){
b0:
  %l7 = icmp eq i32 %l1, 1
  br i1 %l7, label %b5, label %b6

b5:
  call void @move(i32 %l2, i32 %l4)
  ret void

b6:
  %l9 = sub i32 %l1, 1
  call void @hanoi(i32 %l9, i32 %l2, i32 %l4, i32 %l3)
  call void @move(i32 %l2, i32 %l4)
  %l12 = sub i32 %l1, 1
  call void @hanoi(i32 %l12, i32 %l3, i32 %l2, i32 %l4)
}
define i32 @qpow(i32 %l1, i32 %l2){
b0:
  %l3 = alloca i32
  store i32 1, i32* %l3
  br label %b4

b4:
  %l7 = icmp ne i32 %l2, 0
  br i1 %l7, label %b5, label %b6

b5:
  %l8 = sdiv i32 %l2, 2
  store i32 %l8, i32 %l2
  %l9 = mul i32 %l1, %l1
  %l10 = srem i32 %l9, 389
  store i32 %l10, i32 %l1
  %l13 = srem i32 %l2, 2
  %l14 = icmp ne i32 %l13, 0
  br i1 %l14, label %b11, label %b12

b11:
  %l15 = load i32, i32* %l3
  %l16 = mul i32 %l15, %l1
  %l17 = srem i32 %l16, 389
  store i32 %l17, i32* %l3
  br label %b12

b12:
  br label %b4

b6:
  %l18 = load i32, i32* %l3
  ret i32 %l18
}
define i32 @gcd(i32 %l1, i32 %l2){
b0:
  %l5 = icmp ne i32 %l2, 0
  %l6 = xor i1 %l5, 1
  %l7 = zext i1 %l6 to i32
  %l8 = icmp ne i32 %l7, 0
  br i1 %l8, label %b3, label %b4

b3:
  ret i32 %l1

b4:
  %l9 = srem i32 %l1, %l2
  %l10 = call i32 @gcd(i32 %l2, i32 %l9)
  ret i32 %l10
}
define i32 @testExp(){
b0:
  %l4 = alloca i32
  %l16 = alloca i32
  %l19 = alloca i32
  %l20 = alloca i32
  %l23 = alloca i32
  %l33 = alloca i32
  %l42 = alloca i32
  %l76 = alloca i32
  %l78 = alloca i32
  %l1 = load i32, i32* @n
  %l2 = load i32, i32* @n
  %l3 = mul i32 %l1, %l2
  store i32 %l3, i32* @a_to_the_a
  %l5 = load i32, i32* @n
  %l6 = sdiv i32 100005, %l5
  store i32 %l6, i32* %l4
  %l7 = load i32, i32* @n
  %l8 = load i32, i32* @n
  %l9 = mul i32 %l7, %l8
  %l10 = load i32, i32* @n
  %l11 = sdiv i32 %l9, %l10
  %l12 = load i32, i32* @n
  %l13 = add i32 %l11, %l12
  %l14 = load i32, i32* @n
  %l15 = sub i32 %l13, %l14
  %l17 = load i32, i32* @a_to_the_a
  %l18 = add i32 %l17, 1
  store i32 %l18, i32* %l16
  store i32 2147483647, i32* %l19
  %l21 = load i32, i32* %l19
  %l22 = sub i32 -1, %l21
  store i32 %l22, i32* %l20
  %l24 = load i32, i32* @a_to_the_a
  %l25 = sub i32 0, %l24
  %l26 = sub i32 1, %l25
  %l27 = load i32, i32* %l16
  %l28 = mul i32 %l26, %l27
  %l29 = sdiv i32 %l28, 3
  %l30 = sub i32 %l29, 2
  %l31 = add i32 %l30, 100005
  %l32 = srem i32 %l31, 389
  store i32 %l32, i32* %l23
  %l34 = load i32, i32* @a_to_the_a
  %l35 = load i32, i32* %l16
  %l36 = call i32 @qpow(i32 %l34, i32 %l35)
  store i32 %l36, i32* %l33
  store i32 10, i32* %l16
  store i32 0, i32* %l19
  store i32 7, i32* %l16
  store i32 8, i32* %l19
  %l37 = getelementptr inbounds [17 x i8], [17 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l37)
  %l38 = load i32, i32* %l16
  call void @putint(i32 %l38)
  %l39 = getelementptr inbounds [8 x i8], [8 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l39)
  %l40 = load i32, i32* %l19
  call void @putint(i32 %l40)
  %l41 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l41)
  store i32 0, i32* %l42
  br label %b43

b43:
  %l46 = icmp ne i32 1, 0
  br i1 %l46, label %b44, label %b45

b44:
  %l47 = load i32, i32* %l42
  %l48 = add i32 %l47, 1
  store i32 %l48, i32* %l42
  %l51 = load i32, i32* %l42
  %l52 = srem i32 %l51, 2
  %l53 = icmp ne i32 %l52, 0
  br i1 %l53, label %b49, label %b50

b49:
  br label %b43

b50:
  %l57 = load i32, i32* %l42
  %l58 = load i32, i32* %l16
  %l59 = icmp sge i32 %l57, %l58
  br i1 %l59, label %b54, label %b56

b54:
  br label %b45

b56:
  %l63 = load i32, i32* %l19
  %l64 = icmp slt i32 %l63, 10
  br i1 %l64, label %b60, label %b62

b60:
  %l65 = load i32, i32* %l19
  %l66 = load i32, i32* %l42
  %l67 = add i32 %l65, %l66
  store i32 %l67, i32* %l19
  br label %b61

b62:
  %l68 = load i32, i32* %l19
  %l69 = load i32, i32* %l42
  %l70 = sub i32 %l68, %l69
  store i32 %l70, i32* %l19
  br label %b61

b61:
  br label %b55

b55:
  br label %b43

b45:
  %l71 = getelementptr inbounds [17 x i8], [17 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l71)
  %l72 = load i32, i32* %l16
  call void @putint(i32 %l72)
  %l73 = getelementptr inbounds [9 x i8], [9 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l73)
  %l74 = load i32, i32* %l19
  call void @putint(i32 %l74)
  %l75 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l75)
  %l77 = load i32, i32* @n
  store i32 %l77, i32* %l76
  store i32 0, i32* %l78
  %l82 = load i32, i32* %l76
  %l83 = icmp slt i32 %l82, 0
  br i1 %l83, label %b79, label %b81

b79:
  store i32 10, i32* %l78
  br label %b80

b81:
  %l87 = load i32, i32* %l76
  %l88 = icmp sgt i32 %l87, 10
  br i1 %l88, label %b84, label %b86

b84:
  store i32 20, i32* %l78
  br label %b85

b86:
  %l91 = load i32, i32* %l76
  %l92 = load i32, i32* @n
  %l93 = icmp eq i32 %l91, %l92
  br i1 %l93, label %b89, label %b90

b89:
  store i32 30, i32* %l78
  br label %b90

b90:
  br label %b85

b85:
  br label %b80

b80:
  %l96 = load i32, i32* %l76
  %l97 = icmp sle i32 %l96, 10
  br i1 %l97, label %b94, label %b95

b94:
  %l98 = load i32, i32* %l78
  %l99 = load i32, i32* %l76
  %l100 = add i32 %l98, %l99
  store i32 %l100, i32* %l78
  br label %b95

b95:
  %l101 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l101)
  %l102 = load i32, i32* @a_to_the_a
  call void @putint(i32 %l102)
  %l103 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l103)
  %l104 = load i32, i32* %l16
  call void @putint(i32 %l104)
  %l105 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_11, i32 0, i32 0
  call void @putstr(i8* %l105)
  %l106 = load i32, i32* %l19
  call void @putint(i32 %l106)
  %l107 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_12, i32 0, i32 0
  call void @putstr(i8* %l107)
  %l108 = load i32, i32* %l20
  call void @putint(i32 %l108)
  %l109 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_13, i32 0, i32 0
  call void @putstr(i8* %l109)
  %l110 = load i32, i32* %l33
  call void @putint(i32 %l110)
  %l111 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_14, i32 0, i32 0
  call void @putstr(i8* %l111)
  %l112 = load i32, i32* %l76
  call void @putint(i32 %l112)
  %l113 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_15, i32 0, i32 0
  call void @putstr(i8* %l113)
  %l114 = load i32, i32* %l78
  call void @putint(i32 %l114)
  %l115 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_16, i32 0, i32 0
  call void @putstr(i8* %l115)
  %l116 = load i32, i32* %l23
  call void @putint(i32 %l116)
  %l117 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_17, i32 0, i32 0
  call void @putstr(i8* %l117)
  %l118 = load i32, i32* %l76
  %l119 = load i32, i32* %l78
  %l120 = call i32 @gcd(i32 %l118, i32 %l119)
  ret i32 %l120
}
define i32 @main(){
b0:
  %l1 = getelementptr inbounds [21 x i8], [21 x i8]* @_str_18, i32 0, i32 0
  call void @putstr(i8* %l1)
  %l2 = call i32 @getint()
  store i32 %l2, i32* @n
  %l3 = load i32, i32* @n
  call void @hanoi(i32 %l3, i32 1, i32 2, i32 3)
  %l5 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_19, i32 0, i32 0
  call void @putstr(i8* %l5)
  %l6 = call i32 @testExp()
  call void @putint(i32 %l6)
  %l7 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_20, i32 0, i32 0
  call void @putstr(i8* %l7)
  ret i32 0
}
