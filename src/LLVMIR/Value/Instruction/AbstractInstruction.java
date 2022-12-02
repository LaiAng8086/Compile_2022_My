package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.User;
import LLVMIR.Value.Value;

import java.util.ArrayList;
import java.util.Objects;

public abstract class AbstractInstruction extends User {

    AbstractInstruction(String name, AbstractType type, BasicBlock belong) {  //其实就是这条指令结果的类型，比如说有IntType,VoidType,PointerType
        super(name, type, belong);
    }

    public Value getOp1() {
        return operands.get(0);
    }

    public Value getOp2() {
        return operands.get(1);
    }

    public void setOp1(Value t) {
        operands.remove(0);
        operands.add(0, t);
    }

    public void setOp2(Value t) {
        operands.remove(1);
        operands.add(1, t);
    }

    public void setOperandsAll(ArrayList<Value> newn) {
        operands = newn;
    }

    //针对双寄存器指令（即便是中间代码），只要两个操作数对应相等，就算两条指令相等
    @Override
    public boolean equals(Object o) {
        if (!(o instanceof AbstractInstruction)) {
            return false;
        }
        if (getOp1() == null || ((AbstractInstruction) o).getOp1() == null ||
                getOp2() == null || ((AbstractInstruction) o).getOp2() == null) {
            return false;
        }
        return getOp1().getName().equals(((AbstractInstruction) o).getOp1().getName()) &&
                getOp2().getName().equals(((AbstractInstruction) o).getOp2().getName());
    }

    @Override
    public int hashCode() {
        int ret = 0;
        if (getOp1() != null)
            ret = Objects.hash(getOp1().getName());
        if (getOp2() != null)
            ret = Objects.hash(ret, getOp2().getName());
        return ret;
    }
}
