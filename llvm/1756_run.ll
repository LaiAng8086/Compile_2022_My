; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@A_GLOBAL = constant i32 1
@B_GLOBAL = constant i32 2
@C_GLOBAL = constant i32 3
@D_GLOBAL = constant i32 4
@E_GLOBAL = constant i32 5
@F_GLOBAL = constant i32 6
@Arr1_1_GLOBAL = constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5]
@Arr2_1_GLOBAL = constant [3 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4], [2 x i32] [i32 5, i32 6]]
@a_glogal = global i32 0
@arr1_1_global = global [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5]
@arr2_1_global = global [3 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4], [2 x i32] [i32 5, i32 6]]
@_str_0 = constant [17 x i8] c"Now a_global is \00"
@_str_1 = constant [15 x i8] c", it is < 50.\0A\00"
@_str_2 = constant [32 x i8] c"Now a_global is exactly 50!!!.\0A\00"
@_str_3 = constant [17 x i8] c"Now a_global is \00"
@_str_4 = constant [15 x i8] c", it is > 50.\0A\00"
@_str_5 = constant [34 x i8] c"I am a function with 3 param: {{ \00"
@_str_6 = constant [3 x i8] c", \00"
@_str_7 = constant [3 x i8] c", \00"
@_str_8 = constant [18 x i8] c" }} and I return \00"
@_str_9 = constant [3 x i8] c".\0A\00"
@_str_10 = constant [41 x i8] c"I am a function with only one param: {{ \00"
@_str_11 = constant [26 x i8] c" }} and I return noting.\0A\00"
@_str_12 = constant [34 x i8] c"I am a function with 2 param: {{ \00"
@_str_13 = constant [3 x i8] c", \00"
@_str_14 = constant [26 x i8] c" }} and I return noting.\0A\00"
@_str_15 = constant [48 x i8] c"I am a function without params and I return 0.\0A\00"
@_str_16 = constant [10 x i8] c"19241091\0A\00"
@_str_17 = constant [12 x i8] c"A_GLOBAL = \00"
@_str_18 = constant [2 x i8] c"\0A\00"
@_str_19 = constant [24 x i8] c"arr2_1_global[1][1] is \00"
@_str_20 = constant [2 x i8] c"\0A\00"
@_str_21 = constant [19 x i8] c"Now main_var_c is \00"
@_str_22 = constant [2 x i8] c"\0A\00"
@_str_23 = constant [19 x i8] c"Now main_var_a is \00"
@_str_24 = constant [15 x i8] c", it is >= 30\0A\00"
@_str_25 = constant [19 x i8] c"Now main_var_a is \00"
@_str_26 = constant [15 x i8] c", it is <= 10\0A\00"
@_str_27 = constant [19 x i8] c"Now main_var_a is \00"
@_str_28 = constant [23 x i8] c", it is > 10 and < 30\0A\00"
@_str_29 = constant [50 x i8] c"==================testfile1 end==================\00"
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define i32 @func_params(i32 %l1, i32* %l3, [2 x i32]* %l4) {
b0:
  %l2 = alloca i32
  %l5 = alloca i32
  %l7 = mul i32 %l1, 2
  %l8 = getelementptr i32, i32* %l3, i32 0
  %l9 = load i32, i32* %l8
  %l10 = srem i32 %l9, 2
  %l11 = add i32 %l7, %l10
  %l12 = getelementptr [2 x i32], [2 x i32]* %l4, i32 0, i32 0
  %l13 = load i32, i32* %l12
  %l14 = srem i32 %l13, 3
  %l15 = add i32 %l11, %l14
  %l16 = add i32 %l1, 2
  %l18 = mul i32 %l15, %l16
  %l23 = icmp slt i32 %l18, 50
  store i32 %l18, i32* @a_glogal
  store i32 %l1, i32* %l2
  store i32 %l15, i32* %l5
  br i1 %l23, label %b19, label %b21

b19:                                              ; preds = %b0
  %l24 = getelementptr inbounds [17 x i8], [17 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l24)
  %l25 = load i32, i32* @a_glogal
  call void @putint(i32 %l25)
  %l26 = getelementptr inbounds [15 x i8], [15 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l26)
  br label %b20

b21:                                              ; preds = %b0
  %l30 = load i32, i32* @a_glogal
  %l31 = icmp eq i32 %l30, 50
  br i1 %l31, label %b27, label %b29

b27:                                              ; preds = %b21
  %l32 = getelementptr inbounds [32 x i8], [32 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l32)
  br label %b28

b29:                                              ; preds = %b21
  %l33 = getelementptr inbounds [17 x i8], [17 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l33)
  %l34 = load i32, i32* @a_glogal
  call void @putint(i32 %l34)
  %l35 = getelementptr inbounds [15 x i8], [15 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l35)
  br label %b28

b28:                                              ; preds = %b29, %b27
  br label %b20

b20:                                              ; preds = %b28, %b19
  ret i32 0
}

define i32 @func2_params(i32 %l1, i32 %l3, i32 %l5) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  %l7 = alloca i32
  %l10 = add i32 %l1, %l3
  %l12 = add i32 %l10, %l5
  %l13 = mul i32 6, %l12
  %l14 = sdiv i32 %l13, 2
  %l15 = sub i32 %l14, 2
  %l16 = getelementptr inbounds [34 x i8], [34 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l16)
  call void @putint(i32 %l1)
  %l17 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l17)
  call void @putint(i32 %l3)
  %l18 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l18)
  call void @putint(i32 %l5)
  %l19 = getelementptr inbounds [18 x i8], [18 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l19)
  call void @putint(i32 %l15)
  %l21 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l21)
  store i32 %l15, i32* %l7
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  ret i32 %l15
}

define void @func3_params(i32 %l1) {
b0:
  %l2 = alloca i32
  %l3 = getelementptr inbounds [41 x i8], [41 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l3)
  call void @putint(i32 %l1)
  %l5 = getelementptr inbounds [26 x i8], [26 x i8]* @_str_11, i32 0, i32 0
  call void @putstr(i8* %l5)
  store i32 %l1, i32* %l2
  ret void
}

define void @func4_params(i32 %l1, i32 %l3) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l5 = getelementptr inbounds [34 x i8], [34 x i8]* @_str_12, i32 0, i32 0
  call void @putstr(i8* %l5)
  call void @putint(i32 %l1)
  %l7 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_13, i32 0, i32 0
  call void @putstr(i8* %l7)
  call void @putint(i32 %l3)
  %l9 = getelementptr inbounds [26 x i8], [26 x i8]* @_str_14, i32 0, i32 0
  call void @putstr(i8* %l9)
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  ret void
}

define i32 @func_no_params() {
b0:
  %l1 = getelementptr inbounds [48 x i8], [48 x i8]* @_str_15, i32 0, i32 0
  call void @putstr(i8* %l1)
  ret i32 0
}

define void @func2_no_params() {
b0:
  ret void
}

define i32 @main() {
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  %l3 = alloca i32
  %l4 = call i32 @getint()
  %l5 = call i32 @getint()
  %l6 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_16, i32 0, i32 0
  call void @putstr(i8* %l6)
  %l7 = getelementptr inbounds [12 x i8], [12 x i8]* @_str_17, i32 0, i32 0
  call void @putstr(i8* %l7)
  call void @putint(i32 1)
  %l8 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_18, i32 0, i32 0
  call void @putstr(i8* %l8)
  call void @func3_params(i32 3)
  call void @func4_params(i32 1, i32 2)
  %l11 = call i32 @func_no_params()
  call void @func2_no_params()
  %l13 = getelementptr [5 x i32], [5 x i32]* @arr1_1_global, i32 0, i32 1
  store i32 2, i32* %l13
  %l14 = getelementptr [5 x i32], [5 x i32]* @arr1_1_global, i32 0, i32 4
  store i32 3, i32* %l14
  %l15 = getelementptr [5 x i32], [5 x i32]* @Arr1_1_GLOBAL, i32 0, i32 3
  %l16 = load i32, i32* %l15
  %l17 = getelementptr [5 x i32], [5 x i32]* @arr1_1_global, i32 0, i32 2
  store i32 %l16, i32* %l17
  %l18 = getelementptr [3 x [2 x i32]], [3 x [2 x i32]]* @Arr2_1_GLOBAL, i32 0, i32 1, i32 1
  %l19 = load i32, i32* %l18
  %l20 = getelementptr [3 x [2 x i32]], [3 x [2 x i32]]* @arr2_1_global, i32 0, i32 1, i32 1
  store i32 %l19, i32* %l20
  %l22 = load i32, i32* %l13
  %l23 = mul i32 %l22, 2
  store i32 %l23, i32* %l20
  %l26 = getelementptr inbounds [24 x i8], [24 x i8]* @_str_19, i32 0, i32 0
  call void @putstr(i8* %l26)
  %l27 = load i32, i32* %l20
  call void @putint(i32 %l27)
  %l28 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_20, i32 0, i32 0
  call void @putstr(i8* %l28)
  %l29 = getelementptr [5 x i32], [5 x i32]* @arr1_1_global, i32 0, i32 0
  %l30 = getelementptr [3 x [2 x i32]], [3 x [2 x i32]]* @arr2_1_global, i32 0, i32 0
  %l31 = call i32 @func_params(i32 1, i32* %l29, [2 x i32]* %l30)
  %l33 = load i32, i32* %l13
  %l35 = load i32, i32* %l20
  %l36 = call i32 @func2_params(i32 2, i32 %l33, i32 %l35)
  %l37 = getelementptr inbounds [19 x i8], [19 x i8]* @_str_21, i32 0, i32 0
  call void @putstr(i8* %l37)
  call void @putint(i32 %l36)
  %l39 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_22, i32 0, i32 0
  call void @putstr(i8* %l39)
  %l44 = srem i32 %l4, 7
  %l45 = icmp ne i32 %l44, 0
  store i32 %l4, i32* %l1
  store i32 %l5, i32* %l2
  store i32 %l36, i32* %l3
  br i1 %l45, label %b42, label %b41

b42:                                              ; preds = %b0
  %l46 = load i32, i32* %l2
  %l47 = srem i32 %l46, 7
  %l48 = icmp ne i32 %l47, 0
  br i1 %l48, label %b40, label %b41

b40:                                              ; preds = %b42
  br label %b49

b49:                                              ; preds = %b61, %b62, %b40
  %l52 = load i32, i32* %l1
  %l53 = icmp ne i32 %l52, 0
  %l54 = xor i1 %l53, true
  %l55 = zext i1 %l54 to i32
  %l56 = icmp ne i32 %l55, 0
  br i1 %l56, label %b50, label %b51

b50:                                              ; preds = %b49
  %l57 = load i32, i32* %l1
  %l58 = load i32, i32* %l2
  %l59 = add i32 %l57, %l58
  %l65 = srem i32 %l59, 7
  %l66 = icmp eq i32 %l65, 0
  store i32 %l59, i32* %l1
  br i1 %l66, label %b60, label %b63

b63:                                              ; preds = %b50
  %l67 = load i32, i32* %l1
  %l68 = icmp sgt i32 %l67, 100
  br i1 %l68, label %b60, label %b62

b60:                                              ; preds = %b63, %b50
  br label %b51

b62:                                              ; preds = %b63
  br label %b49

b61:                                              ; No predecessors!
  br label %b49

b51:                                              ; preds = %b60, %b49
  br label %b41

b41:                                              ; preds = %b51, %b42, %b0
  %l72 = load i32, i32* %l1
  %l73 = icmp sge i32 %l72, 30
  br i1 %l73, label %b69, label %b71

b69:                                              ; preds = %b41
  %l74 = getelementptr inbounds [19 x i8], [19 x i8]* @_str_23, i32 0, i32 0
  call void @putstr(i8* %l74)
  %l75 = load i32, i32* %l1
  call void @putint(i32 %l75)
  %l76 = getelementptr inbounds [15 x i8], [15 x i8]* @_str_24, i32 0, i32 0
  call void @putstr(i8* %l76)
  br label %b70

b71:                                              ; preds = %b41
  %l80 = load i32, i32* %l1
  %l81 = icmp sle i32 %l80, 10
  br i1 %l81, label %b77, label %b79

b77:                                              ; preds = %b71
  %l82 = getelementptr inbounds [19 x i8], [19 x i8]* @_str_25, i32 0, i32 0
  call void @putstr(i8* %l82)
  %l83 = load i32, i32* %l1
  call void @putint(i32 %l83)
  %l84 = getelementptr inbounds [15 x i8], [15 x i8]* @_str_26, i32 0, i32 0
  call void @putstr(i8* %l84)
  br label %b78

b79:                                              ; preds = %b71
  %l85 = getelementptr inbounds [19 x i8], [19 x i8]* @_str_27, i32 0, i32 0
  call void @putstr(i8* %l85)
  %l86 = load i32, i32* %l1
  call void @putint(i32 %l86)
  %l87 = getelementptr inbounds [23 x i8], [23 x i8]* @_str_28, i32 0, i32 0
  call void @putstr(i8* %l87)
  br label %b78

b78:                                              ; preds = %b79, %b77
  br label %b70

b70:                                              ; preds = %b78, %b69
  %l88 = load i32, i32* %l1
  %l89 = sub i32 0, %l88
  %l90 = load i32, i32* %l2
  %l91 = getelementptr inbounds [50 x i8], [50 x i8]* @_str_29, i32 0, i32 0
  call void @putstr(i8* %l91)
  store i32 %l89, i32* %l1
  store i32 %l90, i32* %l2
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getint() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %1)
  %3 = load i32, i32* %1, align 4
  ret i32 %3
}

declare dso_local i32 @__isoc99_scanf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getch() #0 {
  %1 = alloca i8, align 1
  %2 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8* %1)
  %3 = load i8, i8* %1, align 1
  %4 = sext i8 %3 to i32
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getarray(i32* %0) #0 {
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32* %0, i32** %2, align 8
  %5 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %3)
  store i32 0, i32* %4, align 4
  br label %6

6:                                                ; preds = %16, %1
  %7 = load i32, i32* %4, align 4
  %8 = load i32, i32* %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %19

10:                                               ; preds = %6
  %11 = load i32*, i32** %2, align 8
  %12 = load i32, i32* %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32* %11, i64 %13
  %15 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %14)
  br label %16

16:                                               ; preds = %10
  %17 = load i32, i32* %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %4, align 4
  br label %6

19:                                               ; preds = %6
  %20 = load i32, i32* %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putint(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %3)
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putch(i32 %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putarray(i32 %0, i32* %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32* %1, i32** %4, align 8
  %6 = load i32, i32* %3, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %6)
  store i32 0, i32* %5, align 4
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i32, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %22

12:                                               ; preds = %8
  %13 = load i32*, i32** %4, align 8
  %14 = load i32, i32* %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32* %13, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %17)
  br label %19

19:                                               ; preds = %12
  %20 = load i32, i32* %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %5, align 4
  br label %8

22:                                               ; preds = %8
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putstr(i8* %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i8* %3)
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 10.0.0-4ubuntu1 "}
!1 = !{i32 1, !"wchar_size", i32 4}
