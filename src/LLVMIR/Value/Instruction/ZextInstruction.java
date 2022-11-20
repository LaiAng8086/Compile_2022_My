package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

public class ZextInstruction extends AbstractInstruction {
    public ZextInstruction(String name, AbstractType type, BasicBlock ref, Value conv) {
        super("%l" + name, type, ref);
        operands.add(conv);
    }

    @Override
    public String toString() {
        return name + " = zext " + getOp1().getType() + " " + getOp1().getName()
                + " to " + type + "\n";
    }
}
