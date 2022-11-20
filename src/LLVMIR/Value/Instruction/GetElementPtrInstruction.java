package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.ArrayType;
import LLVMIR.Type.PointerType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

import java.io.CharArrayReader;
import java.util.ArrayList;

public class GetElementPtrInstruction extends AbstractInstruction {
    private ArrayList<Value> indexs;
    private AbstractType rf;
    private PointerType pnt;

    /**
     * @param name
     * @param type 返回值类型，应当在传入时已经确定好是哪种指针
     * @param ref
     * @param op1  数组名
     * @param inds 访存的各维下标
     */
    public GetElementPtrInstruction(String name, AbstractType type, BasicBlock ref,
                                    Value op1, ArrayList<Value> inds) {
        super("%l" + name, type, ref);
        indexs = new ArrayList<>();
        //此处需要深拷贝
        for (Value v : inds) {
            indexs.add(v);
        }
        operands.add(op1);
        //对于指针类型，要还原。对于数组类型，要创建其指针类型
        if (op1.getType() instanceof ArrayType) {
            rf = op1.getType();
            pnt = new PointerType(op1.getType());
        } else {
            rf = ((PointerType) op1.getType()).getPointee();
            pnt = (PointerType) op1.getType();
        }
    }

    @Override
    public String toString() {
        StringBuilder ret = new StringBuilder();
        ret.append(name);
        ret.append(" = getelementptr ");
        ret.append(rf.toString());
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
