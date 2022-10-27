package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

import java.util.HashMap;

public class ICmpInstruction extends AbstractInstruction {
    private String cmpOp;

    public static HashMap<String, String> convert = new HashMap<>();

    static {
        convert.put("LSS", "slt");
        convert.put("LEQ", "sle");
        convert.put("GRE", "sgt");
        convert.put("GEQ", "sge");
        convert.put("EQL", "eq");
        convert.put("NEQ", "ne");
    }

    public ICmpInstruction(String name, AbstractType type, BasicBlock belong, Value op1, Value op2) {
        super("%l" + name, type, belong);
        operands.add(0, op1);
        operands.add(1, op2);
    }

    public String toString() {
        return name + " = icmp " + cmpOp + " " + type + " " + getOp1().getName() + ", " + getOp2().getName() + "\n";
    }
}
