package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.PointerType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Constant.ConstantArray;

public class AllocaInstruction extends AbstractInstruction {
    private boolean isArray;    //数组指针建议保持原样
    private ConstantArray localConst;

    public AllocaInstruction(String name, AbstractType ty, BasicBlock belong) {
        super("%l" + name, ty, belong);
        isArray = false;
        localConst = null;
    }

    public AllocaInstruction(String name, AbstractType ty, BasicBlock belong, boolean isArr) {
        super("%l" + name, ty, belong);
        isArray = true;
        localConst = null;
    }

    public void setConstInit(ConstantArray newn) {
        localConst = newn;
    }

    public ConstantArray getLocalConst() {
        return localConst;
    }

    @Override
    public String toString() {
        if (isArray) {
            return name + " = alloca " + type + "\n";
        } else {
            return name + " = alloca " + ((PointerType) type).getPointee() + "\n";
        }
    }
}
