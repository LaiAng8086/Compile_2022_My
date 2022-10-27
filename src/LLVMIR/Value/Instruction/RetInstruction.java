package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.VoidType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

public class RetInstruction extends AbstractInstruction {
    //name should be null and type = ?
    public RetInstruction(String name, AbstractType ty, BasicBlock belong, Value op) {
        super("%l" + name, ty, belong);
        operands.add(op);
    }

    @Override
    public String toString() {
        if (getOp1().getType() instanceof VoidType) {
            return "ret void\n";
        }
        return "ret " + getOp1().getType() + " " + getOp1().getName() + "\n";
    }
}
