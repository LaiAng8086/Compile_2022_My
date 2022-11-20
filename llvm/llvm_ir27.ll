declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@c = constant [2 x [1 x i32]] [[1 x i32] [i32 1], [1 x i32] [i32 3]]
@b = global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 0], [3 x i32] [i32 0, i32 1, i32 0]]
@e = global [4 x [4 x i32]] zeroinitializer
@d = global [5 x i32] zeroinitializer
@a = global [3 x i32] [i32 1, i32 2, i32 0]
@_str_0 = constant [2 x i8] c"\0a\00"
define i32 @main(){
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  store i32 1, i32* %l1
  store i32 0, i32* %l2
  %l3 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* @c, i32 0, i32* %l1, i32 0
  %l4 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* @b, i32 0, i32 0, i32* %l2
  %l5 = load i32, i32* %l3
  %l6 = load i32, i32* %l4
  %l7 = add i32 %l5, %l6
  %l8 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* @c, i32 0, i32 0, i32* %l2
  %l9 = load i32, i32* %l8
  %l10 = add i32 %l7, %l9
  %l11 = getelementptr [3 x i32], [3 x i32]* @a, i32 0, i32 1
  %l12 = load i32, i32* %l11
  %l13 = add i32 %l10, %l12
  %l14 = getelementptr [5 x i32], [5 x i32]* @d, i32 4, i32 0
  %l15 = load i32, i32* %l14
  %l16 = add i32 %l13, %l15
  call void @putint(i32 %l16)
  %l17 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l17)
  ret i32 0
}
