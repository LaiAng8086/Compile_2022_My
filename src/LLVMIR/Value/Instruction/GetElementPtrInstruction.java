package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.ArrayType;
import LLVMIR.Type.PointerType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

import java.io.CharArrayReader;
import java.util.ArrayList;
import java.util.Objects;

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
     *             注意：为了保持统一，也为了方便统计使用者信息，数组的下标，应当占据operands从第二个到之后的位置，不应该单独列ArrayList
     */
    public GetElementPtrInstruction(String name, AbstractType type, BasicBlock ref,
                                    Value op1, ArrayList<Value> inds) {
        super("%l" + name, type, ref);
        indexs = new ArrayList<>();
        //此处需要深拷贝
        operands.add(op1);
        for (Value v : inds) {
            operands.add(v);
        }
        //对于指针类型，要还原。对于数组类型，要创建其指针类型
        if (op1.getType() instanceof ArrayType) {
            rf = op1.getType();
            pnt = new PointerType(op1.getType());
        } else {
            rf = ((PointerType) op1.getType()).getPointee();
            pnt = (PointerType) op1.getType();
        }
    }

    public AbstractType getRef() {
        return rf;
    }

    public ArrayList<Value> getIndexs() {
        ArrayList<Value> ret = new ArrayList<>();
        for (int i = 1; i < operands.size(); i++) {
            ret.add(operands.get(i));
        }
        return ret;
    }

    public int hashCode() {
        int ret = 0;
        for (Value operand : operands) {
            ret = Objects.hash(ret, operand.getName());
        }
        return ret;
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
        for (int i = 1; i < operands.size(); i++) { //注意从第二个元素开始是数组的下标
            ret.append(", ");
            ret.append(operands.get(i).getType());
            ret.append(" ");
            ret.append(operands.get(i).getName());
        }
        ret.append("\n");
        return ret.toString();
    }
}
