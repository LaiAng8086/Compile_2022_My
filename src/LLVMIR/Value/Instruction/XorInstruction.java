package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

public class XorInstruction extends AbstractInstruction {
    public XorInstruction(String name, AbstractType type, BasicBlock ref,
                          Value op1, Value op2) {
        super("%l" + name, type, ref);
        operands.add(op1);
        operands.add(op2);
    }

    @Override
    public String toString() {
        return name + " = xor " + type + " " + getOp1().getName() + ", " + getOp2().getName() + "\n";
    }
}
