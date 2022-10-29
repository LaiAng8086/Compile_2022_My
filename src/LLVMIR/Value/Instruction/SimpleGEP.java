package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.PointerType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

public class SimpleGEP extends AbstractInstruction {
    private PointerType needPtr;
    //Temporarily for putstr

    /**
     * @param name   使用原始标识符即可
     * @param belong
     * @param op     需要打印的字符串指针
     */
    public SimpleGEP(String name, AbstractType type, BasicBlock belong, Value op) {
        super("%l" + name, type, belong);
        operands.add(op);
    }

    @Override
    public String toString() {
        return name + " = getelementptr inbounds " + ((PointerType) getOp1().getType()).getPointee() +
                ", " + getOp1().getType() + " " + getOp1().getName() + ", i32 0, i32 0\n";
    }

}
