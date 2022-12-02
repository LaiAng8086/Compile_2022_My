; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@N = constant i32 10
@a = global [10 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9]
@_str_0 = constant [3 x i8] c", \00"
@_str_1 = constant [2 x i8] c"\0A\00"
@_str_2 = constant [3 x i8] c", \00"
@_str_3 = constant [3 x i8] c", \00"
@_str_4 = constant [2 x i8] c"\0A\00"
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define i32 @fib(i32 %l1) {
b0:
  %l2 = alloca i32
  store i32 %l1, i32* %l2
  %l5 = load i32, i32* %l2
  %l6 = icmp eq i32 %l5, 1
  br i1 %l6, label %b3, label %b4

b3:                                               ; preds = %b0
  ret i32 1

b4:                                               ; preds = %b0
  %l9 = load i32, i32* %l2
  %l10 = icmp eq i32 %l9, 2
  br i1 %l10, label %b7, label %b8

b7:                                               ; preds = %b4
  ret i32 2

b8:                                               ; preds = %b4
  %l11 = load i32, i32* %l2
  %l12 = sub i32 %l11, 1
  %l13 = call i32 @fib(i32 %l12)
  %l14 = sub i32 %l11, 2
  %l15 = call i32 @fib(i32 %l14)
  %l16 = add i32 %l13, %l15
  ret i32 %l16
}

define i32 @main() {
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  %l23 = alloca i32
  store i32 2, i32* %l1
  store i32 5, i32* %l2
  %l3 = call i32 @getint()
  store i32 %l3, i32* %l1
  %l4 = call i32 @getint()
  store i32 %l4, i32* %l2
  %l5 = load i32, i32* %l1
  %l6 = load i32, i32* %l2
  %l7 = mul i32 %l5, %l6
  %l8 = sub i32 0, %l7
  %l9 = call i32 @fib(i32 4)
  %l10 = mul i32 %l8, %l9
  %l11 = add i32 %l10, 0
  %l12 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 1
  %l13 = load i32, i32* %l12
  %l14 = mul i32 %l13, 1
  %l15 = add i32 %l11, %l14
  %l16 = sub i32 %l15, 0
  %l17 = mul i32 %l16, 5
  store i32 %l17, i32* %l1
  %l18 = call i32 @fib(i32 5)
  %l19 = add i32 %l18, 2
  %l20 = call i32 @fib(i32 %l19)
  %l21 = sub i32 1197, %l20
  %l22 = add i32 %l21, -10091
  store i32 %l22, i32* %l2
  store i32 -6, i32* %l23
  br label %b24

b24:                                              ; preds = %b25, %b0
  %l27 = load i32, i32* %l1
  %l28 = icmp sle i32 %l27, 100
  br i1 %l28, label %b25, label %b26

b25:                                              ; preds = %b24
  %l29 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 0
  %l30 = load i32, i32* %l23
  %l31 = mul i32 %l30, %l30
  %l32 = load i32, i32* %l29
  %l33 = add i32 %l32, %l31
  %l34 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 0
  store i32 %l33, i32* %l34
  %l35 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 1
  %l36 = mul i32 %l30, %l30
  %l37 = load i32, i32* %l35
  %l38 = add i32 %l37, %l36
  %l39 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 1
  store i32 %l38, i32* %l39
  %l40 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 2
  %l41 = mul i32 %l30, %l30
  %l42 = load i32, i32* %l40
  %l43 = add i32 %l42, %l41
  %l44 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 2
  store i32 %l43, i32* %l44
  %l45 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 3
  %l46 = mul i32 %l30, %l30
  %l47 = load i32, i32* %l45
  %l48 = add i32 %l47, %l46
  %l49 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 3
  store i32 %l48, i32* %l49
  %l50 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 4
  %l51 = mul i32 %l30, %l30
  %l52 = load i32, i32* %l50
  %l53 = add i32 %l52, %l51
  %l54 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 4
  store i32 %l53, i32* %l54
  %l55 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 5
  %l56 = mul i32 %l30, %l30
  %l57 = load i32, i32* %l55
  %l58 = add i32 %l57, %l56
  %l59 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 5
  store i32 %l58, i32* %l59
  %l60 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 6
  %l61 = mul i32 %l30, %l30
  %l62 = load i32, i32* %l60
  %l63 = add i32 %l62, %l61
  %l64 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 6
  store i32 %l63, i32* %l64
  %l65 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 7
  %l66 = mul i32 %l30, %l30
  %l67 = load i32, i32* %l65
  %l68 = add i32 %l67, %l66
  %l69 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 7
  store i32 %l68, i32* %l69
  %l70 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 8
  %l71 = mul i32 %l30, %l30
  %l72 = load i32, i32* %l70
  %l73 = add i32 %l72, %l71
  %l74 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 8
  store i32 %l73, i32* %l74
  %l75 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 9
  %l76 = mul i32 %l30, %l30
  %l77 = load i32, i32* %l75
  %l78 = add i32 %l77, %l76
  %l79 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 9
  store i32 %l78, i32* %l79
  %l80 = load i32, i32* %l1
  %l81 = add i32 %l80, 1
  store i32 %l81, i32* %l1
  br label %b24

b26:                                              ; preds = %b24
  store i32 0, i32* %l1
  br label %b82

b82:                                              ; preds = %b83, %b26
  %l85 = load i32, i32* %l1
  %l86 = icmp slt i32 %l85, 10
  br i1 %l86, label %b83, label %b84

b83:                                              ; preds = %b82
  %l87 = load i32, i32* %l1
  %l88 = getelementptr [10 x i32], [10 x i32]* @a, i32 0, i32 %l87
  %l89 = load i32, i32* %l88
  call void @putint(i32 %l89)
  %l90 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l90)
  %l91 = add i32 %l87, 1
  store i32 %l91, i32* %l1
  br label %b82

b84:                                              ; preds = %b82
  %l92 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l92)
  %l93 = load i32, i32* %l1
  call void @putint(i32 %l93)
  %l94 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l94)
  %l95 = load i32, i32* %l2
  call void @putint(i32 %l95)
  %l96 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l96)
  %l97 = load i32, i32* %l23
  call void @putint(i32 %l97)
  %l98 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l98)
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
