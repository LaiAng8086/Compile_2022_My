package LLVMIR;

import LLVMIR.Type.IntType;
import LLVMIR.Type.VoidType;
import LLVMIR.Value.Constant.Function;
import LLVMIR.Value.Constant.GlobalVariable;
import LLVMIR.Value.Value;

import java.io.IOException;
import java.util.ArrayList;

public class Module extends Value { //The only purpose of extend Value, is just for a function belongs to a module.
    private ArrayList<Function> functions;
    private ArrayList<GlobalVariable> globalVariables;
    public LLVMSymbolTable symbolTable;
    private static final Module Sinleton = new Module();
    private int constStrs;
    //以下皆为函数声明，里面的参数重要吗？
    public static Function getint = new Function("getint", new IntType(32), null);
    public static Function putint = new Function("putint", new VoidType(), null);
    public static Function putch = new Function("putch", new VoidType(), null);
    public static Function putstr = new Function("putstr", new VoidType(), null);

    private Module() {
        super("Module", null, null);
        functions = new ArrayList<>();
        globalVariables = new ArrayList<>();
        symbolTable = new LLVMSymbolTable();
        constStrs = 0;
    }

    public int getStrId() {
        return constStrs++;
    }

    public ArrayList<Function> getFunctions() {
        return functions;
    }

    public ArrayList<GlobalVariable> getGlobalVariables() {
        return globalVariables;
    }

    public static Module getInstance() {
        return Sinleton;
    }

    public void addFunction(Function newn) {
        functions.add(newn);
    }

    public void addGlobalVariable(GlobalVariable newn) {
        globalVariables.add(newn);
    }

    public void output() throws IOException {
        LLVMControl.outputInit();
        LLVMControl.outString("declare i32 @getint()\n");
        LLVMControl.outString("declare void @putint(i32)\n");
        LLVMControl.outString("declare void @putch(i32)\n");
        LLVMControl.outString("declare void @putstr(i8*)\n");
        for (int i = 0; i < globalVariables.size(); i++) {
            LLVMControl.outString(globalVariables.get(i).toString());
        }
        for (int i = 0; i < functions.size(); i++) {
            LLVMControl.outString(functions.get(i).toString());
        }
        LLVMControl.endLLVMOut();
    }
}
