; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@t = dso_local constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@happy = dso_local constant [4 x [5 x i32]] [[5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], [5 x i32] [i32 6, i32 7, i32 8, i32 9, i32 10], [5 x i32] [i32 11, i32 12, i32 13, i32 14, i32 15], [5 x i32] [i32 16, i32 17, i32 18, i32 19, i32 20]], align 16
@x = common dso_local global [10 x i32] zeroinitializer, align 16
@y = common dso_local global [15 x [3 x i32]] zeroinitializer, align 16
@__const.main.tt = private unnamed_addr constant [7 x i32] [i32 1, i32 3, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@__const.main.h1 = private unnamed_addr constant [4 x [5 x i32]] [[5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], [5 x i32] zeroinitializer, [5 x i32] zeroinitializer, [5 x i32] [i32 6, i32 7, i32 8, i32 9, i32 10]], align 16
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32 %0, i32* %1, [3 x i32]* %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %6 = alloca [3 x i32]*, align 8
  %7 = alloca [2 x [2 x [3 x i32]]], align 16
  store i32 %0, i32* %4, align 4
  store i32* %1, i32** %5, align 8
  store [3 x i32]* %2, [3 x i32]** %6, align 8
  %8 = load i32*, i32** %5, align 8
  %9 = getelementptr inbounds i32, i32* %8, i64 6
  store i32 112, i32* %9, align 4
  %10 = load [3 x i32]*, [3 x i32]** %6, align 8
  %11 = getelementptr inbounds [3 x i32], [3 x i32]* %10, i64 1
  %12 = getelementptr inbounds [3 x i32], [3 x i32]* %11, i64 0, i64 1
  store i32 1114, i32* %12, align 4
  %13 = load i32*, i32** %5, align 8
  %14 = getelementptr inbounds i32, i32* %13, i64 0
  %15 = load i32, i32* %14, align 4
  %16 = load i32*, i32** %5, align 8
  %17 = getelementptr inbounds i32, i32* %16, i64 1
  %18 = load i32, i32* %17, align 4
  %19 = mul nsw i32 %15, %18
  store i32 %19, i32* %4, align 4
  %20 = load [3 x i32]*, [3 x i32]** %6, align 8
  %21 = getelementptr inbounds [3 x i32], [3 x i32]* %20, i64 0
  %22 = getelementptr inbounds [3 x i32], [3 x i32]* %21, i64 0, i64 2
  %23 = load i32, i32* %22, align 4
  %24 = load i32*, i32** %5, align 8
  %25 = getelementptr inbounds i32, i32* %24, i64 3
  %26 = load i32, i32* %25, align 4
  %27 = mul nsw i32 %23, %26
  %28 = load i32*, i32** %5, align 8
  %29 = getelementptr inbounds i32, i32* %28, i64 2
  store i32 %27, i32* %29, align 4
  %30 = getelementptr inbounds [2 x [2 x [3 x i32]]], [2 x [2 x [3 x i32]]]* %7, i64 0, i64 1
  %31 = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %30, i64 0, i64 0
  %32 = getelementptr inbounds [3 x i32], [3 x i32]* %31, i64 0, i64 2
  store i32 10, i32* %32, align 8
  %33 = load i32, i32* %4, align 4
  %34 = load i32*, i32** %5, align 8
  %35 = getelementptr inbounds i32, i32* %34, i64 2
  %36 = load i32, i32* %35, align 4
  %37 = add nsw i32 %33, %36
  ret i32 %37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [7 x i32], align 16
  %2 = alloca [4 x [5 x i32]], align 16
  %3 = alloca i32, align 4
  %4 = bitcast [7 x i32]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([7 x i32]* @__const.main.tt to i8*), i64 28, i1 false)
  %5 = bitcast [4 x [5 x i32]]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 16 bitcast ([4 x [5 x i32]]* @__const.main.h1 to i8*), i64 80, i1 false)
  store i32 2, i32* %3, align 4
  store i32 101, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @x, i64 0, i64 0), align 16
  store i32 102, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @x, i64 0, i64 1), align 4
  store i32 676, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @x, i64 0, i64 3), align 4
  store i32 1011, i32* getelementptr inbounds ([15 x [3 x i32]], [15 x [3 x i32]]* @y, i64 0, i64 0, i64 2), align 8
  store i32 998, i32* getelementptr inbounds ([15 x [3 x i32]], [15 x [3 x i32]]* @y, i64 0, i64 0, i64 1), align 4
  %6 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @x, i64 0, i64 3), align 4
  %7 = sext i32 %6 to i64
  %8 = inttoptr i64 %7 to i32*
  %9 = call i32 @foo(i32 100, i32* %8, [3 x i32]* getelementptr inbounds ([15 x [3 x i32]], [15 x [3 x i32]]* @y, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getint() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %1)
  %3 = load i32, i32* %1, align 4
  ret i32 %3
}

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

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

declare dso_local i32 @printf(i8*, ...) #2

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

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 10.0.0-4ubuntu1 "}
!1 = !{i32 1, !"wchar_size", i32 4}
