package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

public class StoreInstruction extends AbstractInstruction {
    //事实上，这里的Name应该是空
    public StoreInstruction(String name, AbstractType ty, BasicBlock belong, Value op1, Value op2) {
        super("%l" + name, ty, belong);
        operands.add(op1);
        operands.add(op2);
    }

    @Override
    public String toString() {
        return "store " + getOp1().getType() + " " + getOp1().getName() + ", "
                + getOp2().getType() + " " + getOp2().getName() + "\n";
    }
}
