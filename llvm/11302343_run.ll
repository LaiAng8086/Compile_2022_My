; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ZERO = constant i32 0
@ONE = constant i32 1
@TWO = constant i32 2
@THREE = constant i32 3
@one = global i32 1
@two = global i32 2
@three = global i32 3
@gvar = global i32 0
@_str_0 = constant [10 x i8] c"20373358\0A\00"
@_str_1 = constant [24 x i8] c"Some global constants: \00"
@_str_2 = constant [2 x i8] c" \00"
@_str_3 = constant [2 x i8] c" \00"
@_str_4 = constant [2 x i8] c" \00"
@_str_5 = constant [2 x i8] c"\0A\00"
@_str_6 = constant [23 x i8] c"Some local constants: \00"
@_str_7 = constant [2 x i8] c" \00"
@_str_8 = constant [2 x i8] c" \00"
@_str_9 = constant [2 x i8] c" \00"
@_str_10 = constant [2 x i8] c"\0A\00"
@_str_11 = constant [24 x i8] c"Some global variables: \00"
@_str_12 = constant [2 x i8] c" \00"
@_str_13 = constant [2 x i8] c" \00"
@_str_14 = constant [2 x i8] c"\0A\00"
@_str_15 = constant [23 x i8] c"Some local variables: \00"
@_str_16 = constant [2 x i8] c" \00"
@_str_17 = constant [2 x i8] c" \00"
@_str_18 = constant [2 x i8] c"\0A\00"
@_str_19 = constant [24 x i8] c"Set global variable as \00"
@_str_20 = constant [2 x i8] c"\0A\00"
@_str_21 = constant [23 x i8] c"Set local variable as \00"
@_str_22 = constant [2 x i8] c"\0A\00"
@_str_23 = constant [11 x i8] c"Calculate \00"
@_str_24 = constant [2 x i8] c"\0A\00"
@_str_25 = constant [11 x i8] c"Calculate \00"
@_str_26 = constant [2 x i8] c"\0A\00"
@_str_27 = constant [11 x i8] c"Calculate \00"
@_str_28 = constant [2 x i8] c"\0A\00"
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define i32 @main() {
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
