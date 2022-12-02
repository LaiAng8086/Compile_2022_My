; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@MAXN = constant i32 100
@_str_0 = constant [10 x i8] c"20377020\0A\00"
@_str_1 = constant [2 x i8] c"\0A\00"
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define void @swap(i32* %l1, i32 %l2, i32 %l4) {
b0:
  %l3 = alloca i32
  %l5 = alloca i32
  %l6 = alloca i32
  %l8 = getelementptr i32, i32* %l1, i32 %l2
  %l9 = load i32, i32* %l8
  %l11 = getelementptr i32, i32* %l1, i32 %l4
  %l12 = load i32, i32* %l11
  store i32 %l12, i32* %l8
  store i32 %l9, i32* %l11
  store i32 %l2, i32* %l3
  store i32 %l4, i32* %l5
  store i32 %l9, i32* %l6
  ret void
}

define void @heapify(i32* %l1, i32 %l2) {
b0:
  %l3 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  %l6 = alloca i32
  %l8 = mul i32 2, %l2
  %l10 = add i32 %l8, 1
  %l14 = getelementptr i32, i32* %l1, i32 0
  %l16 = load i32, i32* %l14
  %l17 = icmp sle i32 %l8, %l16
  store i32 %l2, i32* %l3
  store i32 %l8, i32* %l4
  store i32 %l10, i32* %l5
  br i1 %l17, label %b11, label %b13

b11:                                              ; preds = %b0
  %l21 = load i32, i32* %l4
  %l22 = getelementptr i32, i32* %l1, i32 %l21
  %l23 = load i32, i32* %l3
  %l24 = getelementptr i32, i32* %l1, i32 %l23
  %l25 = load i32, i32* %l22
  %l26 = load i32, i32* %l24
  %l27 = icmp sgt i32 %l25, %l26
  br i1 %l27, label %b18, label %b20

b18:                                              ; preds = %b11
  %l28 = load i32, i32* %l4
  store i32 %l28, i32* %l6
  br label %b19

b20:                                              ; preds = %b11
  %l29 = load i32, i32* %l3
  store i32 %l29, i32* %l6
  br label %b19

b19:                                              ; preds = %b20, %b18
  br label %b12

b13:                                              ; preds = %b0
  %l30 = load i32, i32* %l3
  store i32 %l30, i32* %l6
  br label %b12

b12:                                              ; preds = %b13, %b19
  %l33 = getelementptr i32, i32* %l1, i32 0
  %l34 = load i32, i32* %l5
  %l35 = load i32, i32* %l33
  %l36 = icmp sle i32 %l34, %l35
  br i1 %l36, label %b31, label %b32

b31:                                              ; preds = %b12
  %l39 = load i32, i32* %l5
  %l40 = getelementptr i32, i32* %l1, i32 %l39
  %l41 = load i32, i32* %l6
  %l42 = getelementptr i32, i32* %l1, i32 %l41
  %l43 = load i32, i32* %l40
  %l44 = load i32, i32* %l42
  %l45 = icmp sgt i32 %l43, %l44
  br i1 %l45, label %b37, label %b38

b37:                                              ; preds = %b31
  %l46 = load i32, i32* %l5
  store i32 %l46, i32* %l6
  br label %b38

b38:                                              ; preds = %b37, %b31
  br label %b32

b32:                                              ; preds = %b38, %b12
  %l49 = load i32, i32* %l6
  %l50 = load i32, i32* %l3
  %l51 = icmp ne i32 %l49, %l50
  br i1 %l51, label %b47, label %b48

b47:                                              ; preds = %b32
  %l52 = load i32, i32* %l3
  %l53 = load i32, i32* %l6
  call void @swap(i32* %l1, i32 %l52, i32 %l53)
  call void @heapify(i32* %l1, i32 %l53)
  br label %b48

b48:                                              ; preds = %b47, %b32
  ret void
}

define void @build_heap(i32* %l1) {
b0:
  %l2 = alloca i32
  %l3 = getelementptr i32, i32* %l1, i32 0
  %l4 = load i32, i32* %l3
  %l5 = sdiv i32 %l4, 2
  store i32 %l5, i32* %l2
  br label %b6

b6:                                               ; preds = %b7, %b0
  %l9 = load i32, i32* %l2
  %l10 = icmp sge i32 %l9, 1
  br i1 %l10, label %b7, label %b8

b7:                                               ; preds = %b6
  %l11 = load i32, i32* %l2
  call void @heapify(i32* %l1, i32 %l11)
  %l13 = sub i32 %l11, 1
  store i32 %l13, i32* %l2
  br label %b6

b8:                                               ; preds = %b6
  ret void
}

define void @heap_sort() {
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  %l3 = alloca [100 x i32]
  %l4 = call i32 @getint()
  %l6 = getelementptr [100 x i32], [100 x i32]* %l3, i32 0, i32 0
  store i32 %l4, i32* %l6
  store i32 1, i32* %l1
  store i32 %l4, i32* %l2
  br label %b7

b7:                                               ; preds = %b8, %b0
  %l10 = load i32, i32* %l2
  %l11 = add i32 %l10, 1
  %l12 = load i32, i32* %l1
  %l13 = icmp slt i32 %l12, %l11
  br i1 %l13, label %b8, label %b9

b8:                                               ; preds = %b7
  %l14 = load i32, i32* %l1
  %l15 = getelementptr [100 x i32], [100 x i32]* %l3, i32 0, i32 %l14
  %l16 = call i32 @getint()
  store i32 %l16, i32* %l15
  %l17 = add i32 %l14, 1
  store i32 %l17, i32* %l1
  br label %b7

b9:                                               ; preds = %b7
  %l18 = getelementptr [100 x i32], [100 x i32]* %l3, i32 0, i32 0
  call void @build_heap(i32* %l18)
  %l20 = load i32, i32* %l2
  store i32 %l20, i32* %l1
  br label %b21

b21:                                              ; preds = %b22, %b9
  %l24 = load i32, i32* %l1
  %l25 = icmp sge i32 %l24, 2
  br i1 %l25, label %b22, label %b23

b22:                                              ; preds = %b21
  %l26 = getelementptr [100 x i32], [100 x i32]* %l3, i32 0, i32 0
  %l27 = load i32, i32* %l1
  call void @swap(i32* %l26, i32 1, i32 %l27)
  %l30 = load i32, i32* %l26
  %l31 = sub i32 %l30, 1
  store i32 %l31, i32* %l26
  call void @heapify(i32* %l26, i32 1)
  %l35 = sub i32 %l27, 1
  store i32 %l35, i32* %l1
  br label %b21

b23:                                              ; preds = %b21
  %l36 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l36)
  store i32 1, i32* %l1
  br label %b37

b37:                                              ; preds = %b38, %b23
  %l40 = load i32, i32* %l2
  %l41 = add i32 %l40, 1
  %l42 = load i32, i32* %l1
  %l43 = icmp slt i32 %l42, %l41
  br i1 %l43, label %b38, label %b39

b38:                                              ; preds = %b37
  %l44 = load i32, i32* %l1
  %l45 = getelementptr [100 x i32], [100 x i32]* %l3, i32 0, i32 %l44
  %l46 = load i32, i32* %l45
  call void @putint(i32 %l46)
  %l47 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l47)
  %l48 = add i32 %l44, 1
  store i32 %l48, i32* %l1
  br label %b37

b39:                                              ; preds = %b37
  ret void
}

define i32 @main() {
b0:
  call void @heap_sort()
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
