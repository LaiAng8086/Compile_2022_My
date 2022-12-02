declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@ZERO = constant i32 0
@ONE = constant i32 1
@TWO = constant i32 2
@THREE = constant i32 3
@one = global i32 1
@two = global i32 2
@three = global i32 3
@gvar = global i32 0
@_str_0 = constant [10 x i8] c"20373358\0a\00"
@_str_1 = constant [24 x i8] c"Some global constants: \00"
@_str_2 = constant [2 x i8] c" \00"
@_str_3 = constant [2 x i8] c" \00"
@_str_4 = constant [2 x i8] c" \00"
@_str_5 = constant [2 x i8] c"\0a\00"
@_str_6 = constant [23 x i8] c"Some local constants: \00"
@_str_7 = constant [2 x i8] c" \00"
@_str_8 = constant [2 x i8] c" \00"
@_str_9 = constant [2 x i8] c" \00"
@_str_10 = constant [2 x i8] c"\0a\00"
@_str_11 = constant [24 x i8] c"Some global variables: \00"
@_str_12 = constant [2 x i8] c" \00"
@_str_13 = constant [2 x i8] c" \00"
@_str_14 = constant [2 x i8] c"\0a\00"
@_str_15 = constant [23 x i8] c"Some local variables: \00"
@_str_16 = constant [2 x i8] c" \00"
@_str_17 = constant [2 x i8] c" \00"
@_str_18 = constant [2 x i8] c"\0a\00"
@_str_19 = constant [24 x i8] c"Set global variable as \00"
@_str_20 = constant [2 x i8] c"\0a\00"
@_str_21 = constant [23 x i8] c"Set local variable as \00"
@_str_22 = constant [2 x i8] c"\0a\00"
@_str_23 = constant [11 x i8] c"Calculate \00"
@_str_24 = constant [2 x i8] c"\0a\00"
@_str_25 = constant [11 x i8] c"Calculate \00"
@_str_26 = constant [2 x i8] c"\0a\00"
@_str_27 = constant [11 x i8] c"Calculate \00"
@_str_28 = constant [2 x i8] c"\0a\00"
define i32 @main(){
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  %l3 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  store i32 1, i32* %l1
  store i32 2, i32* %l2
  store i32 8, i32* %l3
  store i32 5, i32* %l4
  %l6 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l6)
  %l7 = getelementptr inbounds [24 x i8], [24 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l7)
  call void @putint(i32 0)
  %l8 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l8)
  call void @putint(i32 1)
  %l9 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l9)
  call void @putint(i32 2)
  %l10 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l10)
  call void @putint(i32 3)
  %l11 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l11)
  %l12 = getelementptr inbounds [23 x i8], [23 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l12)
  call void @putint(i32 1)
  %l13 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l13)
  call void @putint(i32 2)
  %l14 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l14)
  call void @putint(i32 3)
  %l15 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l15)
  call void @putint(i32 4)
  %l16 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l16)
  %l17 = getelementptr inbounds [24 x i8], [24 x i8]* @_str_11, i32 0, i32 0
  call void @putstr(i8* %l17)
  %l18 = load i32, i32* %l1
  call void @putint(i32 %l18)
  %l19 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_12, i32 0, i32 0
  call void @putstr(i8* %l19)
  %l20 = load i32, i32* @two
  call void @putint(i32 %l20)
  %l21 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_13, i32 0, i32 0
  call void @putstr(i8* %l21)
  %l22 = load i32, i32* @three
  call void @putint(i32 %l22)
  %l23 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_14, i32 0, i32 0
  call void @putstr(i8* %l23)
  %l24 = getelementptr inbounds [23 x i8], [23 x i8]* @_str_15, i32 0, i32 0
  call void @putstr(i8* %l24)
  %l25 = load i32, i32* %l2
  call void @putint(i32 %l25)
  %l26 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_16, i32 0, i32 0
  call void @putstr(i8* %l26)
  %l27 = load i32, i32* %l3
  call void @putint(i32 %l27)
  %l28 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_17, i32 0, i32 0
  call void @putstr(i8* %l28)
  %l29 = load i32, i32* %l4
  call void @putint(i32 %l29)
  %l30 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_18, i32 0, i32 0
  call void @putstr(i8* %l30)
  %l31 = call i32 @getint()
  store i32 %l31, i32* @gvar
  %l32 = call i32 @getint()
  store i32 %l32, i32* %l5
  %l33 = getelementptr inbounds [24 x i8], [24 x i8]* @_str_19, i32 0, i32 0
  call void @putstr(i8* %l33)
  %l34 = load i32, i32* @gvar
  call void @putint(i32 %l34)
  %l35 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_20, i32 0, i32 0
  call void @putstr(i8* %l35)
  %l36 = getelementptr inbounds [23 x i8], [23 x i8]* @_str_21, i32 0, i32 0
  call void @putstr(i8* %l36)
  %l37 = load i32, i32* %l5
  call void @putint(i32 %l37)
  %l38 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_22, i32 0, i32 0
  call void @putstr(i8* %l38)
  %l39 = add i32 %l37, 1
  %l40 = mul i32 %l39, -1
  store i32 %l40, i32* %l5
  %l41 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_23, i32 0, i32 0
  call void @putstr(i8* %l41)
  %l42 = load i32, i32* %l5
  call void @putint(i32 %l42)
  %l43 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_24, i32 0, i32 0
  call void @putstr(i8* %l43)
  %l44 = add i32 %l42, 56
  %l45 = mul i32 %l34, 9
  %l46 = sub i32 %l44, %l45
  store i32 %l46, i32* %l5
  %l47 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_25, i32 0, i32 0
  call void @putstr(i8* %l47)
  %l48 = load i32, i32* %l5
  call void @putint(i32 %l48)
  %l49 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_26, i32 0, i32 0
  call void @putstr(i8* %l49)
  %l50 = add i32 %l48, -1
  store i32 %l50, i32* %l5
  %l51 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_27, i32 0, i32 0
  call void @putstr(i8* %l51)
  %l52 = load i32, i32* %l5
  call void @putint(i32 %l52)
  %l53 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_28, i32 0, i32 0
  call void @putstr(i8* %l53)
  ret i32 0
}
