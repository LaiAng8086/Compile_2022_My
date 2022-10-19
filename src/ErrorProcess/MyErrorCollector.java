package ErrorProcess;

import Frontend.OutputHandler;

import java.io.IOException;
import java.util.HashSet;

public class MyErrorCollector {
    public static HashSet<Integer> errorLines = new HashSet<>();

    public static void getIllegalSymbol(int lineNumber) throws IOException {
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " a");
        errorLines.add(lineNumber);
    }

    public static void getNameRedefination(int lineNumber) throws IOException {
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " b");
        errorLines.add(lineNumber);
    }

    public static void getUndefinedName(int lineNumber) throws IOException {
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " c");
        errorLines.add(lineNumber);
    }

    public static void getUnmatchedFuncParamsCount(int lineNumber) throws IOException //函数参数个数不匹配
    {
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " d");
        errorLines.add(lineNumber);
    }

    public static void getUnmatchedFuncParamsType(int lineNumber) throws IOException {
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " e");
        errorLines.add(lineNumber);
    }

    public static void getUnmatchedReturnForVoidFunc(int lineNumber) throws IOException { //无返回值的函数存在不匹配的return语句
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " f");
        errorLines.add(lineNumber);
    }

    public static void getLackOfReturnForNonVoidFunc(int lineNumber) throws IOException {//有返回值的函数缺少return语句
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " g");
        errorLines.add(lineNumber);
    }

    public static void getCannotChangeConst(int lineNumber) throws IOException {
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " h");
        errorLines.add(lineNumber);
    }

    public static void getLackOfSemicon(int lineNumber) throws IOException {
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " i");
        errorLines.add(lineNumber);
    }

    public static void getLackOfRParent(int lineNumber) throws IOException {
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " j");
        errorLines.add(lineNumber);
    }

    public static void getLackOfRBrack(int lineNumber) throws IOException {
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " k");
        errorLines.add(lineNumber);
    }

    public static void getUnmatchedExpCountForPrintf(int lineNumber) throws IOException {  //printf中格式字符与表达式个数不匹配
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " l");
        errorLines.add(lineNumber);
    }

    public static void getMisuseOfBreakAndContinue(int lineNumber) throws IOException { //在非循环块中使用break和continue语句
        if (errorLines.contains(lineNumber)) {
            return;
        }
        OutputHandler.outALineWithEnter(lineNumber + " m");
        errorLines.add(lineNumber);
    }
}
