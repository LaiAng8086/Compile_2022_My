package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.PointerType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

import java.util.ArrayList;

public class GetElementPtrInstruction extends AbstractInstruction {
    private ArrayList<Value> indexs;
    private PointerType pnt;

    /**
     * @param name
     * @param type 返回值类型，应当在传入时已经确定好是哪种指针
     * @param ref
     * @param op1 数组名
     * @param inds 访存的各维下标
     */
    public GetElementPtrInstruction(String name, AbstractType type, BasicBlock ref,
                                    Value op1, ArrayList<Value> inds) {
        super("%" + name, type, ref);
        indexs = inds;
        operands.add(op1);
    }

    @Override
    public String toString() {
        StringBuilder ret = new StringBuilder();
        ret.append(name);
        ret.append(" = getelementptr ");
        ret.append(getOp1().getType().toString());
        ret.append(", ");
        ret.append(pnt.toString());
        ret.append(" ");
        ret.append(getOp1().getName());
        for (int i = 0; i < indexs.size(); i++) {
            ret.append(", ");
            ret.append(indexs.get(i).getType());
            ret.append(" ");
            ret.append(indexs.get(i).getName());
        }
        ret.append("\n");
        return ret.toString();
    }
}
