declare i32 @getint()
declare void @putint(i32)
declare void @putch(i32)

@a = dso_local constant i32 5
@b = dso_local constant i32 22
@c = dso_local constant i32 13
@d = dso_local constant i32 3
@e = dso_local constant i32 -1
@va = dso_local global i32 0
@vb = dso_local global i32 0
@vc = dso_local global i32 0
@vd = dso_local global i32 0
@ve = dso_local global i32 -166
define dso_local i32 @f2() {
	%1 = alloca i32
	%2 = call i32 @getint()
	store i32 %2, i32* %1
	%3 = load i32, i32* @a
	%4 = load i32, i32* @b
	%5 = sub i32 %3, %4
	%6 = load i32, i32* %1
	%7 = sub i32 %5, %6
	ret i32 %7
}

define dso_local void @v2() {
	%1 = alloca i32
	%2 = call i32 @getint()
	store i32 %2, i32* %1
	ret void
}

define dso_local i32 @f(i32 %0, i32 %1, i32 %2) {
	%4 = alloca i32
	store i32 %0, i32* %4
	%5 = alloca i32
	store i32 %1, i32* %5
	%6 = alloca i32
	store i32 %2, i32* %6
	%7 = load i32, i32* %5
	%8 = add i32 %7, 1
	store i32 %8, i32* %4
	%9 = load i32, i32* %4
	%10 = mul i32 %9, 5
	%11 = load i32, i32* %6
	%12 = add i32 2, %11
	%13 = sdiv i32 %10, %12
	store i32 %13, i32* %6
	%14 = call i32 @f2()
	call void @v2()
	%15 = load i32, i32* %4
	%16 = load i32, i32* %6
	%17 = mul i32 %16, 5
	%18 = add i32 %15, %17
	ret i32 %18
}

define dso_local void @v(i32 %0, i32 %1) {
	%3 = alloca i32
	store i32 %0, i32* %3
	%4 = alloca i32
	store i32 %1, i32* %4
	%5 = call i32 @getint()
	store i32 %5, i32* @va
	%6 = call i32 @getint()
	store i32 %6, i32* @vb
	%7 = call i32 @getint()
	store i32 %7, i32* @vc
	%8 = call i32 @f2()
	call void @v2()
	%9 = load i32, i32* @vb
	%10 = add i32 %9, 1
	store i32 %10, i32* @va
	%11 = load i32, i32* @vc
	%12 = load i32, i32* @va
	%13 = mul i32 %11, %12
	store i32 %13, i32* @vb
	%14 = load i32, i32* @ve
	%15 = load i32, i32* @vd
	%16 = add i32 %14, %15
	store i32 %16, i32* @vc
	%17 = load i32, i32* %3
	%18 = load i32, i32* %4
	%19 = add i32 %17, %18
	%20 = load i32, i32* @va
	%21 = sub i32 %19, %20
	%22 = load i32, i32* @vb
	%23 = sub i32 %21, %22
	%24 = load i32, i32* @vc
	%25 = sub i32 %23, %24
	store i32 %25, i32* @vd
	%26 = load i32, i32* @vd
	%27 = load i32, i32* @va
	%28 = load i32, i32* @vc
	%29 = srem i32 %27, %28
	%30 = add i32 %26, %29
	store i32 %30, i32* @ve
	ret void
}



define dso_local i32 @main() {
	%1 = alloca i32
	store i32 1, i32* %1
	%2 = alloca i32
	store i32 12, i32* %2
	%3 = alloca i32
	store i32 53, i32* %3
	%4 = alloca i32
	store i32 188, i32* %4
	%5 = load i32, i32* @b
	%6 = sub i32 0, %5
	%7 = load i32, i32* @a
	%8 = sub i32 0, %7
	call void @v(i32 %6, i32 %8)
	%9 = load i32, i32* @c
	%10 = sub i32 0, %9
	%11 = load i32, i32* @d
	%12 = sub i32 0, %11
	%13 = load i32, i32* @e
	%14 = call i32 @f(i32 %10, i32 %12, i32 %13)
	%15 = load i32, i32* @va
	%16 = load i32, i32* @vb
	%17 = sub i32 0, %16
	%18 = load i32, i32* @vc
	%19 = sub i32 0, %18
	%20 = load i32, i32* @vd
	%21 = sub i32 0, %20
	%22 = call i32 @f(i32 %17, i32 %19, i32 %21)
	%23 = mul i32 %15, %22
	call void @v(i32 %14, i32 %23)
	call void @putch(i32 102)	; 'f'
	call void @putch(i32 50)	; '2'
	call void @putch(i32 58)	; ':'
	%24 = call i32 @f2()
	call void @putint(i32 %24)
	call void @putch(i32 10)	; '\n'
	call void @v2()
	call void @putch(i32 97)	; 'a'
	call void @putch(i32 61)	; '='
	%25 = load i32, i32* @a
	call void @putint(i32 %25)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 98)	; 'b'
	call void @putch(i32 61)	; '='
	%26 = load i32, i32* @b
	call void @putint(i32 %26)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 99)	; 'c'
	call void @putch(i32 61)	; '='
	%27 = load i32, i32* @c
	call void @putint(i32 %27)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 100)	; 'd'
	call void @putch(i32 61)	; '='
	%28 = load i32, i32* @d
	call void @putint(i32 %28)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 101)	; 'e'
	call void @putch(i32 61)	; '='
	%29 = load i32, i32* @e
	call void @putint(i32 %29)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 118)	; 'v'
	call void @putch(i32 97)	; 'a'
	call void @putch(i32 61)	; '='
	%30 = load i32, i32* @va
	call void @putint(i32 %30)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 118)	; 'v'
	call void @putch(i32 98)	; 'b'
	call void @putch(i32 61)	; '='
	%31 = load i32, i32* @vb
	call void @putint(i32 %31)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 118)	; 'v'
	call void @putch(i32 99)	; 'c'
	call void @putch(i32 61)	; '='
	%32 = load i32, i32* @vc
	call void @putint(i32 %32)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 118)	; 'v'
	call void @putch(i32 100)	; 'd'
	call void @putch(i32 61)	; '='
	%33 = load i32, i32* @vd
	call void @putint(i32 %33)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 118)	; 'v'
	call void @putch(i32 101)	; 'e'
	call void @putch(i32 61)	; '='
	%34 = load i32, i32* @ve
	call void @putint(i32 %34)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 99)	; 'c'
	call void @putch(i32 49)	; '1'
	call void @putch(i32 61)	; '='
	%35 = load i32, i32* %1
	call void @putint(i32 %35)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 99)	; 'c'
	call void @putch(i32 50)	; '2'
	call void @putch(i32 61)	; '='
	%36 = load i32, i32* %2
	call void @putint(i32 %36)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 99)	; 'c'
	call void @putch(i32 51)	; '3'
	call void @putch(i32 61)	; '='
	%37 = load i32, i32* %3
	call void @putint(i32 %37)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 102)	; 'f'
	call void @putch(i32 50)	; '2'
	call void @putch(i32 58)	; ':'
	%38 = call i32 @f2()
	call void @putint(i32 %38)
	call void @putch(i32 10)	; '\n'
	call void @v2()
	%39 = sub i32 0, 3
	%40 = alloca i32
	store i32 %39, i32* %40
	%41 = load i32, i32* %40
	%42 = load i32, i32* @c
	%43 = sdiv i32 %41, %42
	%44 = add i32 23, %43
	%45 = load i32, i32* %4
	%46 = sub i32 %44, %45
	%47 = alloca i32
	store i32 %46, i32* %47
	%48 = sub i32 0, 5
	%49 = mul i32 2, %48
	%50 = alloca i32
	store i32 %49, i32* %50
	%51 = load i32, i32* %50
	%52 = load i32, i32* %40
	%53 = call i32 @getint()
	store i32 %53, i32* %40
	call void @putch(i32 102)	; 'f'
	call void @putch(i32 50)	; '2'
	call void @putch(i32 58)	; ':'
	%54 = call i32 @f2()
	call void @putint(i32 %54)
	call void @putch(i32 10)	; '\n'
	call void @v2()
	%55 = call i32 @getint()
	store i32 %55, i32* %47
	%56 = call i32 @getint()
	store i32 %56, i32* %50
	%57 = load i32, i32* %40
	%58 = load i32, i32* %50
	%59 = add i32 %57, %58
	%60 = load i32, i32* %47
	%61 = sub i32 %59, %60
	%62 = alloca i32
	store i32 %61, i32* %62
	%63 = load i32, i32* %50
	%64 = load i32, i32* %47
	%65 = sub i32 0, %64
	%66 = mul i32 %65, 5
	%67 = sdiv i32 %63, %66
	%68 = alloca i32
	store i32 %67, i32* %68
	%69 = call i32 @getint()
	store i32 %69, i32* %62
	%70 = call i32 @getint()
	store i32 %70, i32* %68
	call void @putch(i32 102)	; 'f'
	call void @putch(i32 50)	; '2'
	call void @putch(i32 58)	; ':'
	%71 = call i32 @f2()
	call void @putint(i32 %71)
	call void @putch(i32 10)	; '\n'
	call void @v2()
	call void @putch(i32 97)	; 'a'
	call void @putch(i32 61)	; '='
	%72 = load i32, i32* %40
	call void @putint(i32 %72)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 98)	; 'b'
	call void @putch(i32 61)	; '='
	%73 = load i32, i32* %47
	call void @putint(i32 %73)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 99)	; 'c'
	call void @putch(i32 61)	; '='
	%74 = load i32, i32* %50
	call void @putint(i32 %74)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 114)	; 'r'
	call void @putch(i32 101)	; 'e'
	call void @putch(i32 115)	; 's'
	call void @putch(i32 32)	; ' '
	call void @putch(i32 61)	; '='
	call void @putch(i32 32)	; ' '
	%75 = load i32, i32* %50
	%76 = load i32, i32* %4
	%77 = sub i32 %75, %76
	%78 = add i32 %77, 1
	%79 = load i32, i32* %4
	%80 = add i32 %78, %79
	%81 = load i32, i32* %47
	%82 = load i32, i32* %40
	%83 = sub i32 0, %82
	%84 = add i32 6, %83
	%85 = mul i32 %81, %84
	%86 = sub i32 %80, %85
	call void @putint(i32 %86)
	call void @putch(i32 10)	; '\n'
	call void @putch(i32 116)	; 't'
	%87 = load i32, i32* %50
	%88 = add i32 2, %87
	%89 = load i32, i32* %40
	%90 = mul i32 %89, 3
	%91 = load i32, i32* %47
	%92 = sub i32 %91, 10
	%93 = call i32 @f(i32 %88, i32 %90, i32 %92)
	%94 = sub i32 0, %93
	%95 = mul i32 %94, 3
	%96 = load i32, i32* @ve
	%97 = mul i32 5, %96
	%98 = add i32 2, %97
	%99 = load i32, i32* %1
	%100 = add i32 %98, %99
	%101 = sub i32 %95, %100
	call void @putint(i32 %101)
	call void @putch(i32 121)	; 'y'
	%102 = load i32, i32* %50
	%103 = mul i32 1, 5
	%104 = load i32, i32* %2
	%105 = sub i32 %103, %104
	%106 = load i32, i32* @vd
	%107 = sdiv i32 7, %106
	%108 = sub i32 8, %107
	%109 = mul i32 0, 3
	%110 = load i32, i32* %40
	%111 = add i32 %109, %110
	%112 = call i32 @f(i32 %105, i32 %108, i32 %111)
	%113 = mul i32 %102, %112
	%114 = load i32, i32* %40
	%115 = load i32, i32* @vc
	%116 = sub i32 1, %115
	%117 = call i32 @f(i32 1, i32 %116, i32 1)
	%118 = call i32 @f(i32 1, i32 2, i32 3)
	%119 = mul i32 %117, %118
	%120 = sub i32 %114, %119
	%121 = load i32, i32* %2
	%122 = sub i32 %120, %121
	%123 = load i32, i32* %47
	%124 = call i32 @f(i32 %113, i32 %122, i32 %123)
	%125 = sub i32 0, %124
	%126 = mul i32 %125, 3
	%127 = add i32 2, 5
	%128 = sub i32 %126, %127
	call void @putint(i32 %128)
	call void @putch(i32 117)	; 'u'
	%129 = load i32, i32* %3
	%130 = sub i32 0, %129
	%131 = load i32, i32* %50
	%132 = load i32, i32* %40
	%133 = load i32, i32* %47
	%134 = call i32 @f(i32 %131, i32 %132, i32 %133)
	%135 = mul i32 %130, %134
	%136 = mul i32 %135, 3
	%137 = add i32 2, 5
	%138 = load i32, i32* %50
	%139 = load i32, i32* %1
	%140 = add i32 %138, %139
	%141 = load i32, i32* @va
	%142 = load i32, i32* %2
	%143 = sub i32 %141, %142
	%144 = call i32 @f(i32 3, i32 %140, i32 %143)
	%145 = sub i32 %137, %144
	%146 = sub i32 %136, %145
	call void @putint(i32 %146)
	%147 = load i32, i32* %50
	%148 = load i32, i32* %40
	%149 = load i32, i32* %47
	%150 = call i32 @f2()
	%151 = add i32 %149, %150
	%152 = call i32 @f(i32 %147, i32 %148, i32 %151)
	call void @v(i32 1, i32 2)
	%153 = call i32 @f2()
	%154 = sub i32 1, %153
	%155 = call i32 @f(i32 3, i32 2, i32 %154)
	%156 = sub i32 0, 1
	%157 = sub i32 0, 2
	%158 = load i32, i32* %1
	%159 = add i32 %157, %158
	%160 = sub i32 0, 3
	%161 = call i32 @f(i32 %156, i32 %159, i32 %160)
	%162 = mul i32 3, %161
	call void @v(i32 %155, i32 %162)
	ret i32 0
}
