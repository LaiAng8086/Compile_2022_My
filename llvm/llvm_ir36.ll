declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)
declare void @putstr(i8*)
@N = constant i32 10000
define i32 @long_array(i32 %l1){
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

b7:
  %l10 = load i32, i32* %l6
  %l11 = icmp slt i32 %l10, 10000
  br i1 %l11, label %b8, label %b9

b8:
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

b9:
  store i32 0, i32* %l6
  br label %b20

b20:
  %l23 = load i32, i32* %l6
  %l24 = icmp slt i32 %l23, 10000
  br i1 %l24, label %b21, label %b22

b21:
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

b22:
  store i32 0, i32* %l6
  br label %b37

b37:
  %l40 = load i32, i32* %l6
  %l41 = icmp slt i32 %l40, 10000
  br i1 %l41, label %b38, label %b39

b38:
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

b39:
  store i32 0, i32* %l58
  store i32 0, i32* %l6
  br label %b59

b59:
  %l62 = load i32, i32* %l6
  %l63 = icmp slt i32 %l62, 10000
  br i1 %l63, label %b60, label %b61

b60:
  %l67 = load i32, i32* %l6
  %l68 = icmp slt i32 %l67, 10
  br i1 %l68, label %b64, label %b66

b64:
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

b66:
  %l79 = load i32, i32* %l6
  %l80 = icmp slt i32 %l79, 20
  br i1 %l80, label %b76, label %b78

b76:
  store i32 5000, i32* %l81
  br label %b82

b82:
  %l85 = load i32, i32* %l81
  %l86 = icmp slt i32 %l85, 10000
  br i1 %l86, label %b83, label %b84

b83:
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

b84:
  %l98 = load i32, i32* %l58
  call void @putint(i32 %l98)
  br label %b77

b78:
  %l102 = load i32, i32* %l6
  %l103 = icmp slt i32 %l102, 30
  br i1 %l103, label %b99, label %b101

b99:
  store i32 5000, i32* %l104
  br label %b105

b105:
  %l108 = load i32, i32* %l104
  %l109 = icmp slt i32 %l108, 10000
  br i1 %l109, label %b106, label %b107

b106:
  %l113 = load i32, i32* %l104
  %l114 = icmp sgt i32 %l113, 2233
  br i1 %l114, label %b110, label %b112

b110:
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

b112:
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

b111:
  br label %b105

b107:
  %l138 = load i32, i32* %l58
  call void @putint(i32 %l138)
  br label %b100

b101:
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

b100:
  br label %b77

b77:
  br label %b65

b65:
  %l147 = load i32, i32* %l6
  %l148 = add i32 %l147, 1
  store i32 %l148, i32* %l6
  br label %b59

b61:
  %l149 = load i32, i32* %l58
  ret i32 %l149
}
define i32 @main(){
b0:
  %l1 = call i32 @long_array(i32 9)
  call void @putint(i32 %l1)
  %l2 = call i32 @long_array(i32 9)
  ret i32 %l2
}
