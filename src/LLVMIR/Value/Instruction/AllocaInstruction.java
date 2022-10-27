package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.PointerType;
import LLVMIR.Value.BasicBlock;

public class AllocaInstruction extends AbstractInstruction {
    public AllocaInstruction(String name, AbstractType ty, BasicBlock belong) {
        super("%l" + name, ty, belong);
    }

    @Override
    public String toString() {
        return name + " = alloca " + ((PointerType) type).getPointee() + "\n";
    }
}
