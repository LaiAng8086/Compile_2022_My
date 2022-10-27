package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

public class SRemInstruction extends AbstractInstruction {
    public SRemInstruction(String name, AbstractType type, BasicBlock belong, Value op1, Value op2) {
        super("%l" + name, type, belong);
        operands.add(0, op1);
        operands.add(1, op2);
    }

    public String toString() {
        return name + " = srem " + type + " " + getOp1().getName() + ", " + getOp2().getName() + "\n";
    }
}
