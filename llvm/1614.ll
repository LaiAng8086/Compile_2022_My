declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@MAXN = constant i32 100
@_str_0 = constant [10 x i8] c"20377020\0a\00"
@_str_1 = constant [2 x i8] c"\0a\00"
define void @swap(i32* %l1, i32 %l2, i32 %l4){
b0:
  %l3 = alloca i32
  %l5 = alloca i32
  %l6 = alloca i32
  %l8 = getelementptr i32, i32* %l1, i32 %l2
  %l9 = load i32, i32* %l8
  %l11 = getelementptr i32, i32* %l1, i32 %l4
  %l12 = load i32, i32* %l11
  store i32 %l12, i32* %l8
  store i32 %l9, i32* %l11
  store i32 %l2, i32* %l3
  store i32 %l4, i32* %l5
  store i32 %l9, i32* %l6
  ret void
}
define void @heapify(i32* %l1, i32 %l2){
b0:
  %l3 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  %l6 = alloca i32
  %l8 = mul i32 2, %l2
  %l10 = add i32 %l8, 1
  %l14 = getelementptr i32, i32* %l1, i32 0
  %l16 = load i32, i32* %l14
  %l17 = icmp sle i32 %l8, %l16
  store i32 %l2, i32* %l3
  store i32 %l8, i32* %l4
  store i32 %l10, i32* %l5
  br i1 %l17, label %b11, label %b13

b11:
  %l21 = load i32, i32* %l4
  %l22 = getelementptr i32, i32* %l1, i32 %l21
  %l23 = load i32, i32* %l3
  %l24 = getelementptr i32, i32* %l1, i32 %l23
  %l25 = load i32, i32* %l22
  %l26 = load i32, i32* %l24
  %l27 = icmp sgt i32 %l25, %l26
  br i1 %l27, label %b18, label %b20

b18:
  %l28 = load i32, i32* %l4
  store i32 %l28, i32* %l6
  br label %b19

b20:
  %l29 = load i32, i32* %l3
  store i32 %l29, i32* %l6
  br label %b19

b19:
  br label %b12

b13:
  %l30 = load i32, i32* %l3
  store i32 %l30, i32* %l6
  br label %b12

b12:
  %l33 = getelementptr i32, i32* %l1, i32 0
  %l34 = load i32, i32* %l5
  %l35 = load i32, i32* %l33
  %l36 = icmp sle i32 %l34, %l35
  br i1 %l36, label %b31, label %b32

b31:
  %l39 = load i32, i32* %l5
  %l40 = getelementptr i32, i32* %l1, i32 %l39
  %l41 = load i32, i32* %l6
  %l42 = getelementptr i32, i32* %l1, i32 %l41
  %l43 = load i32, i32* %l40
  %l44 = load i32, i32* %l42
  %l45 = icmp sgt i32 %l43, %l44
  br i1 %l45, label %b37, label %b38

b37:
  %l46 = load i32, i32* %l5
  store i32 %l46, i32* %l6
  br label %b38

b38:
  br label %b32

b32:
  %l49 = load i32, i32* %l6
  %l50 = load i32, i32* %l3
  %l51 = icmp ne i32 %l49, %l50
  br i1 %l51, label %b47, label %b48

b47:
  %l52 = load i32, i32* %l3
  %l53 = load i32, i32* %l6
  call void @swap(i32* %l1, i32 %l52, i32 %l53)
  call void @heapify(i32* %l1, i32 %l53)
  br label %b48

b48:
  ret void
}
define void @build_heap(i32* %l1){
b0:
  %l2 = alloca i32
  %l3 = getelementptr i32, i32* %l1, i32 0
  %l4 = load i32, i32* %l3
  %l5 = sdiv i32 %l4, 2
  store i32 %l5, i32* %l2
  br label %b6

b6:
  %l9 = load i32, i32* %l2
  %l10 = icmp sge i32 %l9, 1
  br i1 %l10, label %b7, label %b8

b7:
  %l11 = load i32, i32* %l2
  call void @heapify(i32* %l1, i32 %l11)
  %l13 = sub i32 %l11, 1
  store i32 %l13, i32* %l2
  br label %b6

b8:
  ret void
}
define void @heap_sort(){
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  %l3 = alloca [100 x i32]
  %l4 = call i32 @getint()
  %l6 = getelementptr [100 x i32], [100 x i32]* %l3, i32 0, i32 0
  store i32 %l4, i32* %l6
  store i32 1, i32* %l1
  store i32 %l4, i32* %l2
  br label %b7

b7:
  %l10 = load i32, i32* %l2
  %l11 = add i32 %l10, 1
  %l12 = load i32, i32* %l1
  %l13 = icmp slt i32 %l12, %l11
  br i1 %l13, label %b8, label %b9

b8:
  %l14 = load i32, i32* %l1
  %l15 = getelementptr [100 x i32], [100 x i32]* %l3, i32 0, i32 %l14
  %l16 = call i32 @getint()
  store i32 %l16, i32* %l15
  %l17 = add i32 %l14, 1
  store i32 %l17, i32* %l1
  br label %b7

b9:
  %l18 = getelementptr [100 x i32], [100 x i32]* %l3, i32 0, i32 0
  call void @build_heap(i32* %l18)
  %l20 = load i32, i32* %l2
  store i32 %l20, i32* %l1
  br label %b21

b21:
  %l24 = load i32, i32* %l1
  %l25 = icmp sge i32 %l24, 2
  br i1 %l25, label %b22, label %b23

b22:
  %l26 = getelementptr [100 x i32], [100 x i32]* %l3, i32 0, i32 0
  %l27 = load i32, i32* %l1
  call void @swap(i32* %l26, i32 1, i32 %l27)
  %l30 = load i32, i32* %l26
  %l31 = sub i32 %l30, 1
  store i32 %l31, i32* %l26
  call void @heapify(i32* %l26, i32 1)
  %l35 = sub i32 %l27, 1
  store i32 %l35, i32* %l1
  br label %b21

b23:
  %l36 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l36)
  store i32 1, i32* %l1
  br label %b37

b37:
  %l40 = load i32, i32* %l2
  %l41 = add i32 %l40, 1
  %l42 = load i32, i32* %l1
  %l43 = icmp slt i32 %l42, %l41
  br i1 %l43, label %b38, label %b39

b38:
  %l44 = load i32, i32* %l1
  %l45 = getelementptr [100 x i32], [100 x i32]* %l3, i32 0, i32 %l44
  %l46 = load i32, i32* %l45
  call void @putint(i32 %l46)
  %l47 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l47)
  %l48 = add i32 %l44, 1
  store i32 %l48, i32* %l1
  br label %b37

b39:
  ret void
}
define i32 @main(){
b0:
  call void @heap_sort()
  ret i32 0
}
