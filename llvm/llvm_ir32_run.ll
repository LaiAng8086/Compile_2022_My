; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@aaa = constant i32 1
@bbb = constant i32 2
@ccc = constant i32 3
@ggg = constant i32 3
@hhh = constant i32 -1
@iii = constant i32 2
@arr1 = constant [2 x i32] [i32 0, i32 1]
@arr2 = constant [1 x i32] zeroinitializer
@arr3 = constant [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4]]
@_str_0 = constant [10 x i8] c"19231240\0A\00"
@_str_1 = constant [2 x i8] c"\0A\00"
@_str_2 = constant [2 x i8] c"\0A\00"
@_str_3 = constant [2 x i8] c"\0A\00"
@_str_4 = constant [2 x i8] c"\0A\00"
@_str_5 = constant [2 x i8] c"\0A\00"
@_str_6 = constant [2 x i8] c"\0A\00"
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define void @nothing() {
b0:
  ret void
}

define void @nothing1(i32 %l1) {
b0:
  %l2 = alloca i32
  store i32 %l1, i32* %l2
  ret void
}

define void @nothing2(i32 %l1, i32 %l3, i32 %l5) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  ret void
}

define void @nothing3(i32* %l1, [1 x i32]* %l2) {
b0:
  ret void
}

define i32 @zero() {
b0:
  ret i32 0
}

define i32 @main() {
b0:
  %l1 = alloca i32
  %l2 = alloca [3 x i32]
  %l6 = alloca [2 x [2 x i32]]
  %l11 = alloca i32
  %l12 = alloca i32
  %l13 = alloca i32
  %l17 = alloca i32
  %l64 = alloca i32
  %l65 = alloca i32
  %l66 = alloca i32
  %l3 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  store i32 0, i32* %l3
  %l4 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 1
  store i32 1, i32* %l4
  %l5 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 2
  store i32 2, i32* %l5
  %l7 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 0, i32 0
  store i32 1, i32* %l7
  %l8 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 0, i32 1
  store i32 2, i32* %l8
  %l9 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 0
  store i32 3, i32* %l9
  %l10 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  store i32 4, i32* %l10
  store i32 2, i32* %l11
  store i32 3, i32* %l12
  %l14 = load i32, i32* %l11
  %l15 = load i32, i32* %l12
  %l16 = add i32 %l14, %l15
  store i32 %l16, i32* %l13
  store i32 0, i32* %l17
  br label %b18

b18:                                              ; preds = %b22, %b23, %b0
  br i1 false, label %b19, label %b20

b19:                                              ; preds = %b18
  %l24 = load i32, i32* %l17
  %l25 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 %l24
  %l26 = load i32, i32* %l25
  %l27 = icmp eq i32 %l26, 3
  br i1 %l27, label %b21, label %b23

b21:                                              ; preds = %b19
  br label %b20

b23:                                              ; preds = %b19
  br label %b18

b22:                                              ; No predecessors!
  %l28 = load i32, i32* %l17
  %l29 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 %l28
  store i32 1, i32* %l29
  %l30 = load i32, i32* %l17
  %l31 = add i32 %l30, 1
  store i32 %l31, i32* %l17
  br label %b18

b20:                                              ; preds = %b21, %b18
  %l32 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 1
  %l33 = load i32, i32* %l32
  %l34 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  store i32 %l33, i32* %l34
  %l38 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  %l39 = load i32, i32* %l38
  %l40 = icmp eq i32 %l39, 1
  br i1 %l40, label %b35, label %b37

b35:                                              ; preds = %b20
  %l41 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  store i32 1, i32* %l41
  br label %b36

b37:                                              ; preds = %b20
  %l42 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l6, i32 0, i32 1, i32 1
  store i32 0, i32* %l42
  br label %b36

b36:                                              ; preds = %b37, %b35
  %l43 = call i32 @getint()
  store i32 %l43, i32* %l1
  %l44 = load i32, i32* %l12
  %l45 = load i32, i32* %l13
  %l46 = add i32 %l44, %l45
  store i32 %l46, i32* %l11
  %l47 = load i32, i32* %l12
  %l48 = load i32, i32* %l13
  %l49 = mul i32 %l47, %l48
  store i32 %l49, i32* %l11
  %l50 = load i32, i32* %l12
  %l51 = load i32, i32* %l13
  %l52 = sub i32 %l50, %l51
  store i32 %l52, i32* %l11
  %l53 = load i32, i32* %l12
  %l54 = load i32, i32* %l13
  %l55 = add i32 %l53, %l54
  %l56 = load i32, i32* %l13
  %l57 = add i32 %l55, %l56
  store i32 %l57, i32* %l11
  %l58 = load i32, i32* %l12
  %l59 = sdiv i32 %l58, 1
  store i32 %l59, i32* %l11
  store i32 1, i32* %l13
  %l60 = load i32, i32* %l12
  %l61 = sdiv i32 %l60, 1
  store i32 %l61, i32* %l11
  %l62 = load i32, i32* %l12
  %l63 = srem i32 %l62, 1
  store i32 %l63, i32* %l11
  store i32 1, i32* %l64
  store i32 0, i32* %l65
  %l69 = load i32, i32* %l64
  %l70 = load i32, i32* %l65
  %l71 = add i32 %l69, %l70
  %l72 = icmp ne i32 %l71, 0
  br i1 %l72, label %b67, label %b68

b67:                                              ; preds = %b36
  store i32 1, i32* %l64
  br label %b68

b68:                                              ; preds = %b67, %b36
  %l75 = load i32, i32* %l65
  %l76 = icmp ne i32 %l75, 0
  %l77 = xor i1 %l76, true
  %l78 = zext i1 %l77 to i32
  %l79 = icmp ne i32 %l78, 0
  br i1 %l79, label %b73, label %b74

b73:                                              ; preds = %b68
  store i32 1, i32* %l64
  br label %b74

b74:                                              ; preds = %b73, %b68
  %l82 = load i32, i32* %l64
  %l83 = load i32, i32* %l65
  %l84 = sub i32 %l82, %l83
  %l85 = icmp ne i32 %l84, 0
  br i1 %l85, label %b80, label %b81

b80:                                              ; preds = %b74
  store i32 1, i32* %l64
  br label %b81

b81:                                              ; preds = %b80, %b74
  %l88 = load i32, i32* %l64
  %l89 = load i32, i32* %l65
  %l90 = icmp slt i32 %l88, %l89
  br i1 %l90, label %b86, label %b87

b86:                                              ; preds = %b81
  store i32 1, i32* %l64
  br label %b87

b87:                                              ; preds = %b86, %b81
  %l93 = load i32, i32* %l64
  %l94 = load i32, i32* %l65
  %l95 = icmp sle i32 %l93, %l94
  br i1 %l95, label %b91, label %b92

b91:                                              ; preds = %b87
  store i32 1, i32* %l64
  br label %b92

b92:                                              ; preds = %b91, %b87
  %l98 = load i32, i32* %l64
  %l99 = load i32, i32* %l65
  %l100 = icmp sge i32 %l98, %l99
  br i1 %l100, label %b96, label %b97

b96:                                              ; preds = %b92
  store i32 1, i32* %l64
  br label %b97

b97:                                              ; preds = %b96, %b92
  %l103 = load i32, i32* %l64
  %l104 = load i32, i32* %l65
  %l105 = icmp ne i32 %l103, %l104
  br i1 %l105, label %b101, label %b102

b101:                                             ; preds = %b97
  store i32 1, i32* %l64
  br label %b102

b102:                                             ; preds = %b101, %b97
  %l106 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l106)
  %l107 = load i32, i32* %l1
  call void @putint(i32 %l107)
  %l108 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l108)
  %l109 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  %l110 = load i32, i32* %l109
  call void @putint(i32 %l110)
  %l111 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l111)
  %l112 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  %l113 = load i32, i32* %l112
  call void @putint(i32 %l113)
  %l114 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l114)
  %l115 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  %l116 = load i32, i32* %l115
  call void @putint(i32 %l116)
  %l117 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l117)
  %l118 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  %l119 = load i32, i32* %l118
  call void @putint(i32 %l119)
  %l120 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l120)
  %l121 = getelementptr [3 x i32], [3 x i32]* %l2, i32 0, i32 0
  %l122 = load i32, i32* %l121
  call void @putint(i32 %l122)
  %l123 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l123)
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
