declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@c = constant [2 x [1 x i32]] [[1 x i32] [i32 1], [1 x i32] [i32 3]]
@b = global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 0, i32 0], [3 x i32] [i32 0, i32 0, i32 0]]
@e = global [4 x [4 x i32]] zeroinitializer
@d = global [5 x i32] zeroinitializer
@a = global [3 x i32] [i32 1, i32 2, i32 0]
@_str_0 = constant [2 x i8] c"\0a\00"
define i32 @main(){
b0:
  %l1 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* @c, i32 0, i32 1, i32 0
  %l2 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* @b, i32 0, i32 0, i32 0
  %l3 = load i32, i32* %l1
  %l4 = load i32, i32* %l2
  %l5 = add i32 %l3, %l4
  %l6 = getelementptr [2 x [1 x i32]], [2 x [1 x i32]]* @c, i32 0, i32 0, i32 0
  %l7 = load i32, i32* %l6
  %l8 = add i32 %l5, %l7
  %l9 = getelementptr [3 x i32], [3 x i32]* @a, i32 0, i32 1
  %l10 = load i32, i32* %l9
  %l11 = add i32 %l8, %l10
  %l12 = getelementptr [5 x i32], [5 x i32]* @d, i32 4, i32 0
  %l13 = load i32, i32* %l12
  %l14 = add i32 %l11, %l13
  call void @putint(i32 %l14)
  %l15 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l15)
  ret i32 0
}
