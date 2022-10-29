package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.FunctionType;
import LLVMIR.Type.VoidType;
import LLVMIR.Value.Argument;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Constant.Function;
import LLVMIR.Value.Value;

import java.util.ArrayList;

public class CallInstruction extends AbstractInstruction {
    private String funcName;
    private Function callee;

    public CallInstruction(String name, Function f, BasicBlock belong, ArrayList<Value> args) {
        super("%l" + name, f.getType(), belong);
        funcName = f.getName();
        callee = f;
        if (args != null) { //no params
            for (Value i : args) {
                operands.add(i);
            }
        }
    }

    public ArrayList<Value> getFuncRArgs() {
        return operands;
    }

    public String getFuncName() {    //有没有可能用户自定义函数和llvm的IO函数重名？
        return funcName;
    }

    public String toString() {
        StringBuilder front = new StringBuilder();
        if (type instanceof VoidType) {
            front.append("call void ").append(funcName).append("(");
        } else {
            front.append(name).append(" = call ").append(type).append(" ").append(funcName).append("(");
        }
        for (int i = 0; i < operands.size(); i++) {
            if (i == 0) {
                front.append(operands.get(i).getType()).append(" ").append(operands.get(i).getName());
            } else {
                front.append(", ").append(operands.get(i).getType()).append(" ").append(operands.get(i).getName());
            }
        }
        front.append(")\n");
        return front.toString();
    }
}
