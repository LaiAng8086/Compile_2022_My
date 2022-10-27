package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

public class AddInstruction extends AbstractInstruction {
    public AddInstruction(String name, AbstractType type, BasicBlock belong, Value op1, Value op2) {
        super("%l" + name, type, belong);
        operands.add(0, op1);
        operands.add(1, op2);
    }

    public String toString() {
        return name + " = add " + type + " " + getOp1().getName() + ", " + getOp2().getName() + "\n";
    }
}
