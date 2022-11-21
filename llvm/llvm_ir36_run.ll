; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@N = constant i32 10000
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define i32 @long_array(i32 %l1) {
b0:
  %l2 = alloca i32
  %l3 = alloca [10000 x i32]
  %l4 = alloca [10000 x i32]
  %l5 = alloca [10000 x i32]
  %l6 = alloca i32
  %l58 = alloca i32
  %l81 = alloca i32
  %l104 = alloca i32
  store i32 %l1, i32* %l2
  store i32 0, i32* %l6
  br label %b7

b7:                                               ; preds = %b8, %b0
  %l10 = load i32, i32* %l6
  %l11 = icmp slt i32 %l10, 10000
  br i1 %l11, label %b8, label %b9

b8:                                               ; preds = %b7
  %l12 = load i32, i32* %l6
  %l13 = load i32, i32* %l6
  %l14 = mul i32 %l12, %l13
  %l15 = srem i32 %l14, 10
  %l16 = load i32, i32* %l6
  %l17 = getelementptr [10000 x i32], [10000 x i32]* %l3, i32 0, i32 %l16
  store i32 %l15, i32* %l17
  %l18 = load i32, i32* %l6
  %l19 = add i32 %l18, 1
  store i32 %l19, i32* %l6
  br label %b7

b9:                                               ; preds = %b7
  store i32 0, i32* %l6
  br label %b20

b20:                                              ; preds = %b21, %b9
  %l23 = load i32, i32* %l6
  %l24 = icmp slt i32 %l23, 10000
  br i1 %l24, label %b21, label %b22

b21:                                              ; preds = %b20
  %l25 = load i32, i32* %l6
  %l26 = getelementptr [10000 x i32], [10000 x i32]* %l3, i32 0, i32 %l25
  %l27 = load i32, i32* %l6
  %l28 = getelementptr [10000 x i32], [10000 x i32]* %l3, i32 0, i32 %l27
  %l29 = load i32, i32* %l26
  %l30 = load i32, i32* %l28
  %l31 = mul i32 %l29, %l30
  %l32 = srem i32 %l31, 10
  %l33 = load i32, i32* %l6
  %l34 = getelementptr [10000 x i32], [10000 x i32]* %l4, i32 0, i32 %l33
  store i32 %l32, i32* %l34
  %l35 = load i32, i32* %l6
  %l36 = add i32 %l35, 1
  store i32 %l36, i32* %l6
  br label %b20

b22:                                              ; preds = %b20
  store i32 0, i32* %l6
  br label %b37

b37:                                              ; preds = %b38, %b22
  %l40 = load i32, i32* %l6
  %l41 = icmp slt i32 %l40, 10000
  br i1 %l41, label %b38, label %b39

b38:                                              ; preds = %b37
  %l42 = load i32, i32* %l6
  %l43 = getelementptr [10000 x i32], [10000 x i32]* %l4, i32 0, i32 %l42
  %l44 = load i32, i32* %l6
  %l45 = getelementptr [10000 x i32], [10000 x i32]* %l4, i32 0, i32 %l44
  %l46 = load i32, i32* %l43
  %l47 = load i32, i32* %l45
  %l48 = mul i32 %l46, %l47
  %l49 = srem i32 %l48, 100
  %l50 = load i32, i32* %l6
  %l51 = getelementptr [10000 x i32], [10000 x i32]* %l3, i32 0, i32 %l50
  %l52 = load i32, i32* %l51
  %l53 = add i32 %l49, %l52
  %l54 = load i32, i32* %l6
  %l55 = getelementptr [10000 x i32], [10000 x i32]* %l5, i32 0, i32 %l54
  store i32 %l53, i32* %l55
  %l56 = load i32, i32* %l6
  %l57 = add i32 %l56, 1
  store i32 %l57, i32* %l6
  br label %b37

b39:                                              ; preds = %b37
  store i32 0, i32* %l58
  store i32 0, i32* %l6
  br label %b59

b59:                                              ; preds = %b65, %b39
  %l62 = load i32, i32* %l6
  %l63 = icmp slt i32 %l62, 10000
  br i1 %l63, label %b60, label %b61

b60:                                              ; preds = %b59
  %l67 = load i32, i32* %l6
  %l68 = icmp slt i32 %l67, 10
  br i1 %l68, label %b64, label %b66

b64:                                              ; preds = %b60
  %l69 = load i32, i32* %l6
  %l70 = getelementptr [10000 x i32], [10000 x i32]* %l5, i32 0, i32 %l69
  %l71 = load i32, i32* %l58
  %l72 = load i32, i32* %l70
  %l73 = add i32 %l71, %l72
  %l74 = srem i32 %l73, 1333
  store i32 %l74, i32* %l58
  %l75 = load i32, i32* %l58
  call void @putint(i32 %l75)
  br label %b65

b66:                                              ; preds = %b60
  %l79 = load i32, i32* %l6
  %l80 = icmp slt i32 %l79, 20
  br i1 %l80, label %b76, label %b78

b76:                                              ; preds = %b66
  store i32 5000, i32* %l81
  br label %b82

b82:                                              ; preds = %b83, %b76
  %l85 = load i32, i32* %l81
  %l86 = icmp slt i32 %l85, 10000
  br i1 %l86, label %b83, label %b84

b83:                                              ; preds = %b82
  %l87 = load i32, i32* %l6
  %l88 = getelementptr [10000 x i32], [10000 x i32]* %l5, i32 0, i32 %l87
  %l89 = load i32, i32* %l58
  %l90 = load i32, i32* %l88
  %l91 = add i32 %l89, %l90
  %l92 = load i32, i32* %l81
  %l93 = getelementptr [10000 x i32], [10000 x i32]* %l3, i32 0, i32 %l92
  %l94 = load i32, i32* %l93
  %l95 = sub i32 %l91, %l94
  store i32 %l95, i32* %l58
  %l96 = load i32, i32* %l81
  %l97 = add i32 %l96, 1
  store i32 %l97, i32* %l81
  br label %b82

b84:                                              ; preds = %b82
  %l98 = load i32, i32* %l58
  call void @putint(i32 %l98)
  br label %b77

b78:                                              ; preds = %b66
  %l102 = load i32, i32* %l6
  %l103 = icmp slt i32 %l102, 30
  br i1 %l103, label %b99, label %b101

b99:                                              ; preds = %b78
  store i32 5000, i32* %l104
  br label %b105

b105:                                             ; preds = %b111, %b99
  %l108 = load i32, i32* %l104
  %l109 = icmp slt i32 %l108, 10000
  br i1 %l109, label %b106, label %b107

b106:                                             ; preds = %b105
  %l113 = load i32, i32* %l104
  %l114 = icmp sgt i32 %l113, 2233
  br i1 %l114, label %b110, label %b112

b110:                                             ; preds = %b106
  %l115 = load i32, i32* %l6
  %l116 = getelementptr [10000 x i32], [10000 x i32]* %l4, i32 0, i32 %l115
  %l117 = load i32, i32* %l58
  %l118 = load i32, i32* %l116
  %l119 = add i32 %l117, %l118
  %l120 = load i32, i32* %l104
  %l121 = getelementptr [10000 x i32], [10000 x i32]* %l3, i32 0, i32 %l120
  %l122 = load i32, i32* %l121
  %l123 = sub i32 %l119, %l122
  store i32 %l123, i32* %l58
  %l124 = load i32, i32* %l104
  %l125 = add i32 %l124, 1
  store i32 %l125, i32* %l104
  br label %b111

b112:                                             ; preds = %b106
  %l126 = load i32, i32* %l6
  %l127 = getelementptr [10000 x i32], [10000 x i32]* %l3, i32 0, i32 %l126
  %l128 = load i32, i32* %l58
  %l129 = load i32, i32* %l127
  %l130 = add i32 %l128, %l129
  %l131 = load i32, i32* %l104
  %l132 = getelementptr [10000 x i32], [10000 x i32]* %l5, i32 0, i32 %l131
  %l133 = load i32, i32* %l132
  %l134 = add i32 %l130, %l133
  %l135 = srem i32 %l134, 13333
  store i32 %l135, i32* %l58
  %l136 = load i32, i32* %l104
  %l137 = add i32 %l136, 2
  store i32 %l137, i32* %l104
  br label %b111

b111:                                             ; preds = %b112, %b110
  br label %b105

b107:                                             ; preds = %b105
  %l138 = load i32, i32* %l58
  call void @putint(i32 %l138)
  br label %b100

b101:                                             ; preds = %b78
  %l139 = load i32, i32* %l6
  %l140 = getelementptr [10000 x i32], [10000 x i32]* %l5, i32 0, i32 %l139
  %l141 = load i32, i32* %l140
  %l142 = load i32, i32* %l2
  %l143 = mul i32 %l141, %l142
  %l144 = load i32, i32* %l58
  %l145 = add i32 %l144, %l143
  %l146 = srem i32 %l145, 99988
  store i32 %l146, i32* %l58
  br label %b100

b100:                                             ; preds = %b101, %b107
  br label %b77

b77:                                              ; preds = %b100, %b84
  br label %b65

b65:                                              ; preds = %b77, %b64
  %l147 = load i32, i32* %l6
  %l148 = add i32 %l147, 1
  store i32 %l148, i32* %l6
  br label %b59

b61:                                              ; preds = %b59
  %l149 = load i32, i32* %l58
  ret i32 %l149
}

define i32 @main() {
b0:
  %l1 = call i32 @long_array(i32 9)
  call void @putint(i32 %l1)
  %l2 = call i32 @long_array(i32 9)
  ret i32 %l2
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
