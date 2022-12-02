package LLVMIR.Value;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.Constant.AbstractConstant;
import LLVMIR.Value.Constant.Function;
import LLVMIR.Value.Instruction.AbstractInstruction;
import LLVMIR.Value.Instruction.AllocaInstruction;

import java.util.LinkedList;

public class BasicBlock extends Value {
    LinkedList<AbstractInstruction> insList;
    private int lastAllocaIndex;

    /**
     * @param name 注意：此处的Name就是虚拟编号，没有任何前缀
     * @param type
     * @param ref
     */
    public BasicBlock(String name, AbstractType type, Value ref) {
        super("b" + name, type, ref);
        insList = new LinkedList<>();
        lastAllocaIndex = -1;  //next will add to lastIndex +1
    }

    public int getLastAllocaIndex() {
        return lastAllocaIndex;
    }

    public void addInstruction(AbstractInstruction newn) {
        insList.addLast(newn);
        if (newn instanceof AllocaInstruction) {
            lastAllocaIndex = insList.size() - 1;
        }
    }

    public void addInstruction(int index, AbstractInstruction newn) {
        insList.add(index, newn);
        if (newn instanceof AllocaInstruction) {
            lastAllocaIndex = index;
        }

    }

    public Function getBelong() {
        return (Function) belong;
    }

    public LinkedList<AbstractInstruction> getInsList() {
        return insList;
    }

    public void setInsList(LinkedList<AbstractInstruction> newn) {
        insList = newn;
    }

    public int getInstSize() {
        return insList.size();
    }

    public AbstractInstruction getLastInst() {
        return insList.getLast();
    }

    @Override
    public String toString() {
        StringBuilder ret = new StringBuilder();
        ret.append(name + ":\n");
        for (AbstractInstruction qwq : insList) {
            ret.append("  ");
            ret.append(qwq);
        }
        return ret.toString();
    }
}
