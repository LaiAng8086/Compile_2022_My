declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@a_c_num_1 = constant i32 1
@a_c_num_2 = constant i32 2
@a_c_num_3 = constant i32 3
@a_c_num_4 = constant i32 4
@a_c_num_5 = constant i32 5
@a_c_num_6 = constant i32 6
@a_v_num = global i32 0
@a_v_num_1 = global i32 1
@a_v_num_2 = global i32 2
@_str_0 = constant [10 x i8] c"20373260\0a\00"
@_str_1 = constant [11 x i8] c"a_c_num_1:\00"
@_str_2 = constant [2 x i8] c"\0a\00"
@_str_3 = constant [11 x i8] c"a_c_num_2:\00"
@_str_4 = constant [13 x i8] c", a_v_num_2:\00"
@_str_5 = constant [2 x i8] c"\0a\00"
define void @non_param_func(){
b0:
  ret void
}
define i32 @one_param_func(i32 %l1){
b0:
  %l2 = alloca i32
  %l3 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  %l7 = add i32 %l1, 1
  store i32 %l1, i32* %l2
  store i32 1, i32* %l4
  store i32 2, i32* %l5
  ret i32 %l7
}
define i32 @two_param_func(i32 %l1, i32 %l3){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l7 = add i32 %l1, %l3
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  ret i32 %l7
}
define i32 @more_than_two_param_func(i32 %l1, i32 %l3, i32 %l5){
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l6 = alloca i32
  %l9 = add i32 %l1, %l3
  %l11 = sub i32 %l9, %l5
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  store i32 %l5, i32* %l6
  ret i32 %l11
}
define i32 @main(){
b0:
  %l1 = alloca i32
  %l2 = alloca i32
  %l3 = alloca i32
  %l4 = alloca i32
  %l5 = alloca i32
  %l6 = alloca i32
  %l14 = alloca i32
  call void @non_param_func()
  %l11 = call i32 @more_than_two_param_func(i32 3, i32 4, i32 5)
  store i32 1, i32* %l1
  store i32 2, i32* %l3
  store i32 3, i32* %l4
  store i32 4, i32* %l5
  store i32 5, i32* %l6
  br i1 1, label %b12, label %b13

b12:
  %l15 = load i32, i32* %l3
  %l16 = add i32 %l15, 1
  %l18 = call i32 @two_param_func(i32 1, i32 %l16)
  %l23 = mul i32 %l18, 1
  %l24 = mul i32 %l16, 1
  %l25 = add i32 1, %l24
  %l26 = icmp eq i32 %l23, %l25
  store i32 %l16, i32* %l14
  store i32 %l18, i32* %l2
  br i1 %l26, label %b19, label %b21

b19:
  call void @non_param_func()
  br label %b20

b21:
  store i32 1, i32* @a_v_num
  br label %b28

b28:
  %l31 = load i32, i32* @a_v_num
  %l32 = icmp sle i32 %l31, 3
  br i1 %l32, label %b29, label %b30

b29:
  %l33 = load i32, i32* @a_v_num
  %l34 = call i32 @one_param_func(i32 %l33)
  store i32 %l34, i32* @a_v_num
  br i1 1, label %b37, label %b36

b37:
  %l38 = load i32, i32* @a_v_num
  %l39 = icmp eq i32 %l38, 3
  br i1 %l39, label %b35, label %b36

b35:
  br label %b30

b36:
  br i1 1, label %b40, label %b41

b40:
  br label %b28

b41:
  br label %b28

b30:
  br label %b20

b20:
  br label %b13

b13:
  %l42 = call i32 @one_param_func(i32 1)
  %l43 = mul i32 1, %l42
  %l44 = sdiv i32 %l43, 4
  %l45 = srem i32 %l44, -3
  %l46 = sub i32 %l45, 2
  %l48 = call i32 @getint()
  %l49 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l49)
  %l50 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l50)
  call void @putint(i32 1)
  %l51 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l51)
  %l52 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l52)
  call void @putint(i32 2)
  %l53 = getelementptr inbounds [13 x i8], [13 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l53)
  %l54 = load i32, i32* @a_v_num_2
  call void @putint(i32 %l54)
  %l55 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l55)
  store i32 %l48, i32* %l2
  ret i32 0
}
