; ModuleID = 'test24.c'
source_filename = "test24.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @func1(i32* %0) #0 {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  %4 = getelementptr inbounds i32, i32* %3, i64 2
  %5 = load i32, i32* %4, align 4
  call void @putint(i32 %5)
  %6 = load i32*, i32** %2, align 8
  %7 = getelementptr inbounds i32, i32* %6, i64 2
  %8 = load i32, i32* %7, align 4
  ret i32 %8
}

declare dso_local void @putint(i32) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @func2([3 x i32]* %0) #0 {
  %2 = alloca [3 x i32]*, align 8
  store [3 x i32]* %0, [3 x i32]** %2, align 8
  %3 = load [3 x i32]*, [3 x i32]** %2, align 8
  %4 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 1
  %5 = getelementptr inbounds [3 x i32], [3 x i32]* %4, i64 0, i64 0
  %6 = call i32 @func1(i32* %5)
  %7 = load [3 x i32]*, [3 x i32]** %2, align 8
  %8 = call i32 @func2([3 x i32]* %7)
  %9 = load [3 x i32]*, [3 x i32]** %2, align 8
  %10 = getelementptr inbounds [3 x i32], [3 x i32]* %9, i64 1
  %11 = getelementptr inbounds [3 x i32], [3 x i32]* %10, i64 0, i64 2
  %12 = load i32, i32* %11, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [3 x [3 x i32]], align 16
  store i32 0, i32* %1, align 4
  %3 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %2, i64 0, i64 1
  %4 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i64 0, i64 2
  store i32 110, i32* %4, align 4
  %5 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %2, i64 0, i64 2
  %6 = getelementptr inbounds [3 x i32], [3 x i32]* %5, i64 0, i64 2
  store i32 1, i32* %6, align 8
  %7 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %2, i64 0, i64 0
  %8 = call i32 @func2([3 x i32]* %7)
  call void @putint(i32 %8)
  %9 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %2, i64 0, i64 2
  %10 = getelementptr inbounds [3 x i32], [3 x i32]* %9, i64 0, i64 0
  %11 = call i32 @func1(i32* %10)
  call void @putint(i32 %11)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
