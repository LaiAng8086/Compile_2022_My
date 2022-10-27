package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.User;
import LLVMIR.Value.Value;

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
}
