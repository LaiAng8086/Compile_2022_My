; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = constant i32 1
@b = constant i32 2
@c = constant i32 2
@d = constant i32 3
@e = constant i32 0
@f = constant i32 0
@g = constant i32 1
@h = constant i32 -1
@l = constant i32 7800451
@o = constant i32 0
@p = constant i32 3
@q = constant i32 1965
@qq = constant i32 1965
@qqq = constant i32 1965
@arr = constant [3 x i32] [i32 0, i32 -45, i32 0]
@brr = constant [3 x [1 x i32]] [[1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1]]
@awa = global i32 0
@awd = global i32 141
@crr = global [2 x [3 x i32]] [[3 x i32] [i32 -389617, i32 228, i32 -22], [3 x i32] [i32 16, i32 4, i32 10]]
@drr = global [1 x [2 x i32]] [[2 x i32] [i32 141, i32 116]]
@err = global [2 x i32] [i32 225, i32 747]
@_str_0 = constant [10 x i8] c"20231204\0A\00"
@_str_1 = constant [12 x i8] c"awadwad is \00"
@_str_2 = constant [6 x i8] c" now\0A\00"
@_str_3 = constant [30 x i8] c"awadwad has changed in block\0A\00"
@_str_4 = constant [12 x i8] c"awadwad is \00"
@_str_5 = constant [6 x i8] c" now\0A\00"
@_str_6 = constant [11 x i8] c"double if\0A\00"
@_str_7 = constant [20 x i8] c"cur val in loop is \00"
@_str_8 = constant [2 x i8] c"\0A\00"
@_str_9 = constant [96 x i8] c"input n and the array which length is n, then will sort this array, n is required less than 20\0A\00"
@_str_10 = constant [27 x i8] c"after sort, the array is: \00"
@_str_11 = constant [2 x i8] c" \00"
@_str_12 = constant [4 x i8] c"414\00"
@_str_13 = constant [4 x i8] c"414\00"
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

define void @foo1() {
b0:
  ret void

0:                                                ; No predecessors!
  ret void

1:                                                ; No predecessors!
  ret void
}

define void @foo2(i32 %l1) {
b0:
  %l2 = alloca i32
  store i32 %l1, i32* %l2
  ret void
}

define void @mqsort(i32 %l1, i32 %l3, i32* %l5) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l11 = alloca i32
  %l18 = alloca i32
  %l20 = alloca i32
  %l57 = alloca i32
  %l10 = icmp sge i32 %l1, %l3
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  br i1 %l10, label %b6, label %b7

b6:                                               ; preds = %b0
  ret void

b7:                                               ; preds = %b0
  %l12 = load i32, i32* %l2
  %l13 = load i32, i32* %l4
  %l14 = add i32 %l12, %l13
  %l15 = sdiv i32 %l14, 2
  %l16 = getelementptr i32, i32* %l5, i32 %l15
  %l17 = load i32, i32* %l16
  %l19 = sub i32 %l12, 1
  %l21 = add i32 %l13, 1
  store i32 %l17, i32* %l11
  store i32 %l21, i32* %l20
  store i32 %l19, i32* %l18
  br label %b22

b22:                                              ; preds = %b53, %b7
  %l25 = load i32, i32* %l18
  %l26 = load i32, i32* %l20
  %l27 = icmp slt i32 %l25, %l26
  br i1 %l27, label %b23, label %b24

b23:                                              ; preds = %b22
  %l28 = load i32, i32* %l18
  %l29 = add i32 %l28, 1
  store i32 %l29, i32* %l18
  br label %b30

b30:                                              ; preds = %b31, %b23
  %l33 = load i32, i32* %l18
  %l34 = getelementptr i32, i32* %l5, i32 %l33
  %l35 = load i32, i32* %l34
  %l36 = load i32, i32* %l11
  %l37 = icmp slt i32 %l35, %l36
  br i1 %l37, label %b31, label %b32

b31:                                              ; preds = %b30
  %l38 = load i32, i32* %l18
  %l39 = add i32 %l38, 1
  store i32 %l39, i32* %l18
  br label %b30

b32:                                              ; preds = %b30
  %l40 = load i32, i32* %l20
  %l41 = sub i32 %l40, 1
  store i32 %l41, i32* %l20
  br label %b42

b42:                                              ; preds = %b43, %b32
  %l45 = load i32, i32* %l20
  %l46 = getelementptr i32, i32* %l5, i32 %l45
  %l47 = load i32, i32* %l46
  %l48 = load i32, i32* %l11
  %l49 = icmp sgt i32 %l47, %l48
  br i1 %l49, label %b43, label %b44

b43:                                              ; preds = %b42
  %l50 = load i32, i32* %l20
  %l51 = sub i32 %l50, 1
  store i32 %l51, i32* %l20
  br label %b42

b44:                                              ; preds = %b42
  %l54 = load i32, i32* %l18
  %l55 = load i32, i32* %l20
  %l56 = icmp slt i32 %l54, %l55
  br i1 %l56, label %b52, label %b53

b52:                                              ; preds = %b44
  %l58 = load i32, i32* %l18
  %l59 = getelementptr i32, i32* %l5, i32 %l58
  %l60 = load i32, i32* %l59
  %l61 = load i32, i32* %l20
  %l62 = getelementptr i32, i32* %l5, i32 %l61
  %l63 = load i32, i32* %l62
  store i32 %l63, i32* %l59
  store i32 %l60, i32* %l62
  store i32 %l60, i32* %l57
  br label %b53

b53:                                              ; preds = %b52, %b44
  br label %b22

b24:                                              ; preds = %b22
  %l67 = load i32, i32* %l2
  %l68 = load i32, i32* %l20
  call void @mqsort(i32 %l67, i32 %l68, i32* %l5)
  %l70 = add i32 %l68, 1
  %l71 = load i32, i32* %l4
  call void @mqsort(i32 %l70, i32 %l71, i32* %l5)
  ret void
}

define i32 @foo3(i32 %l1, i32 %l3) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l7 = add i32 %l1, %l3
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  ret i32 %l7
}

define void @mqsort2(i32 %l1, i32 %l3, [20 x i32]* %l5) {
b0:
  %l2 = alloca i32
  %l4 = alloca i32
  %l11 = alloca i32
  %l18 = alloca i32
  %l20 = alloca i32
  %l57 = alloca i32
  %l10 = icmp sge i32 %l1, %l3
  store i32 %l1, i32* %l2
  store i32 %l3, i32* %l4
  br i1 %l10, label %b6, label %b7

b6:                                               ; preds = %b0
  ret void

b7:                                               ; preds = %b0
  %l12 = load i32, i32* %l2
  %l13 = load i32, i32* %l4
  %l14 = add i32 %l12, %l13
  %l15 = sdiv i32 %l14, 2
  %l16 = getelementptr [20 x i32], [20 x i32]* %l5, i32 1, i32 %l15
  %l17 = load i32, i32* %l16
  %l19 = sub i32 %l12, 1
  %l21 = add i32 %l13, 1
  store i32 %l17, i32* %l11
  store i32 %l21, i32* %l20
  store i32 %l19, i32* %l18
  br label %b22

b22:                                              ; preds = %b53, %b7
  %l25 = load i32, i32* %l18
  %l26 = load i32, i32* %l20
  %l27 = icmp slt i32 %l25, %l26
  br i1 %l27, label %b23, label %b24

b23:                                              ; preds = %b22
  %l28 = load i32, i32* %l18
  %l29 = add i32 %l28, 1
  store i32 %l29, i32* %l18
  br label %b30

b30:                                              ; preds = %b31, %b23
  %l33 = load i32, i32* %l18
  %l34 = getelementptr [20 x i32], [20 x i32]* %l5, i32 1, i32 %l33
  %l35 = load i32, i32* %l34
  %l36 = load i32, i32* %l11
  %l37 = icmp slt i32 %l35, %l36
  br i1 %l37, label %b31, label %b32

b31:                                              ; preds = %b30
  %l38 = load i32, i32* %l18
  %l39 = add i32 %l38, 1
  store i32 %l39, i32* %l18
  br label %b30

b32:                                              ; preds = %b30
  %l40 = load i32, i32* %l20
  %l41 = sub i32 %l40, 1
  store i32 %l41, i32* %l20
  br label %b42

b42:                                              ; preds = %b43, %b32
  %l45 = load i32, i32* %l20
  %l46 = getelementptr [20 x i32], [20 x i32]* %l5, i32 1, i32 %l45
  %l47 = load i32, i32* %l46
  %l48 = load i32, i32* %l11
  %l49 = icmp sgt i32 %l47, %l48
  br i1 %l49, label %b43, label %b44

b43:                                              ; preds = %b42
  %l50 = load i32, i32* %l20
  %l51 = sub i32 %l50, 1
  store i32 %l51, i32* %l20
  br label %b42

b44:                                              ; preds = %b42
  %l54 = load i32, i32* %l18
  %l55 = load i32, i32* %l20
  %l56 = icmp slt i32 %l54, %l55
  br i1 %l56, label %b52, label %b53

b52:                                              ; preds = %b44
  %l58 = load i32, i32* %l18
  %l59 = getelementptr [20 x i32], [20 x i32]* %l5, i32 1, i32 %l58
  %l60 = load i32, i32* %l59
  %l61 = load i32, i32* %l20
  %l62 = getelementptr [20 x i32], [20 x i32]* %l5, i32 1, i32 %l61
  %l63 = load i32, i32* %l62
  store i32 %l63, i32* %l59
  store i32 %l60, i32* %l62
  store i32 %l60, i32* %l57
  br label %b53

b53:                                              ; preds = %b52, %b44
  br label %b22

b24:                                              ; preds = %b22
  %l67 = load i32, i32* %l2
  %l68 = load i32, i32* %l20
  call void @mqsort2(i32 %l67, i32 %l68, [20 x i32]* %l5)
  %l70 = add i32 %l68, 1
  %l71 = load i32, i32* %l4
  call void @mqsort2(i32 %l70, i32 %l71, [20 x i32]* %l5)
  ret void
}

define i32 @main() {
b0:
  %l1 = alloca i32
  %l6 = alloca i32
  %l11 = alloca i32
  %l30 = alloca i32
  %l46 = alloca i32
  %l67 = alloca i32
  %l69 = alloca [20 x i32]
  %l90 = alloca i32
  %l91 = alloca [2 x [20 x i32]]
  %l178 = alloca i32
  %l2 = getelementptr inbounds [10 x i8], [10 x i8]* @_str_0, i32 0, i32 0
  store i32 10, i32* @awa
  call void @putstr(i8* %l2)
  %l3 = getelementptr inbounds [12 x i8], [12 x i8]* @_str_1, i32 0, i32 0
  call void @putstr(i8* %l3)
  call void @putint(i32 545)
  %l5 = getelementptr inbounds [6 x i8], [6 x i8]* @_str_2, i32 0, i32 0
  call void @putstr(i8* %l5)
  %l7 = getelementptr inbounds [30 x i8], [30 x i8]* @_str_3, i32 0, i32 0
  call void @putstr(i8* %l7)
  %l8 = getelementptr inbounds [12 x i8], [12 x i8]* @_str_4, i32 0, i32 0
  call void @putstr(i8* %l8)
  call void @putint(i32 11)
  %l10 = getelementptr inbounds [6 x i8], [6 x i8]* @_str_5, i32 0, i32 0
  call void @putstr(i8* %l10)
  store i32 14, i32* %l11
  store i32 545, i32* %l1
  store i32 11, i32* %l6
  br label %b12

b12:                                              ; preds = %b0
  br label %b13

b13:                                              ; preds = %b12
  %l18 = load i32, i32* %l11
  %l19 = icmp sgt i32 0, %l18
  br i1 %l19, label %b16, label %b17

b16:                                              ; preds = %b13
  br label %b17

b17:                                              ; preds = %b16, %b13
  %l22 = load i32, i32* %l11
  %l23 = icmp eq i32 0, %l22
  br i1 %l23, label %b20, label %b21

b20:                                              ; preds = %b17
  br label %b21

b21:                                              ; preds = %b20, %b17
  %l26 = load i32, i32* %l11
  %l27 = icmp ne i32 %l26, 1
  br i1 %l27, label %b24, label %b25

b24:                                              ; preds = %b21
  br label %b29

b28:                                              ; No predecessors!
  %l31 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* @crr, i32 0, i32 0, i32 1
  %l32 = load i32, i32* %l31
  store i32 %l32, i32* %l30
  br label %b29

b29:                                              ; preds = %b28, %b24
  br label %b25

b25:                                              ; preds = %b29, %b21
  %l35 = load i32, i32* %l11
  %l36 = icmp sge i32 78881, %l35
  br i1 %l36, label %b33, label %b34

b33:                                              ; preds = %b25
  %l39 = load i32, i32* %l11
  %l40 = icmp eq i32 %l39, %l39
  br i1 %l40, label %b37, label %b38

b37:                                              ; preds = %b33
  %l43 = load i32, i32* %l11
  %l44 = icmp ne i32 %l43, 0
  br i1 %l44, label %b41, label %b42

b41:                                              ; preds = %b37
  %l45 = getelementptr inbounds [11 x i8], [11 x i8]* @_str_6, i32 0, i32 0
  call void @putstr(i8* %l45)
  br label %b42

b42:                                              ; preds = %b41, %b37
  br label %b38

b38:                                              ; preds = %b42, %b33
  br label %b34

b34:                                              ; preds = %b38, %b25
  store i32 11, i32* %l46
  br label %b47

b47:                                              ; preds = %b63, %b56, %b34
  %l50 = load i32, i32* %l46
  %l51 = icmp sle i32 %l50, 10000
  br i1 %l51, label %b48, label %b49

b48:                                              ; preds = %b47
  %l52 = load i32, i32* %l46
  %l53 = add i32 %l52, 1
  %l58 = icmp sgt i32 %l53, 100
  store i32 %l53, i32* %l46
  br i1 %l58, label %b54, label %b56

b54:                                              ; preds = %b48
  %l59 = getelementptr inbounds [20 x i8], [20 x i8]* @_str_7, i32 0, i32 0
  call void @putstr(i8* %l59)
  %l60 = load i32, i32* %l46
  call void @putint(i32 %l60)
  %l61 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_8, i32 0, i32 0
  call void @putstr(i8* %l61)
  br label %b55

b56:                                              ; preds = %b48
  br label %b47

b55:                                              ; preds = %b54
  %l64 = load i32, i32* %l46
  %l65 = icmp eq i32 %l64, 101
  br i1 %l65, label %b62, label %b63

b62:                                              ; preds = %b55
  br label %b49

b63:                                              ; preds = %b55
  br label %b47

b49:                                              ; preds = %b62, %b47
  %l66 = getelementptr inbounds [96 x i8], [96 x i8]* @_str_9, i32 0, i32 0
  call void @putstr(i8* %l66)
  %l68 = call i32 @getint()
  %l70 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 0
  store i32 0, i32* %l70
  %l71 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 1
  store i32 0, i32* %l71
  %l72 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 2
  store i32 0, i32* %l72
  %l73 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 3
  store i32 0, i32* %l73
  %l74 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 4
  store i32 0, i32* %l74
  %l75 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 5
  store i32 0, i32* %l75
  %l76 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 6
  store i32 0, i32* %l76
  %l77 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 7
  store i32 0, i32* %l77
  %l78 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 8
  store i32 0, i32* %l78
  %l79 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 9
  store i32 0, i32* %l79
  %l80 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 10
  store i32 0, i32* %l80
  %l81 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 11
  store i32 0, i32* %l81
  %l82 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 12
  store i32 0, i32* %l82
  %l83 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 13
  store i32 0, i32* %l83
  %l84 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 14
  store i32 0, i32* %l84
  %l85 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 15
  store i32 0, i32* %l85
  %l86 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 16
  store i32 0, i32* %l86
  %l87 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 17
  store i32 0, i32* %l87
  %l88 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 18
  store i32 0, i32* %l88
  %l89 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 19
  store i32 0, i32* %l89
  %l92 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 0
  store i32 0, i32* %l92
  %l93 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 1
  store i32 0, i32* %l93
  %l94 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 2
  store i32 0, i32* %l94
  %l95 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 3
  store i32 0, i32* %l95
  %l96 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 4
  store i32 0, i32* %l96
  %l97 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 5
  store i32 0, i32* %l97
  %l98 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 6
  store i32 0, i32* %l98
  %l99 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 7
  store i32 0, i32* %l99
  %l100 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 8
  store i32 0, i32* %l100
  %l101 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 9
  store i32 0, i32* %l101
  %l102 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 10
  store i32 0, i32* %l102
  %l103 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 11
  store i32 0, i32* %l103
  %l104 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 12
  store i32 0, i32* %l104
  %l105 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 13
  store i32 0, i32* %l105
  %l106 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 14
  store i32 0, i32* %l106
  %l107 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 15
  store i32 0, i32* %l107
  %l108 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 16
  store i32 0, i32* %l108
  %l109 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 17
  store i32 0, i32* %l109
  %l110 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 18
  store i32 0, i32* %l110
  %l111 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0, i32 19
  store i32 0, i32* %l111
  %l112 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 0
  store i32 0, i32* %l112
  %l113 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 1
  store i32 0, i32* %l113
  %l114 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 2
  store i32 0, i32* %l114
  %l115 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 3
  store i32 0, i32* %l115
  %l116 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 4
  store i32 0, i32* %l116
  %l117 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 5
  store i32 0, i32* %l117
  %l118 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 6
  store i32 0, i32* %l118
  %l119 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 7
  store i32 0, i32* %l119
  %l120 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 8
  store i32 0, i32* %l120
  %l121 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 9
  store i32 0, i32* %l121
  %l122 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 10
  store i32 0, i32* %l122
  %l123 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 11
  store i32 0, i32* %l123
  %l124 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 12
  store i32 0, i32* %l124
  %l125 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 13
  store i32 0, i32* %l125
  %l126 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 14
  store i32 0, i32* %l126
  %l127 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 15
  store i32 0, i32* %l127
  %l128 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 16
  store i32 0, i32* %l128
  %l129 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 17
  store i32 0, i32* %l129
  %l130 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 18
  store i32 0, i32* %l130
  %l131 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 19
  store i32 0, i32* %l131
  store i32 %l68, i32* %l67
  store i32 0, i32* %l90
  br label %b132

b132:                                             ; preds = %b133, %b49
  %l135 = load i32, i32* %l90
  %l136 = load i32, i32* %l67
  %l137 = icmp slt i32 %l135, %l136
  br i1 %l137, label %b133, label %b134

b133:                                             ; preds = %b132
  %l138 = load i32, i32* %l90
  %l139 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 %l138
  %l140 = load i32, i32* %l139
  %l141 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 %l138
  store i32 %l140, i32* %l141
  %l142 = add i32 %l138, 1
  store i32 %l142, i32* %l90
  br label %b132

b134:                                             ; preds = %b132
  store i32 0, i32* %l90
  br label %b143

b143:                                             ; preds = %b144, %b134
  %l146 = load i32, i32* %l90
  %l147 = load i32, i32* %l67
  %l148 = icmp slt i32 %l146, %l147
  br i1 %l148, label %b144, label %b145

b144:                                             ; preds = %b143
  %l149 = load i32, i32* %l90
  %l150 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 %l149
  %l151 = call i32 @getint()
  store i32 %l151, i32* %l150
  %l152 = add i32 %l149, 1
  store i32 %l152, i32* %l90
  br label %b143

b145:                                             ; preds = %b143
  %l153 = load i32, i32* %l67
  %l154 = sub i32 %l153, 1
  %l155 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 0
  call void @mqsort(i32 0, i32 %l154, i32* %l155)
  %l157 = getelementptr inbounds [27 x i8], [27 x i8]* @_str_10, i32 0, i32 0
  call void @putstr(i8* %l157)
  store i32 0, i32* %l90
  br label %b158

b158:                                             ; preds = %b159, %b145
  %l161 = load i32, i32* %l90
  %l162 = load i32, i32* %l67
  %l163 = icmp slt i32 %l161, %l162
  br i1 %l163, label %b159, label %b160

b159:                                             ; preds = %b158
  %l164 = load i32, i32* %l90
  %l165 = getelementptr [20 x i32], [20 x i32]* %l69, i32 0, i32 %l164
  %l166 = load i32, i32* %l165
  call void @putint(i32 %l166)
  %l167 = getelementptr inbounds [2 x i8], [2 x i8]* @_str_11, i32 0, i32 0
  call void @putstr(i8* %l167)
  %l168 = add i32 %l164, 1
  store i32 %l168, i32* %l90
  br label %b158

b160:                                             ; preds = %b158
  %l169 = getelementptr inbounds [4 x i8], [4 x i8]* @_str_12, i32 0, i32 0
  call void @putstr(i8* %l169)
  %l170 = getelementptr inbounds [4 x i8], [4 x i8]* @_str_13, i32 0, i32 0
  call void @putstr(i8* %l170)
  %l171 = load i32, i32* %l67
  %l172 = sub i32 %l171, 1
  %l173 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 0
  call void @mqsort2(i32 0, i32 %l172, [20 x i32]* %l173)
  %l176 = getelementptr [2 x [20 x i32]], [2 x [20 x i32]]* %l91, i32 0, i32 1, i32 0
  call void @mqsort(i32 0, i32 %l172, i32* %l176)
  %l179 = getelementptr [2 x i32], [2 x i32]* @err, i32 0, i32 0
  %l180 = load i32, i32* %l179
  %l181 = call i32 @foo3(i32 %l171, i32 %l180)
  %l183 = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* @crr, i32 0, i32 0, i32 1
  store i32 %l181, i32* %l183
  %l185 = load i32, i32* %l183
  %l186 = getelementptr [2 x i32], [2 x i32]* @err, i32 0, i32 1
  store i32 %l185, i32* %l186
  %l188 = load i32, i32* %l186
  store i32 %l188, i32* %l183
  store i32 %l181, i32* %l178
  ret i32 0
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
