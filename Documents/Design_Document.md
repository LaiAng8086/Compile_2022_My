# 编译技术设计文档

20373787 荆睿涛

## 一、参考编译器介绍

## 二、编译器总体设计

### 文件结构

`Frontend`目录：编译器前端，包括词法分析和语法分析

- `Lexer`目录：词法分析相关
  - `SrcReader`：词法分析器
  - `Token`：单词存储类，以及一些常量的定义，方便词法分析中字符串比较归类
  - `TokenOutput`：单词库类，方便语法分析部分读取单词，以及词法分析作业的输出

- `Syntax`目录：语法分析相关
  - `Parser`子目录：每种非终结符的解析子程序（在此略去各个非终结符的列举）
  - `Storage`子目录：每种非终结符解析后相关信息的存储类，便于形成语法树结构，以及语法分析作业的输出。

## 三、词法分析设计

### 编码前的设计

在解析单词的部分，我主要参考了实验指导书中的思路，使用**有限状态自动机DFA**来处理所有的关键字和标识符。该DFA的状态如下图所示：

<img src="https://laiang8086-test.oss-cn-beijing.aliyuncs.com/images/202210061700601.png" width=600>

为了简单起见，我们不妨先讨论当状态机处于注释状态的两种特殊情况，再讨论状态机处于非注释状态的正常情况。

当状态机处于`SINGLE COMMENT`状态时，相当于已经位于该行的单行注释中，故该行剩下的字符都无需读取了，直接换到下一行，而且将状态机的状态设为`DFA_INIT`。

当状态机处于`MULTI COMMENT`状态时，相当于处于多行状态中，这时先读两个字符（第二个是预读，指针不移动）看是不是`*/`，如果是则可以推出多行注释状态，回到正常状态`DFA_INIT`，如果不是就移动到下一个字符处。

然后在非注释的状态中，如果处于`DFA_INTCON`状态中，则如图连续读取数字直到非数字的字符出现；如果处于`DFA_FORMATSTRING`状态中，则连续读取字符直到`"`出现结束回到`DFA_INTCON`。如果处于`DFA_IDENT`状态中，则连续读大小写字母或下划线，直到标识符读取的结束。这里值得注意的是，该状态读取的单词并不一定均为标识符，也有可能是关键字，因此需要特判一下。

最后介绍重头戏——在`DFA_INIT`状态下的各种单词种类的划分。

首先，我们判断当前字符是不是下划线、大小写字符，如果是，则说明开始读取标识符了，移动到下一个字符并转移到`DFA_IDENT`状态。

如果不是，则开始判断当前字符是不是`[0-9]`数字，如果是，则说明开始读取数字常量了，移动到下一个字符并转移到`DFA_INTCON`状态。

如果不是，则首先判断当前的两个字符是否是**双字符运算符**，再判断当前字符是否是**单字符运算符**，最后如果还不是，则判断当前字符是不是括号、分号等其他字符，这样各种类别基本上就都考虑到了。

对于单词的存储，我记录了这个**单词的名称、类别和行号**，以方便后续语法分析和错误处理使用。

### 编码完成后的修改

为了提高效率，当读取结束一个有效的单词成分后，写了一个`skipUseless()`函数，以批量跳过多余的空白字符，避免空白字符混入状态机做太多无效判断。

## 四、语法分析设计

### 编码前的设计

#### 消除左递归

官方文档中对于以下几条文法存在左递归现象，显然是不能直接用来递归下降的，故进行了改写。

原文法

```java
乘除模表达式 MulExp → UnaryExp | MulExp ('*' | '/' | '%') UnaryExp // 1.UnaryExp 2.* 3./ 4.% 均需覆盖 
加减表达式 AddExp → MulExp | AddExp ('+' | '−') MulExp // 1.MulExp 2.+ 需覆盖 3.- 需覆盖 
关系表达式 RelExp → AddExp | RelExp ('<' | '>' | '<=' | '>=') AddExp // 1.AddExp 2.< 3.> 4.<= 5.>= 均需覆盖 
相等性表达式 EqExp → RelExp | EqExp ('==' | '!=') RelExp // 1.RelExp 2.== 3.!= 均 需覆盖 
逻辑与表达式 LAndExp → EqExp | LAndExp '&&' EqExp // 1.EqExp 2.&& 均需覆盖 
逻辑或表达式 LOrExp → LAndExp | LOrExp '||' LAndExp // 1.LAndExp 2.|| 均需覆盖
```

修改后文法

```java
MulExp -> UnaryExp {('*'|'/'|'%') UnaryExp}
AddExp -> MulExp {('+'|'-') MulExp}
RelExp -> AddExp {('<' | '>' | '<=' | '>=') AddExp}
EqExp -> RelExp {('==' | '!=') RelExp}
LAndExp -> EqExp {'&&' EqExp}
LOrExp -> LAndExp {'||' LAndExp}
```

不过由于输出的要求，拿`MulExp`为例，相当于只有最右边的一个`UnaryExp`是独立的，前面的都相当于外面套了一个`MulExp`，因此在输出时就特判一下，如果`MulExp`包含两个及以上的`UnaryExp`，那么不到最后一个`UnaryExp`时，一定要补上一个`MulExp`。

那么递归下降子程序在编写时就按照修改后的文法就行操作了。

#### 语法树的建立

基于语法树建立的初衷，我的编译器的语法分析部分，**每个**非终结符的语法树节点存储类和解析类**都是独立的**（也就是说有二三十个Java文件）。这样当然降低了类之间的耦合度，不过可能也使得相似文法的代码较为冗余。

由于每个非终结符的语法树节点均单独建类，故类的成员属性就非常清晰了——**产生式左部**对应的非终结符的存储类，包含**产生式右部**所有可能推导到的非终结符的存储类的实例对象，或者涉及到的**终结符**，**在词法分析得到的词列表中的位置**（数组下标）。

同时，考虑到**同一个左部非终结符**的**推导规则有多条**的情形，在存储类中，也专门设了一个成员属性来表明实际上是通过何种规则推导的。

举个例子，比如`PrimaryExp`

```java
PrimaryExp -> '('Exp')' | LVal | Number
```

那么当递归下降子程序完成对该语法成分的推导后，不仅要传给`PrimaryExp`存储类实例变量对应的`Exp`对象或`LVal`对象或`Number`对象，而且要到底是哪条规则（1,2,3？），这样才方便最终输出时找对应的子成分去输出，而不要输出其他没用到的成分。

#### 超前扫描

超前扫描的主要意义在于，部分产生式的几个候选式，右部的FIRST集合有所相交，也有存在部分产生式之间的右部FIRST集合存在相交，这个时候就需要多预读（不移动当前单词指针）几个单词，来充分确定到底是用哪条规则推导。

举几个例子来说明。

- `Decl`如果推导为`VarDecl`，和`FuncDef`推导的第一个成分`FuncType`，有可能都是`INTTK`，而且下一个单词还都是`Ident`。这个时候就需要再预读一个单词，如果是`(`，则按照`FuncDef`处理，否则按照`Decl`处理。

- 比较复杂的是`Stmt`语句的分类

  先列出文法的所有情况

  ```java
  Stmt -> LVal '=' Exp ';'
      |   LVal '=' 'getint' '(' ')' ';'
      |   [Exp] ';'
      |   Block
      |   'if' '(' Cond ')' Stmt ['else' Stmt]
      |   'while' '(' Cond ')' Stmt
      |   'break' ';'
      |   'continue' ';'
      |   'return' [Exp] ';'
      |   'printf' '(' FormatString {',' Exp} ')' ';'
  ```

  首先，通过第一个单词，就可以区分出if语句，while语句，break语句，continue语句，return语句，printf语句和Block语句（注意Block一定是`'{'`开头），对于这些成分直接调用相应的子程序即可。

  然后观察剩下的三个候选式，考虑如下的推导情形

  ```java
  Exp -> AddExp -> MulExp -> UnaryExp -> PrimaryExp -> LVal 
  ```

  所以，这就是为什么不能直接读一个`LVal`再看`=`的原因，因为有可能这个`Stmt`会推导为`Exp`。

  但是，与此同时我们却发现一种**贪心**的思路，那就是剩下三种情况就直接按照`Exp`去解析，原因是，如果最后证实这个`Stmt`是应当被推导为`Exp`的，那么这么做就顺利地完成了`Exp`的解析，让单词指针落到`;`处。否则的话，那就说明是前两个候选式，而这个时候如果按`Exp`去解析，也会解析出一个完整的`LVal`而单词指针落到`=`处。如此以来，只需要从`Exp`解析结果中把`LVal`掏出来就行。

  那么最后落到前两个候选式，只需要判断一下等号后面的单词是不是`getint`就能加以区分了。

如此以来，我们就通过超前扫描，在避免回溯的情况下，完成了递归下降语法分析。

### 其他设计事项

为了方便起见，没有单独设`BlockItem`类，而是直接将`Block`括号里的部分，要么推导为`Decl`，要么推导为`Stmt`。

在词法分析上迭代开发，在`TokenOutput`类里，设立一个单词指针来记录当前读取单词的数组下标，所有的递归下降分析器均可以调用公共静态函数来获取当前Token。

### 编码完成后的修改

- 方便`debug`，在部分非终结符的解析器中加入调试开关，方便输出调试信息
- 抽象了一个语法树节点的接口，一个非终结符解析器接口，以统一获取产生式右端非终结符的解析结果，和利于输出。

## 五、错误处理设计

### 编码前的设计

#### 符号表设计

由于错误处理中需要考虑诸如名字重定义、未定义、函数参数不匹配等问题，因此有必要新建变量符号表`NonFuncTable`类和函数符号表`FuncTable`类。虽然这里设计的符号表只是为了错误处理，但也充分考虑了后续语法制导翻译、代码生成的需求，尽量做到可扩展。

##### 变量符号表

根据实验指导书的提示，变量符号表的结构均为**单向树**结构——也就是类中有一个成员是指向父符号表的引用，如`NonFuncTable fa`，除了全局变量对应的根符号表外，其余变量符号表，该引用均指向该符号表作用域的最直接外层作用域所对应的符号表节点。这样以来，查询变量时，可以做到从内到外、不重不漏，符合SysY语言的定义。

一张变量符号表大体可以看做一个`HashMap<String,NonFuncTableItem>`，也就是通过标识符的名称可以快速定位到对应的表项。

`NonFuncTableItem`需要记录以下信息

- 常量/变量标记 `boolean` 用来处理错误h不能改变常量的值
- 类型，目前可能绝大多数都是`int`

##### 函数符号表

由于SysY语言并没有`局部函数`这样的文法和语义，因此有**一张全局函数符号表**就可以胜任了。

函数符号表的主体也是`HashMap<String,FuncTableItem>`，通过函数名可以快速定位到相应的表项。

`FuncTableItem`需要记录以下的信息

- 返回值类型，我将可能遇到的类型封装了一个`MyBasicType`类，存储此类的一个实例。
- 形参个数
- 形参类型，其对应存储结构为`ArrayList<MyBasicType>`和`ArrayList<Integer>`，一一对应来表示每个形参的变量类型和维数，如果不是数组，那维数定义为0

#### 符号表与语法分析的关系

基本思路就是**边进行语法分析，边建立符号表**。这样做的根据就是SysY文法的规则是变量和函数都是声明后才能使用。

除非遇到`<Block>`，否则产生式左部的递归下降子程序调用其产生式右部的递归下降子程序时，会将左部使用的符号表引用作为函数参数传入右部的子程序中。

`<Block>`是变量作用域的一个基本范围，因此对于一个`<Block>`的符号表，一方面要考虑它的父节点是哪个——这个在调用`<Block>`的构造方法时会传入，另一方面，要不要在本`<Block>`里新建一张符号表？因为考虑到函数的形参和函数体Block的变量的作用域是相同的，这种情况下应该在读形参时建表，然后Block接着用这张表。故这些不同的情况要在`<Block>`的构造方法中进行区分。

#### 错误处理类

在我的设计中，定义了一个`MyErrorProcessor`静态公共类和`MyErrorCollector`静态公共类。前者用来做一些具体可能出现错误地方的判断，后者用来记录错误的类型和行号，供输出使用。

之所以设计`MyErrorProcessor`，是想将错误处理部分代码从语法分析中尽可能抽离出来，从编码角度尽可能复用一些诸如查符号表、缺少分号、小括号、中括号这类代码，降低耦合度，同时也让语法分析部分尽量清晰。

#### 错误处理办法

##### a. 非法字符 和 l. printf格式字符与表达式个数不匹配

可以在`StmtParser`解析完`printf`对应候选式后，传入解析的`<FormatString>`和`Exp`的个数到`MyErrorProcessor`中的某个函数进行判断。

##### b. 名字重定义 和 c. 未定义名字

查`NonFuncTable`，当然可以在`NonFuncTable`中写一个成员方法以不断在符号表单向树上往父节点爬，直到查到名字。

##### d.函数参数不匹配和 e.函数参数类型不匹配

在`MyErrorProcessor`类中建一个方法，它能将函数实参转化为`FuncTableItem`（当然返回值类型忽略），然后在`FuncTableItem`中写一个`equals`方法，故先根据所调用函数的名称查表，然后拿转化的`FuncTableItem`和查表得到的`FuncTableItem`进行比较。

##### f. 无返回值的函数存在不匹配的return语句

首先，由于`return`语句在`StmtParser`中被处理，那么从`<FuncDef>`到这个`<Stmt>`会一直传这个函数是否是无返回值函数。

我们考虑一下这个文法`'return' [exp] ';'`

因为，这个错误和缺少分号的错误有可能交织在一起。

首先，如果是个void函数，

- 读完`return`后立刻就读到了`;`，那自然是正确的。
- 读完`return`后读到了不是分号，而且读到的单词不可能是`exp`作为开头单词，这时可以判断这个单词应该是下一个语句的内容，因此判定这里是缺`;`
- 读完`return`后读到的内容可以作为`exp`的开头，则按照`exp`去解析。解析完毕后的第一个单词如果是分号，判定为`f`错误，如果不是分号，则判定为缺少分号错误。为了方便起见略微牺牲效率，后一种情况再让单词指针回到`return`后的第一个单词（事先记录好），进行下一条语句的解析。

##### g. 有返回值缺`return`语句

在`<FuncDef>`的递归下降子程序中，解析完`<Block>`之后，取出`block`里的最后一条语句，去检查一下是不是`return`语句即可。

##### h.不能改变常量的值

遇到赋值语句和`getint()`的语句，读取完`<LVal>`之后，抽取出其中的标识符，查`NonFuncTable`，如果发现查到的表项中常量标记为真，则调用`MyErrorCollector`报错。

##### i. 缺少分号 j.缺少右小括号 k.缺少右中括号

在相关递归下降子程序本来应该读到分号、右小括号、右中括号的地方如果没有读到相应的单词，则调用`MyErrorCollector`报错

##### m. 在非循环块中使用`break`和`continue`语句

考虑在解析`while`语句时，必然涉及一个附带`Block`的解析。因此在调用该`Block`解析的递归下降子程序时，传入一个标记表示是否处于循环块中，并会传递到`StmtParser`中，当解析`break`或`continue`时就可以判断了。

### 编码后的修改

- 实际上处理函数实参与形参的匹配问题时，发现其实需要在变量符号表里存变量声明时的维数信息，因为我们的程序要允许如下的数组参数

  ```c++
  void foo(int a[]){
      xxxxx;
  }
  int main(){
      int b[2][3];
      foo(b[1]);
  }
  ```

  这是合法的，相当于有一个声明维数-实参维数=形参维数的判断过程，因此变量符号表必须存储声明时的维数。这一点在设计时没有想到，编码时发现了此问题。

## 六、代码生成设计

### 代码生成一

本次作业是为了让同学们尽快实现一个完整的编译器，测试程序中仅涉及**常量声明、变量声明、读语句、写语句、赋值语句，加减乘除模除等运算语句、函数定义及调用语句**。

#### 参考的LLVM IR指令

##### instructions

| llvm ir       | usage                                                        | intro                                       |
| ------------- | ------------------------------------------------------------ | ------------------------------------------- |
| add           | `<result> = add <ty> <op1>, <op2>`                           | /                                           |
| sub           | `<result> = sub <ty> <op1>, <op2>`                           | /                                           |
| mul           | `<result> = mul <ty> <op1>, <op2>`                           | /                                           |
| sdiv          | `<result> = sdiv <ty> <op1>, <op2>`                          | 有符号除法                                  |
| icmp          | `<result> = icmp <cond> <ty> <op1>, <op2>`                   | 比较指令                                    |
| and           | `<result> = and <ty> <op1>, <op2>`                           | 与                                          |
| or            | `<result> = or <ty> <op1>, <op2>`                            | 或                                          |
| call          | `<result> = call [ret attrs] <ty> <fnptrval>(<function args>)` | 函数调用                                    |
| alloca        | `<result> = alloca <type>`                                   | 分配内存                                    |
| load          | `<result> = load <ty>, <ty>* <pointer>`                      | 读取内存                                    |
| store         | `store <ty> <value>, <ty>* <pointer>`                        | 写内存                                      |
| getelementptr | `<result> = getelementptr <ty>, * {, [inrange] <ty> <idx>}*` `<result> = getelementptr inbounds <ty>, <ty>* <ptrval>{, [inrange] <ty> <idx>}*` | 计算目标元素的位置（仅计算）                |
| phi           | `<result> = phi [fast-math-flags] <ty> [ <val0>, <label0>], ...` |                                             |
| zext..to      | `<result> = zext <ty> <value> to <ty2>`                      | 类型转换，将 `ty`的`value`的type转换为`ty2` |

##### terminator insts

| llvm ir | usage                                                        | intro                          |
| ------- | ------------------------------------------------------------ | ------------------------------ |
| br      | `br i1 <cond>, label <iftrue>, label <iffalse>` `br label <dest>` | 改变控制流                     |
| ret     | `ret <type> <value>` ,`ret void`                             | 退出当前函数，并返回值（可选） |

> 注：这里的i1是个标签

参考的代码与导出

```c
int a[2][3]={{1,2,3},{4,5,6}};
int main()
{
    int b = a[0][0]+a[0][1]*a[0][2]+a[1][2]/a[1][0]%a[1][1];
    return 0;
}
```

导出的`llvm`

```c
@a = dso_local global [2 x [3 x i32]] [[3 x i32] [i32 1, i32 2, i32 3], [3 x i32] [i32 4, i32 5, i32 6]], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @a, i64 0, i64 0, i64 0), align 16
  %4 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @a, i64 0, i64 0, i64 1), align 4
  %5 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @a, i64 0, i64 0, i64 2), align 8
  %6 = mul nsw i32 %4, %5
  %7 = add nsw i32 %3, %6
  %8 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @a, i64 0, i64 1, i64 2), align 4
  %9 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @a, i64 0, i64 1, i64 0), align 4
  %10 = sdiv i32 %8, %9
  %11 = load i32, i32* getelementptr inbounds ([2 x [3 x i32]], [2 x [3 x i32]]* @a, i64 0, i64 1, i64 1), align 4
  %12 = srem i32 %10, %11
  %13 = add nsw i32 %7, %12
  store i32 %13, i32* %2, align 4
  ret i32 0
}
```

局部变量的数组赋值

一维数组

```c
int b[];
b[6]=112;
```

对应llvm ir

```c
%8 = load i32*, i32** %5, align 8
%9 = getelementptr inbounds i32, i32* %8, i64 6
store i32 112, i32* %9, align 4
```

二维数组

```c
int c[][3];
c[1][1]=1114;
```

对应llvm ir

```c
%10 = load [3 x i32]*, [3 x i32]** %6, align 8 //第一个元素的类型
%11 = getelementptr inbounds [3 x i32], [3 x i32]* %10, i64 1
%12 = getelementptr inbounds [3 x i32], [3 x i32]* %11, i64 0, i64 1  //前面这个0是占位的，没用
store i32 1114, i32* %12, align 4
```

> 而且这里的特殊点在于，它传过来的形参就是指针。

三维数组

```c
int z[2][2][3];
z[1][0][2]=10;
```

对应llvm ir

```c
%30 = getelementptr inbounds [2 x [2 x [3 x i32]]], [2 x [2 x [3 x i32]]]* %7, i64 0, i64 1
%31 = getelementptr inbounds [2 x [3 x i32]], [2 x [3 x i32]]* %30, i64 0, i64 0
%32 = getelementptr inbounds [3 x i32], [3 x i32]* %31, i64 0, i64 2
store i32 10, i32* %32, align 8
```

总结一下，每维一个，一步

最后一步一定是单个元素类型对应到值

全局变量看起来要简单一些。

全局数组的初始化

```c
const int t[3] = {1, 2, 3};
const int happy[4][5] = {{1, 2, 3, 4, 5}, {6, 7, 8, 9, 10}, {11, 12, 13, 14, 15}, {16, 17, 18, 19, 20}};
```

llvm ir

```c
@t = dso_local constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@happy = dso_local constant [4 x [5 x i32]] [[5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], [5 x i32] [i32 6, i32 7, i32 8, i32 9, i32 10], [5 x i32] [i32 11, i32 12, i32 13, i32 14, i32 15], [5 x i32] [i32 16, i32 17, i32 18, i32 19, i32 20]], align 16
```

数组的部分初始化

ex.1

```c
//c
int h1[4][5] = {{1, 2, 3, 4, 5}, {6, 7, 8, 9, 10}};
//llvm ir
constant [4 x [5 x i32]] [[5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], [5 x i32] [i32 6, i32 7, i32 8, i32 9, i32 10], [5 x i32] zeroinitializer, [5 x i32] zeroinitializer]
```

ex.2

```c
//c
int h1[4][5] = {{1, 2, 3, 4, 5},{},{}, {6, 7, 8, 9, 10}};
//llvm ir
constant [4 x [5 x i32]] [[5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], [5 x i32] zeroinitializer, [5 x i32] zeroinitializer, [5 x i32] [i32 6, i32 7, i32 8, i32 9, i32 10]]
```

ex.3

```c
//c
int tt[7] = {1, 3};
//llvm ir
constant [7 x i32] [i32 1, i32 3, i32 0, i32 0, i32 0, i32 0, i32 0]
```

关于`Pointer Type`的理解

```c
/**
     * @param pointeeType 指向的元素类型，可以为ArrayType | IntType | FPType | PointerType（最多二重指针）
     * int a[10]     -- %1 = alloca [10 * i32] 中的 %1 需要视为指向int [10]的指针，而不是指向int的指针
     * int b[10][20] -- %2 = alloca [10 * [20 * i32]] 中的 %2 需要视为int [10][20]的指针，而不是指向 int [20]的指针
     * 这一点与 C 语言不一样
 */
```

无返回值的函数，基本块最后一句为

```c
ret void
```

关于Value

> One important aspect of LLVM is that there is no distinction between an SSA variable and the operation that produces it. Because of this, any reference to the value produced by an instruction (or the value available as an incoming argument, for example) is represented as a direct pointer to the instance of the class that represents this value. Although this may take some getting used to, it simplifies the representation and makes it easier to manipulate.
>
> LLVM 的一个重要方面是 SSA 变量和产生它的操作之间没有区别。 因此，对指令产生的值（例如可用作传入参数的值）的任何引用都表示为指向表示该值的类实例的直接指针。 尽管这可能需要一些时间来适应，但它简化了表示并使其更易于操作。

关于User

> The `User` class is the common base class of all LLVM nodes that may refer to `Value`s. It exposes a list of “Operands” that are all of the `Value`s that the User is referring to. The `User` class itself is a subclass of `Value`.
>
> The operands of a `User` point directly to the LLVM `Value` that it refers to. Because LLVM uses Static Single Assignment (SSA) form, there can only be one definition referred to, allowing this direct connection. This connection provides the use-def information in LLVM.

关于GlobalVariable

> Because `GlobalValue`s are memory objects, they are always referred to by their **address**. As such, the [Type](https://www.llvm.org/docs/ProgrammersManual.html#type) of a global is always a pointer to its contents. It is important to remember this when using the `GetElementPtrInst` instruction because this pointer must be dereferenced first. For example, if you have a `GlobalVariable` (a subclass of `GlobalValue)` that is an array of 24 ints, type `[24 x i32]`, then the `GlobalVariable` is a pointer to that array. **Although the address of the first element of this array and the value of the `GlobalVariable` are the same, they have different types.** The `GlobalVariable`’s type is `[24 x i32]`. The first element’s type is `i32.` Because of this, accessing a global value requires you to dereference the pointer with `GetElementPtrInst` first, then its elements can be accessed. This is explained in the [LLVM Language Reference Manual](https://www.llvm.org/docs/LangRef.html#globalvars).

关于Function

> The `Function` class represents a single procedure in LLVM. It is actually one of the more complex classes in the LLVM hierarchy because it must keep track of a large amount of data. The `Function` class keeps track of a list of [BasicBlock](https://www.llvm.org/docs/ProgrammersManual.html#basicblock)s, a list of formal [Argument](https://www.llvm.org/docs/ProgrammersManual.html#argument)s, and a [SymbolTable](https://www.llvm.org/docs/ProgrammersManual.html#symboltable).
>
> The list of [BasicBlock](https://www.llvm.org/docs/ProgrammersManual.html#basicblock)s is the most commonly used part of `Function` objects. The list imposes an implicit ordering of the blocks in the function, which indicate how the code will be laid out by the backend. Additionally, the first [BasicBlock](https://www.llvm.org/docs/ProgrammersManual.html#basicblock) is the implicit entry node for the `Function`. It is not legal in LLVM to explicitly branch to this initial block. There are no implicit exit nodes, and in fact there may be multiple exit nodes from a single `Function`. If the [BasicBlock](https://www.llvm.org/docs/ProgrammersManual.html#basicblock) list is empty, this indicates that the `Function` is actually a function declaration: the actual body of the function hasn’t been linked in yet.
>
> In addition to a list of [BasicBlock](https://www.llvm.org/docs/ProgrammersManual.html#basicblock)s, the `Function` class also keeps track of the list of formal [Argument](https://www.llvm.org/docs/ProgrammersManual.html#argument)s that the function receives. This container manages the lifetime of the [Argument](https://www.llvm.org/docs/ProgrammersManual.html#argument) nodes, just like the [BasicBlock](https://www.llvm.org/docs/ProgrammersManual.html#basicblock) list does for the [BasicBlock](https://www.llvm.org/docs/ProgrammersManual.html#basicblock)s.
>
> The [SymbolTable](https://www.llvm.org/docs/ProgrammersManual.html#symboltable) is a very rarely used LLVM feature that is only used when you have to look up a value by name. Aside from that, the [SymbolTable](https://www.llvm.org/docs/ProgrammersManual.html#symboltable) is used internally to make sure that there are not conflicts between the names of [Instruction](https://www.llvm.org/docs/ProgrammersManual.html#instruction)s, [BasicBlock](https://www.llvm.org/docs/ProgrammersManual.html#basicblock)s, or [Argument](https://www.llvm.org/docs/ProgrammersManual.html#argument)s in the function body.
>
> Note that `Function` is a [GlobalValue](https://www.llvm.org/docs/ProgrammersManual.html#globalvalue) and therefore also a [Constant](https://www.llvm.org/docs/ProgrammersManual.html#constant). The value of the function is its address (after linking) which is guaranteed to be constant.

以一段手写的 `.ll` 代码为例

```llvm
define dso_local i32 @main(){
    %x0 = add i32 5, 0
    %x1 = add i32 5, %x0
    ret i32 %x1
}
```

其在内存中的存储形式大概是这样的

- `%x0` 是一个 `Instruction` 实例，它的 `OperandList` 里有两个值，一个是 `Constant` 的实例 `5`，另一个是 `Constant` 的实例 `0`；
- `%x1` 是一个 `Instruction` 实例，它的 `OperandList` 里有两个值，一个是 `Constant` 的实例 `5`，另一个是 `Instruction` 的实例 `%x0`；
- `ret` 是一个 `Instruction` 实例，它的 `OperandList` 里有一个值，是 `Instruction` 的实例 `%x0`。

注意对实验中可能用到的类，看看llvm官网的Detailed Description

参考编译大赛PPT

从toString里思考这些类是干啥用的。

通过实验可以发现，全局常量和局部常量在LLVM -O0时都是会定义并分配空间的，只是在存储和运算中会用具体数值代替。

## 七、代码优化设计

