declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@_str_0 = constant [10 x i8] c"20373184\0a\00"
@_str_1 = constant [40 x i8] c"Wow, you will begin test your program!\0a\00"
@_str_2 = constant [2 x i8] c"\0a\00"
@_str_3 = constant [2 x i8] c"\0a\00"
@_str_4 = constant [2 x i8] c"\0a\00"
@_str_5 = constant [2 x i8] c"\0a\00"
@_str_6 = constant [2 x i8] c"\0a\00"
@_str_7 = constant [2 x i8] c"\0a\00"
@_str_8 = constant [2 x i8] c"\0a\00"
@_str_9 = constant [2 x i8] c"-\00"
@_str_10 = constant [2 x i8] c"\0a\00"
define i32 @main(){
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  %l3 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  %l6 = alloca i32
  %l7 = alloca i32
  %l8 = alloca i32
  %l9 = alloca i32
  %l10 = alloca i32
  %l15 = alloca i32
  %l16 = alloca i32
  %l17 = alloca i32
  %l18 = alloca i32
  %l19 = alloca i32
  %l20 = alloca i32
  %l21 = alloca i32
  %l22 = alloca i32
  %l23 = alloca i32
  %l24 = alloca i32
  %l25 = alloca i32
  %l26 = alloca i32
  %l27 = alloca i32
  %l28 = alloca i32
  store i32 1, i32* %l1
  store i32 -2, i32* %l2
  store i32 3, i32* %l3
  store i32 4, i32* %l4
  store i32 5, i32* %l5
  store i32 6, i32* %l6
  store i32 111, i32* %l7
  store i32 357, i32* %l8
  store i32 38, i32* %l9
  %l11 = load i32, i32* %l8
  %l12 = mul i32 %l11, 3
  %l13 = load i32, i32* %l7
  %l14 = add i32 %l13, %l12
  store i32 %l14, i32* %l10
  %l29 = call i32 @getint()
  store i32 %l29, i32* %l15
  %l30 = call i32 @getint()
  store i32 %l30, i32* %l16
  %l31 = call i32 @getint()
  store i32 %l31, i32* %l17
  %l32 = call i32 @getint()
  store i32 %l32, i32* %l18
  %l33 = call i32 @getint()
  store i32 %l33, i32* %l19
  %l34 = call i32 @getint()
  store i32 %l34, i32* %l20
  %l35 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l35)
  %l36 = getelementptr inbounds [40 x i8], [40 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l36)
  call void @putint(i32 3)
  %l37 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l37)
  call void @putint(i32 30)
  %l38 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l38)
  store i32 -3, i32* %l21
  %l39 = load i32, i32* %l8
  %l40 = load i32, i32* %l7
  %l41 = srem i32 %l39, %l40
  %l42 = add i32 %l41, 5
  store i32 %l42, i32* %l22
  %l43 = load i32, i32* %l10
  %l44 = load i32, i32* %l9
  %l45 = mul i32 %l43, %l44
  %l46 = sub i32 %l45, 4
  store i32 %l46, i32* %l23
  %l47 = load i32, i32* %l15
  %l48 = sdiv i32 %l47, 2
  %l49 = mul i32 %l48, 6
  store i32 %l49, i32* %l24
  %l50 = load i32, i32* %l17
  %l51 = add i32 1, %l50
  %l52 = load i32, i32* %l16
  %l53 = mul i32 %l52, %l51
  %l54 = srem i32 %l53, 3
  store i32 %l54, i32* %l25
  %l55 = load i32, i32* %l18
  %l56 = sub i32 0, %l55
  store i32 %l56, i32* %l26
  %l57 = load i32, i32* %l19
  %l58 = add i32 6, %l57
  store i32 %l58, i32* %l27
  %l59 = load i32, i32* %l21
  call void @putint(i32 %l59)
  %l60 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l60)
  %l61 = load i32, i32* %l22
  call void @putint(i32 %l61)
  %l62 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l62)
  %l63 = load i32, i32* %l23
  call void @putint(i32 %l63)
  %l64 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l64)
  %l65 = load i32, i32* %l24
  call void @putint(i32 %l65)
  %l66 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l66)
  %l67 = load i32, i32* %l25
  call void @putint(i32 %l67)
  %l68 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l68)
  %l69 = load i32, i32* %l26
  call void @putint(i32 %l69)
  %l70 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l70)
  %l71 = load i32, i32* %l27
  call void @putint(i32 %l71)
  %l72 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l72)
  ret i32 0
}
