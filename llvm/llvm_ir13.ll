declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
define i32 @main(){
b0:
  %l1 = alloca i32
  %l15 = alloca i32
  %l16 = alloca i32
  %l22 = alloca i32
  %l43 = alloca i32
  %l44 = alloca i32
  store i32 23, i32* %l1
  %l6 = load i32, i32* %l1
  %l7 = add i32 %l6, 1
  %l9 = xor i1 %l8, 1
  %10 = zext i1 %l9 to i32
  %l11 = add i32 %10, 3
  br i1 %l12, label %b5, label %b4

b5:
  %l13 = load i32, i32* %l1
  %l14 = icmp sgt i32 %l13, 19
  br i1 %l14, label %b2, label %b4

b2:
  store i32 0, i32* %l15
  %l20 = load i32, i32* %l1
  %l21 = icmp sle i32 %l20, 2
  br i1 %l21, label %b19, label %b18

b19:
  br i1 1, label %b17, label %b18

b17:
  store i32 3, i32* %l1
  br label %b18

b18:
  br label %b3

b4:
  store i32 12, i32* %l22
  %l23 = load i32, i32* %l22
  %l24 = add i32 %l23, 1
  store i32 %l24, i32* %l1
  %l30 = load i32, i32* %l22
  %l31 = icmp sle i32 13, %l30
  br i1 %l31, label %b29, label %b28

b29:
  %l33 = load i32, i32* %l1
  %l34 = icmp sgt i32 %l33, -1
  br i1 %l34, label %b32, label %b28

b32:
  %l35 = load i32, i32* %l22
  %l36 = icmp sgt i32 %l35, 6
  br i1 %l36, label %b25, label %b28

b28:
  %l38 = load i32, i32* %l1
  %l39 = icmp slt i32 %l38, 5
  br i1 %l39, label %b37, label %b27

b37:
  %l40 = load i32, i32* %l22
  %l41 = load i32, i32* %l1
  %l42 = icmp slt i32 %l40, %l41
  br i1 %l42, label %b25, label %b27

b25:
  store i32 12, i32* %l43
  br label %b26

b27:
  store i32 13, i32* %l44
  br label %b26

b26:
  br label %b3

b3:
  ret i32 0
}
