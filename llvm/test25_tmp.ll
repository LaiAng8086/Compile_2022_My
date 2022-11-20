; ModuleID = 'test25.c'
source_filename = "test25.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 23, i32* %2, align 4
  %8 = load i32, i32* %2, align 4
  %9 = add nsw i32 %8, 1
  %10 = icmp ne i32 %9, 0
  %11 = xor i1 %10, true
  %12 = zext i1 %11 to i32
  %13 = add nsw i32 %12, 3
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %23

15:                                               ; preds = %0
  %16 = load i32, i32* %2, align 4
  %17 = icmp sgt i32 %16, 19
  br i1 %17, label %18, label %23

18:                                               ; preds = %15
  store i32 0, i32* %3, align 4
  %19 = load i32, i32* %2, align 4
  %20 = icmp sle i32 %19, 2
  br i1 %20, label %21, label %22

21:                                               ; preds = %18
  store i32 3, i32* %2, align 4
  br label %22

22:                                               ; preds = %21, %18
  br label %44

23:                                               ; preds = %15, %0
  store i32 12, i32* %5, align 4
  %24 = load i32, i32* %5, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %2, align 4
  %26 = load i32, i32* %5, align 4
  %27 = icmp sle i32 13, %26
  br i1 %27, label %28, label %31

28:                                               ; preds = %23
  %29 = load i32, i32* %2, align 4
  %30 = icmp sgt i32 %29, -1
  br i1 %30, label %34, label %31

31:                                               ; preds = %28, %23
  %32 = load i32, i32* %5, align 4
  %33 = icmp sgt i32 %32, 6
  br i1 %33, label %34, label %42

34:                                               ; preds = %31, %28
  %35 = load i32, i32* %2, align 4
  %36 = icmp slt i32 %35, 5
  br i1 %36, label %37, label %42

37:                                               ; preds = %34
  %38 = load i32, i32* %5, align 4
  %39 = load i32, i32* %2, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %42

41:                                               ; preds = %37
  store i32 12, i32* %6, align 4
  br label %43

42:                                               ; preds = %37, %34, %31
  store i32 13, i32* %7, align 4
  br label %43

43:                                               ; preds = %42, %41
  br label %44

44:                                               ; preds = %43, %22
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
