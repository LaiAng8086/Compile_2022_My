declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
define i32 @main(){
b0:
  %l1 = alloca i32
  %l12 = alloca i32
  %l13 = alloca i32
  %l19 = alloca i32
  %l35 = alloca i32
  %l36 = alloca i32
  store i32 23, i32* %l1
  %l6 = load i32, i32* %l1
  %l7 = add i32 %l6, 1
  %l9 = xor i1 %l8, 1
  %l10 = add i32 %l9, 3
  br i1 %l11, label %b5, label %b4

b2:
  store i32 0, i32* %l12
  %l17 = load i32, i32* %l1
  %l18 = icmp sle i32 %l17, 2
  br i1 %l18, label %b16, label %b15

b14:
  store i32 3, i32* %l1
  br label %b15

b15:
  br label %b3

b4:
  store i32 12, i32* %l19
  %l20 = load i32, i32* %l19
  %l21 = add i32 %l20, 1
  store i32 %l21, i32* %l1
  %l27 = load i32, i32* %l19
  %l28 = icmp sle i32 13, %l27
  br i1 %l28, label %b26, label %b25

b22:
  store i32 12, i32* %l35
  br label %b23

b26:
  %l30 = load i32, i32* %l1
  %l31 = icmp sgt i32 %l30, -1
  br i1 %l31, label %b29, label %b25

b25:
  %l33 = load i32, i32* %l1
  %l34 = icmp slt i32 %l33, 5
  br i1 %l34, label %b32, label %b24

b24:
  store i32 13, i32* %l36
  br label %b23

b23:
  br label %b3

b3:
  ret i32 0
}
