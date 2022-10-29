; ModuleID = 'test9.c'
source_filename = "test9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = common dso_local global [10 x i32] zeroinitializer, align 16
@y = common dso_local global [15 x [3 x i32]] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32 %0, i32* %1, [3 x i32]* %2) #0 {
  ; save the address
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %6 = alloca [3 x i32]*, align 8
  store i32 %0, i32* %4, align 4 ;The place in funcbody where a set.
  store i32* %1, i32** %5, align 8 ;The place in funcbody where b set.
  store [3 x i32]* %2, [3 x i32]** %6, align 8 ;The place in funcbody where c set.
  ; start calc
  %7 = load i32*, i32** %5, align 8
  %8 = getelementptr inbounds i32, i32* %7, i64 0
  %9 = load i32, i32* %8, align 4   ;b[0]
  %10 = load i32*, i32** %5, align 8
  %11 = getelementptr inbounds i32, i32* %10, i64 1 
  %12 = load i32, i32* %11, align 4 ;b[1]
  %13 = mul nsw i32 %9, %12
  store i32 %13, i32* %4, align 4 ;mul and save to a
  %14 = load [3 x i32]*, [3 x i32]** %6, align 8  ;the initial address of c
  %15 = getelementptr inbounds [3 x i32], [3 x i32]* %14, i64 0 ;c[0][*]
  %16 = getelementptr inbounds [3 x i32], [3 x i32]* %15, i64 0, i64 2  ;c[0][2]
  %17 = load i32, i32* %16, align 4 ;get the value of c[0][2]
  %18 = load i32*, i32** %5, align 8  ;b[]
  %19 = getelementptr inbounds i32, i32* %18, i64 3 ;address of b[3]
  %20 = load i32, i32* %19, align 4 ; the value of b[3]
  %21 = mul nsw i32 %17, %20
  %22 = load i32*, i32** %5, align 8
  %23 = getelementptr inbounds i32, i32* %22, i64 2 ; get the address of b[2]
  store i32 %21, i32* %23, align 4  ; save the b[2]
  %24 = load i32, i32* %4, align 4  ; get the value of a
  %25 = load i32*, i32** %5, align 8
  %26 = getelementptr inbounds i32, i32* %25, i64 2
  %27 = load i32, i32* %26, align 4 ; get the value of b[2]
  %28 = add nsw i32 %24, %27  ; a+b[2]
  ret i32 %28 ;return a+b[2]
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  store i32 101, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @x, i64 0, i64 0), align 16
  store i32 102, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @x, i64 0, i64 1), align 4
  store i32 676, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @x, i64 0, i64 3), align 4
  store i32 1011, i32* getelementptr inbounds ([15 x [3 x i32]], [15 x [3 x i32]]* @y, i64 0, i64 0, i64 2), align 8
  store i32 998, i32* getelementptr inbounds ([15 x [3 x i32]], [15 x [3 x i32]]* @y, i64 0, i64 0, i64 1), align 4
  %1 = call i32 @foo(i32 100, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @x, i64 0, i64 0), [3 x i32]* getelementptr inbounds ([15 x [3 x i32]], [15 x [3 x i32]]* @y, i64 0, i64 0))
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
