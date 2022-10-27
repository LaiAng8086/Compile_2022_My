package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.FunctionType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Constant.Function;
import LLVMIR.Value.Value;

import java.util.ArrayList;

public class CallInstruction extends AbstractInstruction {
    private String funcName;

    public CallInstruction(String name, Function f, BasicBlock belong, ArrayList<Value> args) {
        super("%l" + name, f.getType(), belong);
        funcName = f.getName();
        if (args != null) {
            for (Value i : args) {
                operands.add(i);
            }
        }
    }

    public String toString() {
        StringBuilder front = new StringBuilder();
        front.append(name).append(" = call ").append(type).append(" ").append(funcName).append("(");
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
