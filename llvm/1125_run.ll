; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@Mod = constant i32 389
@N = constant i32 100005
@a_to_the_a = global i32 0
@cnt = global i32 0
@n = global i32 0
@_str_0 = constant [26 x i8] c"funcTest: move disk from \00"
@_str_1 = constant [5 x i8] c" to \00"
@_str_2 = constant [2 x i8] c"\0A\00"
@_str_3 = constant [17 x i8] c"blockTest: 7 == \00"
@_str_4 = constant [8 x i8] c", 8 == \00"
@_str_5 = constant [2 x i8] c"\0A\00"
@_str_6 = constant [17 x i8] c"blockTest: 5 == \00"
@_str_7 = constant [9 x i8] c", 12 == \00"
@_str_8 = constant [2 x i8] c"\0A\00"
@_str_9 = constant [10 x i8] c"Exptest: \00"
@_str_10 = constant [2 x i8] c" \00"
@_str_11 = constant [2 x i8] c" \00"
@_str_12 = constant [2 x i8] c" \00"
@_str_13 = constant [2 x i8] c" \00"
@_str_14 = constant [2 x i8] c" \00"
@_str_15 = constant [2 x i8] c" \00"
@_str_16 = constant [2 x i8] c" \00"
@_str_17 = constant [2 x i8] c"\0A\00"
@_str_18 = constant [21 x i8] c"20373569 the mafia~\0A\00"
@_str_19 = constant [10 x i8] c"Exptest: \00"
@_str_20 = constant [2 x i8] c"\0A\00"
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define void @move(i32 %l1, i32 %l3) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l5 = load i32, i32* @cnt
  %l6 = add i32 %l5, 1
  %l10 = srem i32 %l6, 389
  %l11 = icmp eq i32 %l10, 0
  store i32 %l6, i32* @cnt
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  br i1 %l11, label %b7, label %b8

b7:                                               ; preds = %b0
  %l12 = getelementptr inbounds [26 x i8], [26 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l12)
  %l13 = load i32, i32* %l2
  call void @putint(i32 %l13)
  %l14 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l14)
  %l15 = load i32, i32* %l4
  call void @putint(i32 %l15)
  %l16 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l16)
  br label %b8

b8:                                               ; preds = %b7, %b0
  ret void
}

define void @hanoi(i32 %l1, i32 %l3, i32 %l5, i32 %l7) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  %l8 = alloca i32
  %l12 = icmp eq i32 %l1, 1
  store i32 %l7, i32* %l8
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  br i1 %l12, label %b9, label %b10

b9:                                               ; preds = %b0
  %l13 = load i32, i32* %l4
  %l14 = load i32, i32* %l8
  call void @move(i32 %l13, i32 %l14)
  ret void

b10:                                              ; preds = %b0
  %l16 = load i32, i32* %l2
  %l17 = sub i32 %l16, 1
  %l18 = load i32, i32* %l4
  %l19 = load i32, i32* %l8
  %l20 = load i32, i32* %l6
  call void @hanoi(i32 %l17, i32 %l18, i32 %l19, i32 %l20)
  call void @move(i32 %l18, i32 %l19)
  call void @hanoi(i32 %l17, i32 %l20, i32 %l18, i32 %l19)
  ret void
}

define i32 @qpow(i32 %l1, i32 %l3) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 1, i32* %l5
  br label %b6

b6:                                               ; preds = %b17, %b0
  %l9 = load i32, i32* %l4
  %l10 = icmp ne i32 %l9, 0
  br i1 %l10, label %b7, label %b8

b7:                                               ; preds = %b6
  %l11 = load i32, i32* %l4
  %l12 = sdiv i32 %l11, 2
  %l13 = load i32, i32* %l2
  %l14 = mul i32 %l13, %l13
  %l15 = srem i32 %l14, 389
  %l19 = srem i32 %l12, 2
  %l20 = icmp ne i32 %l19, 0
  store i32 %l15, i32* %l2
  store i32 %l12, i32* %l4
  br i1 %l20, label %b16, label %b17

b16:                                              ; preds = %b7
  %l21 = load i32, i32* %l5
  %l22 = load i32, i32* %l2
  %l23 = mul i32 %l21, %l22
  %l24 = srem i32 %l23, 389
  store i32 %l24, i32* %l5
  br label %b17

b17:                                              ; preds = %b16, %b7
  br label %b6

b8:                                               ; preds = %b6
  %l25 = load i32, i32* %l5
  ret i32 %l25
}

define i32 @gcd(i32 %l1, i32 %l3) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l8 = icmp ne i32 %l3, 0
  %l9 = xor i1 %l8, true
  %l10 = zext i1 %l9 to i32
  %l11 = icmp ne i32 %l10, 0
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  br i1 %l11, label %b5, label %b6

b5:                                               ; preds = %b0
  %l12 = load i32, i32* %l2
  ret i32 %l12

b6:                                               ; preds = %b0
  %l13 = load i32, i32* %l4
  %l14 = load i32, i32* %l2
  %l15 = srem i32 %l14, %l13
  %l16 = call i32 @gcd(i32 %l13, i32 %l15)
  ret i32 %l16
}

define i32 @testExp() {
b0:
  %l4 = alloca i32
  %l16 = alloca i32
  %l19 = alloca i32
  %l20 = alloca i32
  %l23 = alloca i32
  %l33 = alloca i32
  %l41 = alloca i32
  %l74 = alloca i32
  %l76 = alloca i32
  %l1 = load i32, i32* @n
  %l3 = mul i32 %l1, %l1
  %l6 = sdiv i32 100005, %l1
  %l9 = mul i32 %l1, %l1
  %l11 = sdiv i32 %l9, %l1
  %l13 = add i32 %l11, %l1
  %l18 = add i32 %l3, 1
  %l25 = sub i32 0, %l3
  %l26 = sub i32 1, %l25
  %l28 = mul i32 %l26, %l18
  %l29 = sdiv i32 %l28, 3
  %l30 = sub i32 %l29, 2
  %l31 = add i32 %l30, 100005
  %l32 = srem i32 %l31, 389
  %l35 = call i32 @qpow(i32 %l3, i32 %l18)
  %l36 = getelementptr inbounds [17 x i8], [17 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l36)
  call void @putint(i32 7)
  %l38 = getelementptr inbounds [8 x i8], [8 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l38)
  call void @putint(i32 8)
  %l40 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l40)
  store i32 %l35, i32* %l33
  store i32 0, i32* %l41
  store i32 -2147483648, i32* %l20
  store i32 %l32, i32* %l23
  store i32 %l3, i32* @a_to_the_a
  store i32 %l6, i32* %l4
  store i32 8, i32* %l19
  store i32 7, i32* %l16
  br label %b42

b42:                                              ; preds = %b53, %b47, %b0
  br i1 true, label %b43, label %b44

b43:                                              ; preds = %b42
  %l45 = load i32, i32* %l41
  %l46 = add i32 %l45, 1
  %l50 = srem i32 %l46, 2
  %l51 = icmp ne i32 %l50, 0
  store i32 %l46, i32* %l41
  br i1 %l51, label %b47, label %b48

b47:                                              ; preds = %b43
  br label %b42

b48:                                              ; preds = %b43
  %l55 = load i32, i32* %l41
  %l56 = load i32, i32* %l16
  %l57 = icmp sge i32 %l55, %l56
  br i1 %l57, label %b52, label %b54

b52:                                              ; preds = %b48
  br label %b44

b54:                                              ; preds = %b48
  %l61 = load i32, i32* %l19
  %l62 = icmp slt i32 %l61, 10
  br i1 %l62, label %b58, label %b60

b58:                                              ; preds = %b54
  %l63 = load i32, i32* %l19
  %l64 = load i32, i32* %l41
  %l65 = add i32 %l63, %l64
  store i32 %l65, i32* %l19
  br label %b59

b60:                                              ; preds = %b54
  %l66 = load i32, i32* %l19
  %l67 = load i32, i32* %l41
  %l68 = sub i32 %l66, %l67
  store i32 %l68, i32* %l19
  br label %b59

b59:                                              ; preds = %b60, %b58
  br label %b53

b53:                                              ; preds = %b59
  br label %b42

b44:                                              ; preds = %b52, %b42
  %l69 = getelementptr inbounds [17 x i8], [17 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l69)
  %l70 = load i32, i32* %l16
  call void @putint(i32 %l70)
  %l71 = getelementptr inbounds [9 x i8], [9 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l71)
  %l72 = load i32, i32* %l19
  call void @putint(i32 %l72)
  %l73 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l73)
  %l75 = load i32, i32* @n
  %l81 = icmp slt i32 %l75, 0
  store i32 0, i32* %l76
  store i32 %l75, i32* %l74
  br i1 %l81, label %b77, label %b79

b77:                                              ; preds = %b44
  store i32 10, i32* %l76
  br label %b78

b79:                                              ; preds = %b44
  %l85 = load i32, i32* %l74
  %l86 = icmp sgt i32 %l85, 10
  br i1 %l86, label %b82, label %b84

b82:                                              ; preds = %b79
  store i32 20, i32* %l76
  br label %b83

b84:                                              ; preds = %b79
  %l89 = load i32, i32* %l74
  %l90 = load i32, i32* @n
  %l91 = icmp eq i32 %l89, %l90
  br i1 %l91, label %b87, label %b88

b87:                                              ; preds = %b84
  store i32 30, i32* %l76
  br label %b88

b88:                                              ; preds = %b87, %b84
  br label %b83

b83:                                              ; preds = %b88, %b82
  br label %b78

b78:                                              ; preds = %b83, %b77
  %l94 = load i32, i32* %l74
  %l95 = icmp sle i32 %l94, 10
  br i1 %l95, label %b92, label %b93

b92:                                              ; preds = %b78
  %l96 = load i32, i32* %l76
  %l97 = load i32, i32* %l74
  %l98 = add i32 %l96, %l97
  store i32 %l98, i32* %l76
  br label %b93

b93:                                              ; preds = %b92, %b78
  %l99 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l99)
  %l100 = load i32, i32* @a_to_the_a
  call void @putint(i32 %l100)
  %l101 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l101)
  %l102 = load i32, i32* %l16
  call void @putint(i32 %l102)
  %l103 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_11, i32 0, i32 0
  call void @putstr(i8* %l103)
  %l104 = load i32, i32* %l19
  call void @putint(i32 %l104)
  %l105 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_12, i32 0, i32 0
  call void @putstr(i8* %l105)
  %l106 = load i32, i32* %l20
  call void @putint(i32 %l106)
  %l107 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_13, i32 0, i32 0
  call void @putstr(i8* %l107)
  %l108 = load i32, i32* %l33
  call void @putint(i32 %l108)
  %l109 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_14, i32 0, i32 0
  call void @putstr(i8* %l109)
  %l110 = load i32, i32* %l74
  call void @putint(i32 %l110)
  %l111 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_15, i32 0, i32 0
  call void @putstr(i8* %l111)
  %l112 = load i32, i32* %l76
  call void @putint(i32 %l112)
  %l113 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_16, i32 0, i32 0
  call void @putstr(i8* %l113)
  %l114 = load i32, i32* %l23
  call void @putint(i32 %l114)
  %l115 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_17, i32 0, i32 0
  call void @putstr(i8* %l115)
  %l116 = call i32 @gcd(i32 %l110, i32 %l112)
  ret i32 %l116
}

define i32 @main() {
b0:
  %l1 = getelementptr inbounds [21 x i8], [21 x i8]* @_str_18, i32 0, i32 0
  call void @putstr(i8* %l1)
  %l2 = call i32 @getint()
  call void @hanoi(i32 %l2, i32 1, i32 2, i32 3)
  %l5 = call i32 @testExp()
  %l6 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_19, i32 0, i32 0
  call void @putstr(i8* %l6)
  call void @putint(i32 %l5)
  %l7 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_20, i32 0, i32 0
  call void @putstr(i8* %l7)
  store i32 %l2, i32* @n
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
