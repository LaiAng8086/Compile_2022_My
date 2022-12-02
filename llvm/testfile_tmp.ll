; ModuleID = 'testfile.c'
source_filename = "testfile.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@N = dso_local constant i32 10, align 4
@a = dso_local global [10 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9], align 16
@.str = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"\0A%d, %d, %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fib(i32 %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 1, i32* %2, align 4
  br label %19

7:                                                ; preds = %1
  %8 = load i32, i32* %3, align 4
  %9 = icmp eq i32 %8, 2
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 2, i32* %2, align 4
  br label %19

11:                                               ; preds = %7
  %12 = load i32, i32* %3, align 4
  %13 = sub nsw i32 %12, 1
  %14 = call i32 @fib(i32 %13)
  %15 = load i32, i32* %3, align 4
  %16 = sub nsw i32 %15, 2
  %17 = call i32 @fib(i32 %16)
  %18 = add nsw i32 %14, %17
  store i32 %18, i32* %2, align 4
  br label %19

19:                                               ; preds = %11, %10, %6
  %20 = load i32, i32* %2, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 2, i32* %2, align 4
  store i32 5, i32* %3, align 4
  store i32 1, i32* %4, align 4
  store i32 2, i32* %5, align 4
  %7 = call i32 (...) @getint()
  store i32 %7, i32* %2, align 4
  %8 = call i32 (...) @getint()
  store i32 %8, i32* %3, align 4
  %9 = load i32, i32* %2, align 4
  %10 = load i32, i32* %3, align 4
  %11 = mul nsw i32 %9, %10
  %12 = sub nsw i32 0, %11
  %13 = call i32 @fib(i32 4)
  %14 = mul nsw i32 %12, %13
  %15 = add nsw i32 %14, 0
  %16 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 1), align 4
  %17 = mul nsw i32 %16, 1
  %18 = add nsw i32 %15, %17
  %19 = sub nsw i32 %18, 0
  %20 = mul nsw i32 %19, 5
  store i32 %20, i32* %2, align 4
  %21 = call i32 @fib(i32 5)
  %22 = add nsw i32 %21, 2
  %23 = call i32 @fib(i32 %22)
  %24 = sub nsw i32 1197, %23
  %25 = add nsw i32 %24, -10091
  store i32 %25, i32* %3, align 4
  store i32 -6, i32* %6, align 4
  br label %26

26:                                               ; preds = %29, %0
  %27 = load i32, i32* %2, align 4
  %28 = icmp sle i32 %27, 100
  br i1 %28, label %29, label %82

29:                                               ; preds = %26
  %30 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 0), align 16
  %31 = load i32, i32* %6, align 4
  %32 = load i32, i32* %6, align 4
  %33 = mul nsw i32 %31, %32
  %34 = add nsw i32 %30, %33
  store i32 %34, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 0), align 16
  %35 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 1), align 4
  %36 = load i32, i32* %6, align 4
  %37 = load i32, i32* %6, align 4
  %38 = mul nsw i32 %36, %37
  %39 = add nsw i32 %35, %38
  store i32 %39, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 1), align 4
  %40 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 2), align 8
  %41 = load i32, i32* %6, align 4
  %42 = load i32, i32* %6, align 4
  %43 = mul nsw i32 %41, %42
  %44 = add nsw i32 %40, %43
  store i32 %44, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 2), align 8
  %45 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 3), align 4
  %46 = load i32, i32* %6, align 4
  %47 = load i32, i32* %6, align 4
  %48 = mul nsw i32 %46, %47
  %49 = add nsw i32 %45, %48
  store i32 %49, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 3), align 4
  %50 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 4), align 16
  %51 = load i32, i32* %6, align 4
  %52 = load i32, i32* %6, align 4
  %53 = mul nsw i32 %51, %52
  %54 = add nsw i32 %50, %53
  store i32 %54, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 4), align 16
  %55 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 5), align 4
  %56 = load i32, i32* %6, align 4
  %57 = load i32, i32* %6, align 4
  %58 = mul nsw i32 %56, %57
  %59 = add nsw i32 %55, %58
  store i32 %59, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 5), align 4
  %60 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 6), align 8
  %61 = load i32, i32* %6, align 4
  %62 = load i32, i32* %6, align 4
  %63 = mul nsw i32 %61, %62
  %64 = add nsw i32 %60, %63
  store i32 %64, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 6), align 8
  %65 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 7), align 4
  %66 = load i32, i32* %6, align 4
  %67 = load i32, i32* %6, align 4
  %68 = mul nsw i32 %66, %67
  %69 = add nsw i32 %65, %68
  store i32 %69, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 7), align 4
  %70 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 8), align 16
  %71 = load i32, i32* %6, align 4
  %72 = load i32, i32* %6, align 4
  %73 = mul nsw i32 %71, %72
  %74 = add nsw i32 %70, %73
  store i32 %74, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 8), align 16
  %75 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 9), align 4
  %76 = load i32, i32* %6, align 4
  %77 = load i32, i32* %6, align 4
  %78 = mul nsw i32 %76, %77
  %79 = add nsw i32 %75, %78
  store i32 %79, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i64 0, i64 9), align 4
  %80 = load i32, i32* %2, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %2, align 4
  br label %26

82:                                               ; preds = %26
  store i32 0, i32* %2, align 4
  br label %83

83:                                               ; preds = %86, %82
  %84 = load i32, i32* %2, align 4
  %85 = icmp slt i32 %84, 10
  br i1 %85, label %86, label %94

86:                                               ; preds = %83
  %87 = load i32, i32* %2, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [10 x i32], [10 x i32]* @a, i64 0, i64 %88
  %90 = load i32, i32* %89, align 4
  %91 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %90)
  %92 = load i32, i32* %2, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %2, align 4
  br label %83

94:                                               ; preds = %83
  %95 = load i32, i32* %2, align 4
  %96 = load i32, i32* %3, align 4
  %97 = load i32, i32* %6, align 4
  %98 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 %95, i32 %96, i32 %97)
  ret i32 0
}

declare dso_local i32 @getint(...) #1

declare dso_local i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
