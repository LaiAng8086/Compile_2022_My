; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@u = global i32 0
@v = global i32 6
@s = global i32 9
@dim_2 = global [3 x [3 x i32]] zeroinitializer
@array = global [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 2, i32 4]]
@_str_0 = constant [10 x i8] c"20373394\0A\00"
@_str_1 = constant [5 x i8] c"a = \00"
@_str_2 = constant [2 x i8] c"\0A\00"
@_str_3 = constant [5 x i8] c"b = \00"
@_str_4 = constant [2 x i8] c"\0A\00"
@_str_5 = constant [8 x i8] c"first: \00"
@_str_6 = constant [9 x i8] c"first : \00"
@_str_7 = constant [2 x i8] c"\0A\00"
@_str_8 = constant [11 x i8] c" is not 2\0A\00"
@_str_9 = constant [6 x i8] c"xxxx\0A\00"
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define i32 @add_three(i32 %l1, i32* %l3, i32 %l4) {
b0:
  %l2 = alloca i32
  %l5 = alloca i32
  %l6 = getelementptr i32, i32* %l3, i32 0
  %l8 = load i32, i32* %l6
  %l9 = add i32 %l1, %l8
  %l11 = add i32 %l9, %l4
  store i32 %l1, i32* %l2
  store i32 %l4, i32* %l5
  ret i32 %l11
}

define i32 @add1(i32 %l1, i32 %l3) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  %l8 = add i32 %l1, %l3
  %l9 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l9)
  %l10 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l10)
  call void @putint(i32 %l1)
  %l11 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l11)
  %l12 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l12)
  call void @putint(i32 %l3)
  %l13 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l13)
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l8, i32* %l5
  ret i32 %l8
}

define i32 @addmmm(i32 %l1, i32 %l3, i32 %l5) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  %l9 = add i32 %l1, %l3
  %l11 = add i32 %l9, %l5
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  ret i32 %l11
}

define i32 @add() {
b0:
  ret i32 99
}

define void @printarrrr([2 x i32]* %l1) {
b0:
  %l2 = getelementptr [2 x i32], [2 x i32]* %l1, i32 0, i32 0
  %l3 = getelementptr inbounds [8 x i8], [8 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l3)
  %l4 = load i32, i32* %l2
  call void @putint(i32 %l4)
  ret void
}

define void @printarr(i32* %l1, i32* %l2) {
b0:
  %l3 = getelementptr i32, i32* %l1, i32 0
  %l4 = getelementptr inbounds [9 x i8], [9 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l4)
  %l5 = load i32, i32* %l3
  call void @putint(i32 %l5)
  ret void
}

define i32 @main() {
b0:
  %l1 = alloca [7 x i32]
  %l9 = alloca [2 x i32]
  %l12 = alloca [1 x i32]
  %l14 = alloca [2 x [2 x i32]]
  %l45 = alloca i32
  %l46 = alloca i32
  %l66 = alloca i32
  %l67 = alloca i32
  %l2 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 0
  store i32 1, i32* %l2
  %l3 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 1
  store i32 2, i32* %l3
  %l4 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 2
  store i32 3, i32* %l4
  %l5 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 3
  store i32 4, i32* %l5
  %l6 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 4
  store i32 5, i32* %l6
  %l7 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 5
  store i32 7, i32* %l7
  %l8 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 6
  store i32 8, i32* %l8
  %l10 = getelementptr [2 x i32], [2 x i32]* %l9, i32 0, i32 0
  store i32 2, i32* %l10
  %l11 = getelementptr [2 x i32], [2 x i32]* %l9, i32 0, i32 1
  store i32 6, i32* %l11
  %l13 = getelementptr [1 x i32], [1 x i32]* %l12, i32 0, i32 0
  store i32 1, i32* %l13
  %l17 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l14, i32 0, i32 0, i32 0
  store i32 1, i32* %l17
  %l18 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l14, i32 0, i32 0, i32 1
  store i32 2, i32* %l18
  %l19 = load i32, i32* %l2
  %l20 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l14, i32 0, i32 1, i32 0
  store i32 %l19, i32* %l20
  %l21 = load i32, i32* %l3
  %l22 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %l14, i32 0, i32 1, i32 1
  store i32 %l21, i32* %l22
  br label %b25

b26:                                              ; No predecessors!
  br label %b23

b23:                                              ; preds = %b26
  %l27 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 1
  store i32 3, i32* %l27
  br label %b24

b25:                                              ; preds = %b0
  br label %b28

b30:                                              ; No predecessors!
  br label %b29

b28:                                              ; preds = %b25
  %l33 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 0
  %l34 = load i32, i32* %l33
  %l35 = add i32 %l34, 99
  %l36 = icmp slt i32 %l35, 99
  br i1 %l36, label %b31, label %b32

b31:                                              ; preds = %b28
  %l37 = call i32 @add()
  %l38 = sdiv i32 99, %l37
  %l39 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 1
  store i32 %l38, i32* %l39
  br label %b32

b32:                                              ; preds = %b31, %b28
  br label %b29

b29:                                              ; preds = %b32, %b30
  br label %b24

b24:                                              ; preds = %b29, %b23
  %l40 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 1
  %l41 = load i32, i32* %l40
  %l42 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 2
  %l43 = load i32, i32* %l42
  %l44 = call i32 @add1(i32 %l41, i32 %l43)
  %l47 = call i32 @getint()
  %l49 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @array, i32 0, i32 0, i32 1
  %l50 = load i32, i32* %l49
  %l51 = call i32 @add1(i32 %l47, i32 %l50)
  %l52 = sub i32 0, %l47
  %l54 = load i32, i32* %l49
  %l55 = call i32 @add1(i32 %l52, i32 %l54)
  %l56 = call i32 @add1(i32 %l47, i32 1)
  %l57 = call i32 @addmmm(i32 1, i32 2, i32 3)
  %l58 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 3
  %l59 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 5
  %l60 = call i32 @add()
  %l61 = load i32, i32* %l59
  %l62 = mul i32 %l61, %l60
  %l63 = load i32, i32* %l58
  %l64 = sub i32 %l63, %l62
  store i32 %l64, i32* %l58
  %l68 = load i32, i32* %l66
  %l69 = sub i32 0, %l68
  %l70 = call i32 @add()
  %l71 = call i32 @add1(i32 1, i32 3)
  %l72 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 0
  %l74 = load i32, i32* %l72
  store i32 0, i32* %l66
  store i32 %l47, i32* %l45
  store i32 %l69, i32* %l67
  br label %b76

b76:                                              ; preds = %b24
  br label %b77

b77:                                              ; preds = %b76
  br label %b80

b80:                                              ; preds = %b112, %b113, %b77
  br label %b81

b81:                                              ; preds = %b80
  %l87 = load i32, i32* %l66
  %l88 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 %l87
  %l89 = load i32, i32* %l88
  %l90 = icmp eq i32 %l89, 2
  br i1 %l90, label %b86, label %b85

b86:                                              ; preds = %b81
  %l91 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 0
  %l92 = load i32, i32* %l91
  %l93 = icmp sgt i32 %l92, 0
  br i1 %l93, label %b83, label %b85

b83:                                              ; preds = %b86
  %l94 = load i32, i32* %l66
  %l95 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 %l94
  %l96 = load i32, i32* %l95
  call void @putint(i32 %l96)
  %l97 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l97)
  br label %b84

b85:                                              ; preds = %b86, %b81
  br label %b84

b84:                                              ; preds = %b85, %b83
  %l100 = load i32, i32* %l66
  %l101 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 %l100
  %l102 = load i32, i32* %l101
  %l103 = icmp ne i32 %l102, 2
  br i1 %l103, label %b98, label %b99

b98:                                              ; preds = %b84
  %l104 = load i32, i32* %l66
  %l105 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 %l104
  %l106 = load i32, i32* %l105
  call void @putint(i32 %l106)
  %l107 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l107)
  br label %b99

b99:                                              ; preds = %b98, %b84
  %l108 = getelementptr inbounds [6 x i8], [6 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l108)
  %l109 = load i32, i32* %l66
  %l110 = add i32 %l109, 1
  %l116 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 %l110
  %l117 = load i32, i32* %l116
  %l118 = sub i32 0, %l117
  %l119 = icmp sge i32 %l118, 0
  store i32 %l110, i32* %l66
  br i1 %l119, label %b111, label %b114

b114:                                             ; preds = %b99
  %l121 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 0
  %l122 = load i32, i32* %l121
  %l123 = icmp sle i32 %l122, 0
  br i1 %l123, label %b120, label %b113

b120:                                             ; preds = %b114
  br label %b111

b111:                                             ; preds = %b120, %b99
  %l124 = load i32, i32* %l66
  %l125 = getelementptr [7 x i32], [7 x i32]* %l1, i32 0, i32 %l124
  %l126 = load i32, i32* %l125
  %l127 = mul i32 %l126, 3
  store i32 %l127, i32* %l125
  br label %b82

b113:                                             ; preds = %b114
  br label %b80

b112:                                             ; No predecessors!
  br label %b80

b82:                                              ; preds = %b111
  %l129 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @array, i32 0, i32 0, i32 0
  %l130 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @array, i32 0, i32 1, i32 0
  call void @printarr(i32* %l129, i32* %l130)
  %l132 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* @array, i32 0, i32 0
  call void @printarrrr([2 x i32]* %l132)
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
