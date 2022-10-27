package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

public class LoadInstruction extends AbstractInstruction {
    public LoadInstruction(String name, AbstractType ty, BasicBlock belong, Value op) {
        super("%l" + name, ty, belong);
        operands.add(op);
    }

    @Override
    public String toString() {
        return name + " = load " + type + ", " + getOp1().getType() + " " + getOp1().getName() + "\n";
    }
}
