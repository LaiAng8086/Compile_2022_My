@a = global [2 x [3 x i32]] zeroinitializer

define i32 @main() #0 {
  %1 = alloca i32
  %2 = alloca i32
  %3 = alloca i32
  store i32 0, i32* %1
  store i32 780, i32* %2
  store i32 0, i32* %3
  %4 = load i32, i32* %2
  %5 = icmp sgt i32 %4, 100
  br i1 %5, label %6, label %9

6:                                                ; preds = %0
  %7 = load i32, i32* %2
  %8 = add i32 %7, 1
  store i32 %8, i32* %3
  br label %12

9:                                                ; preds = %0
  %10 = load i32, i32* %2
  %11 = srem i32 %10, 3
  store i32 %11, i32* %3
  br label %12

12:                                               ; preds = %9, %6
  %13 = load i32, i32* %3
  ret i32 %13
}