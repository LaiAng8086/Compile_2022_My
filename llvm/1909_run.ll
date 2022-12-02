; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@globalConst1 = constant i32 11
@globalConst2 = constant i32 22
@globalConstArray2 = constant [3 x [2 x i32]] [[2 x i32] [i32 6, i32 7], [2 x i32] [i32 8, i32 9], [2 x i32] [i32 10, i32 11]]
@globalConstArray1 = constant [3 x i32] [i32 10, i32 20, i32 30]
@globalVirable1 = global i32 111
@globalVirable2 = global i32 0
@_str_0 = constant [2 x i8] c"[\00"
@_str_1 = constant [3 x i8] c"][\00"
@_str_2 = constant [3 x i8] c"]:\00"
@_str_3 = constant [2 x i8] c"|\00"
@_str_4 = constant [5 x i8] c" , [\00"
@_str_5 = constant [3 x i8] c"]:\00"
@_str_6 = constant [2 x i8] c"|\00"
@_str_7 = constant [2 x i8] c"\0A\00"
@_str_8 = constant [10 x i8] c"19373063\0A\00"
@_str_9 = constant [19 x i8] c"1.localVirable1 = \00"
@_str_10 = constant [18 x i8] c",localVirable2 = \00"
@_str_11 = constant [6 x i8] c" \0A2.\0A\00"
@_str_12 = constant [3 x i8] c"?\0A\00"
@_str_13 = constant [45 x i8] c"3.function of kinds of parameters testified\0A\00"
@_str_14 = constant [21 x i8] c"4.non exp testified\0A\00"
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define void @assignmentArray(i32 %l1, i32* %l3, [2 x i32]* %l4) {
b0:
  %l2 = alloca i32
  %l5 = alloca i32
  %l6 = alloca i32
  %l8 = alloca i32
  %l10 = sub i32 %l1, 1
  store i32 %l10, i32* %l8
  store i32 %l1, i32* %l2
  store i32 0, i32* %l5
  store i32 0, i32* %l6
  br label %b11

b11:                                              ; preds = %b12, %b0
  %l15 = load i32, i32* %l5
  %l16 = icmp slt i32 %l15, 3
  br i1 %l16, label %b14, label %b13

b14:                                              ; preds = %b11
  %l17 = load i32, i32* %l5
  %l18 = load i32, i32* %l8
  %l19 = icmp sle i32 %l17, %l18
  br i1 %l19, label %b12, label %b13

b12:                                              ; preds = %b14
  %l20 = load i32, i32* %l5
  %l21 = getelementptr [3 x i32], [3 x i32]* @globalConstArray1, i32 0, i32 %l20
  %l22 = load i32, i32* %l21
  %l23 = sdiv i32 %l22, 10
  %l24 = sub i32 %l23, 10
  %l25 = getelementptr i32, i32* %l3, i32 %l20
  store i32 %l24, i32* %l25
  %l26 = add i32 %l20, 1
  store i32 %l26, i32* %l5
  br label %b11

b13:                                              ; preds = %b14, %b11
  %l27 = load i32, i32* %l5
  %l28 = sub i32 %l27, 1
  store i32 %l28, i32* %l5
  br label %b29

b29:                                              ; preds = %b42, %b13
  %l32 = load i32, i32* %l5
  %l33 = icmp sge i32 %l32, 0
  br i1 %l33, label %b30, label %b31

b30:                                              ; preds = %b29
  %l34 = load i32, i32* %l5
  %l35 = getelementptr [3 x i32], [3 x i32]* @globalConstArray1, i32 0, i32 %l34
  %l36 = load i32, i32* %l35
  %l37 = sdiv i32 %l36, 10
  %l38 = sub i32 %l37, 10
  %l39 = getelementptr i32, i32* %l3, i32 %l34
  store i32 %l38, i32* %l39
  br label %b40

b40:                                              ; preds = %b44, %b43, %b30
  br label %b41

b41:                                              ; preds = %b40
  %l46 = load i32, i32* %l6
  %l47 = icmp slt i32 %l46, 2
  br i1 %l47, label %b43, label %b45

b43:                                              ; preds = %b41
  %l48 = load i32, i32* %l5
  %l49 = load i32, i32* %l6
  %l50 = getelementptr [3 x [2 x i32]], [3 x [2 x i32]]* @globalConstArray2, i32 0, i32 %l48, i32 %l49
  %l51 = load i32, i32* %l50
  %l52 = srem i32 %l51, 6
  %l53 = add i32 %l52, 6
  %l54 = getelementptr [2 x i32], [2 x i32]* %l4, i32 %l48, i32 %l49
  store i32 %l53, i32* %l54
  %l55 = add i32 %l49, 1
  store i32 %l55, i32* %l6
  br label %b40

b45:                                              ; preds = %b41
  %l56 = load i32, i32* %l5
  %l58 = getelementptr [2 x i32], [2 x i32]* %l4, i32 %l56, i32 0
  %l59 = getelementptr [3 x [2 x i32]], [3 x [2 x i32]]* @globalConstArray2, i32 0, i32 %l56, i32 0
  %l60 = getelementptr i32, i32* %l3, i32 %l56
  %l61 = getelementptr [3 x i32], [3 x i32]* @globalConstArray1, i32 0, i32 %l56
  %l62 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l62)
  call void @putint(i32 %l56)
  %l63 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l63)
  call void @putint(i32 0)
  %l64 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l64)
  %l65 = load i32, i32* %l58
  call void @putint(i32 %l65)
  %l66 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l66)
  %l67 = load i32, i32* %l59
  call void @putint(i32 %l67)
  %l68 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l68)
  call void @putint(i32 %l56)
  %l69 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l69)
  %l70 = load i32, i32* %l60
  call void @putint(i32 %l70)
  %l71 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l71)
  %l72 = load i32, i32* %l61
  call void @putint(i32 %l72)
  %l73 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l73)
  store i32 0, i32* %l6
  br label %b42

b44:                                              ; No predecessors!
  br label %b40

b42:                                              ; preds = %b45
  %l74 = load i32, i32* %l5
  %l75 = sub i32 %l74, 1
  store i32 %l75, i32* %l5
  br label %b29

b31:                                              ; preds = %b29
  ret void
}

define i32 @main() {
b0:
  %l2 = alloca i32
  %l3 = alloca [3 x i32]
  %l4 = alloca [3 x [2 x i32]]
  %l5 = alloca i32
  %l8 = alloca i32
  %l1 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l1)
  %l6 = getelementptr [3 x [2 x i32]], [3 x [2 x i32]]* @globalConstArray2, i32 0, i32 2, i32 0
  %l7 = load i32, i32* %l6
  %l9 = getelementptr inbounds [19 x i8], [19 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l9)
  call void @putint(i32 11)
  %l11 = getelementptr inbounds [18 x i8], [18 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l11)
  %l12 = load i32, i32* %l5
  call void @putint(i32 %l12)
  %l13 = getelementptr inbounds [6 x i8], [6 x i8]* @_str_11, i32 0, i32 0
  call void @putstr(i8* %l13)
  %l15 = getelementptr [3 x i32], [3 x i32]* %l3, i32 0, i32 0
  %l16 = getelementptr [3 x [2 x i32]], [3 x [2 x i32]]* %l4, i32 0, i32 0
  call void @assignmentArray(i32 3, i32* %l15, [2 x i32]* %l16)
  %l18 = getelementptr [3 x [2 x i32]], [3 x [2 x i32]]* %l4, i32 0, i32 1, i32 1
  %l19 = load i32, i32* %l18
  call void @putint(i32 %l19)
  %l20 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_12, i32 0, i32 0
  call void @putstr(i8* %l20)
  %l21 = getelementptr inbounds [45 x i8], [45 x i8]* @_str_13, i32 0, i32 0
  call void @putstr(i8* %l21)
  store i32 3, i32* %l8
  store i32 11, i32* %l2
  store i32 %l7, i32* %l5
  br label %b22

b22:                                              ; preds = %b0
  br label %b23

b23:                                              ; preds = %b22
  %l24 = getelementptr inbounds [21 x i8], [21 x i8]* @_str_14, i32 0, i32 0
  call void @putstr(i8* %l24)
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
