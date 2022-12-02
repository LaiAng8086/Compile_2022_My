declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@a = constant i32 1
@b = constant i32 1
@c = constant i32 1
@d = constant i32 1
@e = global i32 1
@f = global i32 1
@g = global i32 1
@h = global i32 1
@i = global i32 0
@j = global i32 0
@k = global i32 0
@l = global i32 0
@o = constant i32 1
@p = constant i32 1
@_str_0 = constant [10 x i8] c"20373291\0a\00"
@_str_1 = constant [5 x i8] c"i = \00"
@_str_2 = constant [6 x i8] c" j = \00"
@_str_3 = constant [6 x i8] c" k = \00"
@_str_4 = constant [2 x i8] c"\0a\00"
@_str_5 = constant [5 x i8] c"i = \00"
@_str_6 = constant [2 x i8] c"\0a\00"
@_str_7 = constant [8 x i8] c"!0 = 1\0a\00"
@_str_8 = constant [11 x i8] c"This is h\0a\00"
@_str_9 = constant [7 x i8] c"1 < 2\0a\00"
@_str_10 = constant [7 x i8] c"2 > 1\0a\00"
@_str_11 = constant [8 x i8] c"1 <= 1\0a\00"
@_str_12 = constant [8 x i8] c"1 >= 1\0a\00"
define i32 @main(){
b0:
  %l1 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  call void @putstr(i8* %l1)
  %l2 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l2)
  call void @putint(i32 1)
  %l4 = getelementptr inbounds [6 x i8], [6 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l4)
  call void @putint(i32 2)
  %l6 = getelementptr inbounds [6 x i8], [6 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l6)
  call void @putint(i32 3)
  %l8 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l8)
  %l9 = load i32, i32* @h
  %l10 = sub i32 0, %l9
  %l11 = getelementptr inbounds [5 x i8], [5 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l11)
  call void @putint(i32 %l10)
  %l13 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l13)
  store i32 %l10, i32* @i
  store i32 2, i32* @j
  store i32 3, i32* @k
  br i32 1, label %b14, label %b15

b14:
  %l16 = getelementptr inbounds [8 x i8], [8 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l16)
  br label %b15

b15:
  store i32 1, i32* @h
  store i32 0, i32* @i
  br i1 1, label %b22, label %b23

b22:
  %l26 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l26)
  br label %b23

b23:
  br i1 1, label %b27, label %b28

b27:
  %l29 = getelementptr inbounds [7 x i8], [7 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l29)
  br label %b28

b28:
  br i1 1, label %b30, label %b31

b30:
  %l32 = getelementptr inbounds [7 x i8], [7 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l32)
  br label %b31

b31:
  br i1 1, label %b33, label %b34

b33:
  %l35 = getelementptr inbounds [8 x i8], [8 x i8]* @_str_11, i32 0, i32 0
  call void @putstr(i8* %l35)
  br label %b34

b34:
  br i1 1, label %b36, label %b37

b36:
  %l38 = getelementptr inbounds [8 x i8], [8 x i8]* @_str_12, i32 0, i32 0
  call void @putstr(i8* %l38)
  br label %b37

b37:
  ret i32 0
}
