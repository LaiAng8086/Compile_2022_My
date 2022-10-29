; ModuleID = 'test19.c'
source_filename = "test19.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ZERO = dso_local constant i32 0, align 4
@ONE = dso_local constant i32 1, align 4
@TWO = dso_local constant i32 2, align 4
@THREE = dso_local constant i32 3, align 4
@one = dso_local global i32 1, align 4
@two = dso_local global i32 2, align 4
@three = dso_local global i32 3, align 4
@.str = private unnamed_addr constant [10 x i8] c"20373358\0A\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"Some global constants: %d %d %d %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"Some local constants: %d %d %d %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"Some global variables: %d %d %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"Some local variables: %d %d %d\0A\00", align 1
@gvar = common dso_local global i32 0, align 4
@.str.5 = private unnamed_addr constant [27 x i8] c"Set global variable as %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"Set local variable as %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"Calculate %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 1, i32* %2, align 4
  store i32 2, i32* %3, align 4
  store i32 3, i32* %4, align 4
  store i32 4, i32* %5, align 4
  store i32 1, i32* %6, align 4
  store i32 2, i32* %7, align 4
  store i32 8, i32* %8, align 4
  store i32 5, i32* %9, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0))
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0), i32 0, i32 1, i32 2, i32 3)
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i64 0, i64 0), i32 1, i32 2, i32 3, i32 4)
  %14 = load i32, i32* %6, align 4
  %15 = load i32, i32* @two, align 4
  %16 = load i32, i32* @three, align 4
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 %14, i32 %15, i32 %16)
  %18 = load i32, i32* %7, align 4
  %19 = load i32, i32* %8, align 4
  %20 = load i32, i32* %9, align 4
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0), i32 %18, i32 %19, i32 %20)
  %22 = call i32 (...) @getint()
  store i32 %22, i32* @gvar, align 4
  %23 = call i32 (...) @getint()
  store i32 %23, i32* %10, align 4
  %24 = load i32, i32* @gvar, align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.5, i64 0, i64 0), i32 %24)
  %26 = load i32, i32* %10, align 4
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.6, i64 0, i64 0), i32 %26)
  %28 = load i32, i32* %10, align 4
  %29 = add nsw i32 %28, 1
  %30 = mul nsw i32 %29, -1
  store i32 %30, i32* %10, align 4
  %31 = load i32, i32* %10, align 4
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), i32 %31)
  %33 = load i32, i32* %10, align 4
  %34 = add nsw i32 %33, 56
  %35 = load i32, i32* @gvar, align 4
  %36 = mul nsw i32 %35, 9
  %37 = sub nsw i32 %34, %36
  store i32 %37, i32* %10, align 4
  %38 = load i32, i32* %10, align 4
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), i32 %38)
  %40 = load i32, i32* %10, align 4
  %41 = add nsw i32 %40, -1
  store i32 %41, i32* %10, align 4
  %42 = load i32, i32* %10, align 4
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), i32 %42)
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

declare dso_local i32 @getint(...) #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
