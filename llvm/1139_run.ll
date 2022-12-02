; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@_str_0 = constant [10 x i8] c"20373318\0A\00"
@_str_1 = constant [3 x i8] c"a[\00"
@_str_2 = constant [5 x i8] c"] = \00"
@_str_3 = constant [3 x i8] c", \00"
@_str_4 = constant [2 x i8] c"\0A\00"
@_str_5 = constant [3 x i8] c"c[\00"
@_str_6 = constant [3 x i8] c"][\00"
@_str_7 = constant [5 x i8] c"] = \00"
@_str_8 = constant [3 x i8] c", \00"
@_str_9 = constant [2 x i8] c"\0A\00"
@_str_10 = constant [8 x i8] c"sum1 = \00"
@_str_11 = constant [10 x i8] c", sum2 = \00"
@_str_12 = constant [2 x i8] c"\0A\00"
@_str_13 = constant [10 x i8] c"asd[4] = \00"
@_str_14 = constant [2 x i8] c"\0A\00"
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define void @read([3 x i32]* %l1, i32 %l2) {
b0:
  %l3 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  store i32 %l2, i32* %l3
  store i32 0, i32* %l4
  store i32 0, i32* %l5
  br label %b6

b6:                                               ; preds = %b14, %b0
  %l9 = load i32, i32* %l4
  %l10 = load i32, i32* %l3
  %l11 = icmp slt i32 %l9, %l10
  br i1 %l11, label %b7, label %b8

b7:                                               ; preds = %b6
  store i32 0, i32* %l5
  br label %b12

b12:                                              ; preds = %b13, %b7
  %l15 = load i32, i32* %l5
  %l16 = icmp slt i32 %l15, 3
  br i1 %l16, label %b13, label %b14

b13:                                              ; preds = %b12
  %l17 = load i32, i32* %l4
  %l18 = load i32, i32* %l5
  %l19 = getelementptr [3 x i32], [3 x i32]* %l1, i32 %l17, i32 %l18
  %l20 = call i32 @getint()
  %l21 = add i32 %l18, 1
  store i32 %l20, i32* %l19
  store i32 %l21, i32* %l5
  br label %b12

b14:                                              ; preds = %b12
  %l22 = load i32, i32* %l4
  %l23 = add i32 %l22, 1
  store i32 %l23, i32* %l4
  br label %b6

b8:                                               ; preds = %b6
  ret void
}

define i32 @main() {
b0:
  %l1 = alloca [5 x i32]
  %l7 = alloca [2 x [3 x i32]]
  %l19 = alloca i32
  %l33 = alloca i32
  %l36 = alloca i32
  %l59 = alloca [3 x [3 x i32]]
  %l62 = alloca i32
  %l63 = alloca i32
  %l74 = alloca i32
  %l92 = alloca [6 x i32]
  %l2 = getelementptr [5 x i32], [5 x i32]* %l1, i32 0, i32 0
  %l3 = getelementptr [5 x i32], [5 x i32]* %l1, i32 0, i32 1
  %l4 = getelementptr [5 x i32], [5 x i32]* %l1, i32 0, i32 2
  %l5 = getelementptr [5 x i32], [5 x i32]* %l1, i32 0, i32 3
  %l6 = getelementptr [5 x i32], [5 x i32]* %l1, i32 0, i32 4
  %l8 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %l7, i32 0, i32 0, i32 0
  %l9 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %l7, i32 0, i32 0, i32 1
  %l10 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %l7, i32 0, i32 0, i32 2
  %l11 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %l7, i32 0, i32 1, i32 0
  %l12 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %l7, i32 0, i32 1, i32 1
  %l13 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %l7, i32 0, i32 1, i32 2
  %l18 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l18)
  store i32 1, i32* %l8
  store i32 2, i32* %l9
  store i32 3, i32* %l10
  store i32 4, i32* %l11
  store i32 8, i32* %l12
  store i32 1, i32* %l2
  store i32 5, i32* %l13
  store i32 2, i32* %l3
  store i32 3, i32* %l4
  store i32 0, i32* %l19
  store i32 4, i32* %l5
  store i32 5, i32* %l6
  br label %b20

b20:                                              ; preds = %b21, %b0
  %l23 = load i32, i32* %l19
  %l24 = icmp slt i32 %l23, 5
  br i1 %l24, label %b21, label %b22

b21:                                              ; preds = %b20
  %l25 = load i32, i32* %l19
  %l26 = getelementptr [5 x i32], [5 x i32]* %l1, i32 0, i32 %l25
  %l27 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l27)
  call void @putint(i32 %l25)
  %l28 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l28)
  %l29 = load i32, i32* %l26
  call void @putint(i32 %l29)
  %l30 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l30)
  %l31 = add i32 %l25, 1
  store i32 %l31, i32* %l19
  br label %b20

b22:                                              ; preds = %b20
  %l32 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l32)
  store i32 123456789, i32* %l33
  store i32 0, i32* %l36
  store i32 0, i32* %l19
  br label %b37

b37:                                              ; preds = %b44, %b22
  %l40 = load i32, i32* %l19
  %l41 = icmp slt i32 %l40, 2
  br i1 %l41, label %b38, label %b39

b38:                                              ; preds = %b37
  store i32 0, i32* %l33
  br label %b42

b42:                                              ; preds = %b43, %b38
  %l45 = load i32, i32* %l33
  %l46 = icmp slt i32 %l45, 3
  br i1 %l46, label %b43, label %b44

b43:                                              ; preds = %b42
  %l47 = load i32, i32* %l19
  %l48 = load i32, i32* %l33
  %l49 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %l7, i32 0, i32 %l47, i32 %l48
  %l50 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l50)
  call void @putint(i32 %l47)
  %l51 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l51)
  call void @putint(i32 %l48)
  %l52 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l52)
  %l53 = load i32, i32* %l49
  call void @putint(i32 %l53)
  %l54 = getelementptr inbounds [3 x i8], [3 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l54)
  %l55 = add i32 %l48, 1
  store i32 %l55, i32* %l33
  br label %b42

b44:                                              ; preds = %b42
  %l56 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l56)
  %l57 = load i32, i32* %l19
  %l58 = add i32 %l57, 1
  store i32 %l58, i32* %l19
  br label %b37

b39:                                              ; preds = %b37
  %l60 = getelementptr [3 x [3 x i32]], [3 x [3 x i32]]* %l59, i32 0, i32 0
  call void @read([3 x i32]* %l60, i32 3)
  store i32 0, i32* %l62
  store i32 0, i32* %l63
  store i32 0, i32* %l19
  br label %b64

b64:                                              ; preds = %b71, %b39
  %l67 = load i32, i32* %l19
  %l68 = icmp slt i32 %l67, 3
  br i1 %l68, label %b65, label %b66

b65:                                              ; preds = %b64
  store i32 0, i32* %l33
  br label %b69

b69:                                              ; preds = %b70, %b65
  %l72 = load i32, i32* %l33
  %l73 = icmp slt i32 %l72, 3
  br i1 %l73, label %b70, label %b71

b70:                                              ; preds = %b69
  %l75 = load i32, i32* %l33
  %l76 = load i32, i32* %l19
  %l77 = add i32 %l75, %l76
  %l78 = sub i32 %l77, %l75
  %l79 = getelementptr [3 x [3 x i32]], [3 x [3 x i32]]* %l59, i32 0, i32 %l78, i32 %l75
  %l80 = load i32, i32* %l62
  %l81 = load i32, i32* %l79
  %l82 = add i32 %l80, %l81
  %l84 = add i32 %l75, 1
  store i32 %l82, i32* %l62
  store i32 %l84, i32* %l33
  store i32 %l82, i32* %l74
  br label %b69

b71:                                              ; preds = %b69
  %l85 = load i32, i32* %l19
  %l86 = add i32 %l85, 1
  store i32 %l86, i32* %l19
  br label %b64

b66:                                              ; preds = %b64
  %l87 = getelementptr inbounds [8 x i8], [8 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l87)
  %l88 = load i32, i32* %l62
  call void @putint(i32 %l88)
  %l89 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_11, i32 0, i32 0
  call void @putstr(i8* %l89)
  %l90 = load i32, i32* %l63
  call void @putint(i32 %l90)
  %l91 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_12, i32 0, i32 0
  call void @putstr(i8* %l91)
  %l93 = getelementptr [3 x [3 x i32]], [3 x [3 x i32]]* %l59, i32 0, i32 2, i32 1
  %l94 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %l7, i32 0, i32 0, i32 0
  %l95 = load i32, i32* %l93
  %l96 = load i32, i32* %l94
  %l97 = add i32 %l95, %l96
  %l98 = getelementptr [6 x i32], [6 x i32]* %l92, i32 0, i32 4
  %l100 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_13, i32 0, i32 0
  call void @putstr(i8* %l100)
  call void @putint(i32 %l97)
  %l102 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_14, i32 0, i32 0
  call void @putstr(i8* %l102)
  store i32 %l97, i32* %l98
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
