; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@MAT1 = constant [2 x i32] [i32 1, i32 10]
@MAT2 = global [3 x i32] zeroinitializer
@MAT3 = global [2 x i32] [i32 2, i32 4]
@DMAT1 = constant [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 2, i32 3]]
@DMAT2 = global [2 x [2 x i32]] zeroinitializer
@DMAT3 = global [2 x [2 x i32]] [[2 x i32] [i32 4, i32 3], [2 x i32] [i32 9, i32 9]]
@_str_0 = constant [2 x i8] c" \00"
@_str_1 = constant [2 x i8] c" \00"
@_str_2 = constant [2 x i8] c" \00"
@_str_3 = constant [2 x i8] c" \00"
@_str_4 = constant [2 x i8] c"\0A\00"
@_str_5 = constant [2 x i8] c" \00"
@_str_6 = constant [2 x i8] c" \00"
@_str_7 = constant [2 x i8] c" \00"
@_str_8 = constant [2 x i8] c"\0A\00"
@_str_9 = constant [2 x i8] c" \00"
@_str_10 = constant [2 x i8] c" \00"
@_str_11 = constant [2 x i8] c" \00"
@_str_12 = constant [2 x i8] c"\0A\00"
@_str_13 = constant [10 x i8] c"20376131\0A\00"
@_str_14 = constant [4 x i8] c"i: \00"
@_str_15 = constant [2 x i8] c"\0A\00"
@_str_16 = constant [17 x i8] c"i == 5 is True!\0A\00"
@_str_17 = constant [4 x i8] c"i: \00"
@_str_18 = constant [6 x i8] c", j: \00"
@_str_19 = constant [2 x i8] c"\0A\00"
@_str_20 = constant [4 x i8] c"i: \00"
@_str_21 = constant [6 x i8] c", j: \00"
@_str_22 = constant [2 x i8] c"\0A\00"
@_str_23 = constant [2 x i8] c"\0A\00"
@_str_24 = constant [2 x i8] c"\0A\00"
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define i32 @getVal6() {
b0:
  ret i32 6
}

define i32 @getValDouble(i32 %l1) {
b0:
  %l2 = alloca i32
  %l4 = add i32 %l1, %l1
  store i32 %l1, i32* %l2
  ret i32 %l4
}

define i32 @getAddVal(i32 %l1, i32 %l3) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l7 = add i32 %l1, %l3
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  ret i32 %l7
}

define i32 @otherPrint(i32* %l1) {
b0:
  %l2 = alloca i32
  %l3 = getelementptr i32, i32* %l1, i32 0
  %l4 = getelementptr i32, i32* %l1, i32 1
  %l5 = getelementptr [2 x i32], [2 x i32]* @MAT1, i32 0, i32 0
  %l6 = getelementptr [3 x i32], [3 x i32]* @MAT2, i32 0, i32 0
  %l7 = getelementptr [2 x i32], [2 x i32]* @MAT3, i32 0, i32 0
  %l8 = load i32, i32* %l3
  call void @putint(i32 %l8)
  %l9 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l9)
  %l10 = load i32, i32* %l4
  call void @putint(i32 %l10)
  %l11 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l11)
  %l12 = load i32, i32* %l5
  call void @putint(i32 %l12)
  %l13 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l13)
  %l14 = load i32, i32* %l6
  call void @putint(i32 %l14)
  %l15 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l15)
  %l16 = load i32, i32* %l7
  call void @putint(i32 %l16)
  %l17 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l17)
  store i32 0, i32* %l2
  ret i32 0
}

define void @DotherPrint([2 x i32]* %l1) {
b0:
  %l2 = alloca i32
  %l3 = getelementptr [2 x i32], [2 x i32]* %l1, i32 0, i32 0
  %l4 = getelementptr [2 x i32], [2 x i32]* %l1, i32 0, i32 1
  %l5 = getelementptr [2 x i32], [2 x i32]* %l1, i32 1, i32 0
  %l6 = getelementptr [2 x i32], [2 x i32]* %l1, i32 1, i32 1
  %l7 = load i32, i32* %l3
  call void @putint(i32 %l7)
  %l8 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l8)
  %l9 = load i32, i32* %l4
  call void @putint(i32 %l9)
  %l10 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l10)
  %l11 = load i32, i32* %l5
  call void @putint(i32 %l11)
  %l12 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l12)
  %l13 = load i32, i32* %l6
  call void @putint(i32 %l13)
  %l14 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l14)
  %l15 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT2, i32 0, i32 0, i32 0
  %l16 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT2, i32 0, i32 0, i32 1
  %l17 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT2, i32 0, i32 1, i32 0
  %l18 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT2, i32 0, i32 1, i32 1
  %l19 = load i32, i32* %l15
  call void @putint(i32 %l19)
  %l20 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l20)
  %l21 = load i32, i32* %l16
  call void @putint(i32 %l21)
  %l22 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l22)
  %l23 = load i32, i32* %l17
  call void @putint(i32 %l23)
  %l24 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_11, i32 0, i32 0
  call void @putstr(i8* %l24)
  %l25 = load i32, i32* %l18
  call void @putint(i32 %l25)
  %l26 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_12, i32 0, i32 0
  call void @putstr(i8* %l26)
  store i32 0, i32* %l2
  ret void
}

define i32 @main() {
b0:
  %l1 = alloca i32
  %l61 = alloca i32
  %l2 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_13, i32 0, i32 0
  call void @putstr(i8* %l2)
  store i32 1, i32* %l1
  br label %b3

b3:                                               ; preds = %b4, %b0
  %l6 = load i32, i32* %l1
  %l7 = icmp ne i32 %l6, 2
  br i1 %l7, label %b4, label %b5

b4:                                               ; preds = %b3
  %l8 = load i32, i32* %l1
  %l9 = add i32 %l8, 1
  store i32 %l9, i32* %l1
  br label %b3

b5:                                               ; preds = %b3
  %l10 = getelementptr [2 x i32], [2 x i32]* @MAT1, i32 0, i32 1
  %l11 = load i32, i32* %l10
  %l13 = add i32 %l11, 1
  %l15 = sub i32 0, %l13
  %l16 = getelementptr inbounds [4 x i8], [4 x i8]* @_str_14, i32 0, i32 0
  call void @putstr(i8* %l16)
  call void @putint(i32 %l15)
  %l18 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_15, i32 0, i32 0
  call void @putstr(i8* %l18)
  %l19 = call i32 @getVal6()
  %l21 = mul i32 %l19, -4
  %l22 = sdiv i32 %l21, -2
  %l23 = srem i32 %l22, 7
  %l27 = icmp ne i32 %l23, 0
  %l28 = xor i1 %l27, true
  %l29 = zext i1 %l28 to i32
  %l30 = icmp ne i32 %l29, 0
  store i32 %l23, i32* %l1
  br i1 %l30, label %b24, label %b25

b24:                                              ; preds = %b5
  %l31 = load i32, i32* %l1
  %l32 = add i32 %l31, 2
  br label %b25

b25:                                              ; preds = %b24, %b5
  %l36 = load i32, i32* %l1
  %l37 = icmp sgt i32 %l36, 0
  br i1 %l37, label %b33, label %b35

b33:                                              ; preds = %b25
  %l38 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT2, i32 0, i32 0, i32 0
  store i32 2, i32* %l38
  %l41 = call i32 @getValDouble(i32 2)
  %l42 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT2, i32 0, i32 0, i32 1
  %l45 = mul i32 %l41, 2
  %l46 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT2, i32 0, i32 1, i32 0
  store i32 %l41, i32* %l42
  store i32 %l45, i32* %l46
  %l51 = call i32 @getAddVal(i32 %l41, i32 %l41)
  %l52 = call i32 @getValDouble(i32 %l51)
  %l53 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT2, i32 0, i32 1, i32 1
  store i32 %l52, i32* %l53
  br label %b34

b35:                                              ; preds = %b25
  %l54 = load i32, i32* %l1
  %l55 = add i32 %l54, 2
  br label %b34

b34:                                              ; preds = %b35, %b33
  %l58 = load i32, i32* %l1
  %l59 = icmp eq i32 %l58, 5
  br i1 %l59, label %b56, label %b57

b56:                                              ; preds = %b34
  %l60 = getelementptr inbounds [17 x i8], [17 x i8]* @_str_16, i32 0, i32 0
  call void @putstr(i8* %l60)
  br label %b57

b57:                                              ; preds = %b56, %b34
  %l62 = getelementptr [2 x i32], [2 x i32]* @MAT1, i32 0, i32 1
  %l63 = load i32, i32* %l62
  %l64 = call i32 @getValDouble(i32 %l63)
  %l66 = call i32 @getValDouble(i32 2)
  %l67 = sub i32 0, %l66
  %l68 = sub i32 0, %l67
  %l69 = add i32 %l68, -4
  %l70 = getelementptr inbounds [4 x i8], [4 x i8]* @_str_17, i32 0, i32 0
  call void @putstr(i8* %l70)
  call void @putint(i32 %l64)
  %l72 = getelementptr inbounds [6 x i8], [6 x i8]* @_str_18, i32 0, i32 0
  call void @putstr(i8* %l72)
  call void @putint(i32 %l69)
  %l74 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_19, i32 0, i32 0
  call void @putstr(i8* %l74)
  %l75 = getelementptr [3 x i32], [3 x i32]* @MAT2, i32 0, i32 0
  %l76 = getelementptr [3 x i32], [3 x i32]* @MAT2, i32 0, i32 1
  %l77 = getelementptr [2 x i32], [2 x i32]* @MAT3, i32 0, i32 0
  store i32 3, i32* %l76
  store i32 1, i32* %l75
  %l78 = call i32 @otherPrint(i32* %l77)
  %l79 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT1, i32 0, i32 1, i32 1
  %l80 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT1, i32 0, i32 0, i32 0
  %l81 = getelementptr inbounds [4 x i8], [4 x i8]* @_str_20, i32 0, i32 0
  call void @putstr(i8* %l81)
  %l82 = load i32, i32* %l79
  call void @putint(i32 %l82)
  %l83 = getelementptr inbounds [6 x i8], [6 x i8]* @_str_21, i32 0, i32 0
  call void @putstr(i8* %l83)
  %l84 = load i32, i32* %l80
  call void @putint(i32 %l84)
  %l85 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_22, i32 0, i32 0
  call void @putstr(i8* %l85)
  %l86 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT3, i32 0, i32 0
  call void @DotherPrint([2 x i32]* %l86)
  %l88 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT2, i32 0, i32 0, i32 1
  store i32 520, i32* %l88
  call void @putint(i32 520)
  %l91 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_23, i32 0, i32 0
  call void @putstr(i8* %l91)
  %l92 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @DMAT2, i32 0, i32 1, i32 0
  store i32 1314, i32* %l92
  call void @putint(i32 1314)
  %l95 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_24, i32 0, i32 0
  call void @putstr(i8* %l95)
  store i32 %l69, i32* %l61
  store i32 %l64, i32* %l1
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
