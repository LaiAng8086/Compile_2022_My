; ModuleID = 'testfile.c'
source_filename = "testfile.c"
target datalayout = "e-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mipsel"

@N = dso_local local_unnamed_addr constant i32 10, align 4
@a = dso_local local_unnamed_addr global [10 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9], align 4
@.str = private unnamed_addr constant [5 x i8] c"%d, \00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"\0A%d, %d, %d\0A\00", align 1

; Function Attrs: nounwind readnone
define dso_local i32 @fib(i32 signext %0) local_unnamed_addr #0 {
  switch i32 %0, label %3 [
    i32 1, label %9
    i32 2, label %2
  ]

2:                                                ; preds = %1
  br label %9

3:                                                ; preds = %1
  %4 = add nsw i32 %0, -1
  %5 = call i32 @fib(i32 signext %4)
  %6 = add nsw i32 %0, -2
  %7 = call i32 @fib(i32 signext %6)
  %8 = add nsw i32 %7, %5
  br label %9

9:                                                ; preds = %1, %3, %2
  %10 = phi i32 [ 2, %2 ], [ %8, %3 ], [ %0, %1 ]
  ret i32 %10
}

; Function Attrs: nounwind
define dso_local i32 @main() local_unnamed_addr #1 {
  %1 = call i32 bitcast (i32 (...)* @getint to i32 ()*)() #4
  %2 = call i32 bitcast (i32 (...)* @getint to i32 ()*)() #4
  %3 = mul nsw i32 %2, %1
  %4 = call i32 @fib(i32 signext 4)
  %5 = mul i32 %3, %4
  %6 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 1), align 4, !tbaa !2
  %7 = sub i32 %6, %5
  %8 = mul nsw i32 %7, 5
  %9 = call i32 @fib(i32 signext 5)
  %10 = add nsw i32 %9, 2
  %11 = call i32 @fib(i32 signext %10)
  %12 = sub i32 -8894, %11
  %13 = icmp slt i32 %8, 101
  br i1 %13, label %14, label %55

14:                                               ; preds = %0
  %15 = mul i32 %6, 5
  %16 = mul i32 %4, %2
  %17 = mul i32 %16, %1
  %18 = mul i32 %17, 5
  %19 = sub i32 %15, %18
  %20 = icmp sgt i32 %19, 100
  %21 = select i1 %20, i32 %19, i32 100
  %22 = add i32 %21, %18
  %23 = sub i32 %22, %15
  %24 = mul i32 %23, 36
  %25 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 9), align 4, !tbaa !2
  %26 = add i32 %25, %24
  %27 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 8), align 4, !tbaa !2
  %28 = add i32 %27, %24
  %29 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 7), align 4, !tbaa !2
  %30 = add i32 %29, %24
  %31 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 6), align 4, !tbaa !2
  %32 = add i32 %31, %24
  %33 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 5), align 4, !tbaa !2
  %34 = add i32 %33, %24
  %35 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 4), align 4, !tbaa !2
  %36 = add i32 %35, %24
  %37 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 3), align 4, !tbaa !2
  %38 = add i32 %37, %24
  %39 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 2), align 4, !tbaa !2
  %40 = add i32 %39, %24
  %41 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 1), align 4, !tbaa !2
  %42 = add i32 %41, %24
  %43 = load i32, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 0), align 4, !tbaa !2
  %44 = add i32 %43, %24
  %45 = add i32 %44, 36
  %46 = add i32 %42, 36
  %47 = add i32 %40, 36
  %48 = add i32 %38, 36
  %49 = add i32 %36, 36
  %50 = add i32 %34, 36
  %51 = add i32 %32, 36
  %52 = add i32 %30, 36
  %53 = add i32 %28, 36
  %54 = add i32 %26, 36
  store i32 %45, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 0), align 4, !tbaa !2
  store i32 %46, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 1), align 4, !tbaa !2
  store i32 %47, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 2), align 4, !tbaa !2
  store i32 %48, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 3), align 4, !tbaa !2
  store i32 %49, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 4), align 4, !tbaa !2
  store i32 %50, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 5), align 4, !tbaa !2
  store i32 %51, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 6), align 4, !tbaa !2
  store i32 %52, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 7), align 4, !tbaa !2
  store i32 %53, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 8), align 4, !tbaa !2
  store i32 %54, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @a, i32 0, i32 9), align 4, !tbaa !2
  br label %55

55:                                               ; preds = %14, %0
  br label %56

56:                                               ; preds = %55, %56
  %57 = phi i32 [ %61, %56 ], [ 0, %55 ]
  %58 = getelementptr inbounds [10 x i32], [10 x i32]* @a, i32 0, i32 %57
  %59 = load i32, i32* %58, align 4, !tbaa !2
  %60 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 signext %59)
  %61 = add nuw nsw i32 %57, 1
  %62 = icmp eq i32 %61, 10
  br i1 %62, label %63, label %56

63:                                               ; preds = %56
  %64 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 signext 10, i32 signext %12, i32 signext -6)
  ret i32 0
}

declare dso_local i32 @getint(...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

attributes #0 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "target-features"="+fpxx,+mips32r2,+nooddspreg,-noabicalls" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
