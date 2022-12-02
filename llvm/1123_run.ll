; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a_c_num_1 = constant i32 1
@a_c_num_2 = constant i32 2
@a_c_num_3 = constant i32 3
@a_c_num_4 = constant i32 4
@a_c_num_5 = constant i32 5
@a_c_num_6 = constant i32 6
@a_v_num = global i32 0
@a_v_num_1 = global i32 1
@a_v_num_2 = global i32 2
@_str_0 = constant [10 x i8] c"20373260\0A\00"
@_str_1 = constant [11 x i8] c"a_c_num_1:\00"
@_str_2 = constant [2 x i8] c"\0A\00"
@_str_3 = constant [11 x i8] c"a_c_num_2:\00"
@_str_4 = constant [13 x i8] c", a_v_num_2:\00"
@_str_5 = constant [2 x i8] c"\0A\00"
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define void @non_param_func() {
b0:
  ret void
}

define i32 @one_param_func(i32 %l1) {
b0:
  %l2 = alloca i32
  %l3 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  %l7 = add i32 %l1, 1
  store i32 %l1, i32* %l2
  store i32 1, i32* %l4
  store i32 2, i32* %l5
  ret i32 %l7
}

define i32 @two_param_func(i32 %l1, i32 %l3) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l7 = add i32 %l1, %l3
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  ret i32 %l7
}

define i32 @more_than_two_param_func(i32 %l1, i32 %l3, i32 %l5) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  %l9 = add i32 %l1, %l3
  %l11 = sub i32 %l9, %l5
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  ret i32 %l11
}

define i32 @main() {
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  %l3 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  %l6 = alloca i32
  %l14 = alloca i32
  call void @non_param_func()
  %l11 = call i32 @more_than_two_param_func(i32 3, i32 4, i32 5)
  store i32 1, i32* %l1
  store i32 2, i32* %l3
  store i32 3, i32* %l4
  store i32 4, i32* %l5
  store i32 5, i32* %l6
  br i1 true, label %b12, label %b13

b12:                                              ; preds = %b0
  %l15 = load i32, i32* %l3
  %l16 = add i32 %l15, 1
  %l18 = call i32 @two_param_func(i32 1, i32 %l16)
  %l23 = mul i32 %l18, 1
  %l24 = mul i32 %l16, 1
  %l25 = add i32 1, %l24
  %l26 = icmp eq i32 %l23, %l25
  store i32 %l16, i32* %l14
  store i32 %l18, i32* %l2
  br i1 %l26, label %b19, label %b21

b19:                                              ; preds = %b12
  call void @non_param_func()
  br label %b20

b21:                                              ; preds = %b12
  store i32 1, i32* @a_v_num
  br label %b28

b28:                                              ; preds = %b41, %b40, %b21
  %l31 = load i32, i32* @a_v_num
  %l32 = icmp sle i32 %l31, 3
  br i1 %l32, label %b29, label %b30

b29:                                              ; preds = %b28
  %l33 = load i32, i32* @a_v_num
  %l34 = call i32 @one_param_func(i32 %l33)
  store i32 %l34, i32* @a_v_num
  br i1 true, label %b37, label %b36

b37:                                              ; preds = %b29
  %l38 = load i32, i32* @a_v_num
  %l39 = icmp eq i32 %l38, 3
  br i1 %l39, label %b35, label %b36

b35:                                              ; preds = %b37
  br label %b30

b36:                                              ; preds = %b37, %b29
  br i1 true, label %b40, label %b41

b40:                                              ; preds = %b36
  br label %b28

b41:                                              ; preds = %b36
  br label %b28

b30:                                              ; preds = %b35, %b28
  br label %b20

b20:                                              ; preds = %b30, %b19
  br label %b13

b13:                                              ; preds = %b20, %b0
  %l42 = call i32 @one_param_func(i32 1)
  %l43 = mul i32 1, %l42
  %l44 = sdiv i32 %l43, 4
  %l45 = srem i32 %l44, -3
  %l46 = sub i32 %l45, 2
  %l48 = call i32 @getint()
  %l49 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l49)
  %l50 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l50)
  call void @putint(i32 1)
  %l51 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l51)
  %l52 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l52)
  call void @putint(i32 2)
  %l53 = getelementptr inbounds [13 x i8], [13 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l53)
  %l54 = load i32, i32* @a_v_num_2
  call void @putint(i32 %l54)
  %l55 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l55)
  store i32 %l48, i32* %l2
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
