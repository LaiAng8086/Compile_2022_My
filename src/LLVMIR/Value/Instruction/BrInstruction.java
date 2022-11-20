package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

public class BrInstruction extends AbstractInstruction {
    private boolean isCondJump;
    private String jump1;
    private String jump2;

    //无条件跳转
    public BrInstruction(String name, AbstractType type, BasicBlock ref, String nnext) {
        super(name, type, ref);
        jump1 = "b" + nnext;
        isCondJump = false;
    }

    public void changeJump(String realTarget) {
        jump1 = "b" + realTarget;
    }

    public BrInstruction(String name, AbstractType type, BasicBlock ref, Value jury,
                         String trueBox, String falseBox) {
        super(name, type, ref);
        operands.add(jury);
        jump1 = "b" + trueBox;
        jump2 = "b" + falseBox;
        isCondJump = true;
    }

    public boolean isCJump() {
        return isCondJump;
    }

    public String getJump1() {
        return jump1;
    }

    public String getJump2() {
        return jump2;
    }

    @Override
    public String toString() {
        if (isCondJump) {
            return "br " + getOp1().getType() + " " + getOp1().getName() + ", label %" + jump1 + ", label %" + jump2 + "\n";
        } else {
            return "br label %" + jump1 + "\n";
        }
    }

}
