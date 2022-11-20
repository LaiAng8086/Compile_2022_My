package LLVMIR.Value.Constant;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.ArrayType;

import java.util.ArrayList;

public class ConstantArray extends AbstractConstant {
    private ArrayList<AbstractConstant> elements;
    private int nums;

    public ConstantArray(String name, AbstractType ty, int num,
                         ArrayList<AbstractConstant> eles) {
        super(name, new ArrayType(ty, num), ty.getSize() * num);
        elements = new ArrayList<>();
        for (AbstractConstant v : eles) {
            elements.add(v);
        }
        nums = num;
    }

    public int getNums() {
        return nums;
    }

    public AbstractConstant getElementByIndex(int index) {
        return elements.get(index);
    }

    public String myString(boolean special) {
        StringBuilder ret = new StringBuilder();
        if (elements.get(0) instanceof ConstantInt)  //最后一维数组了
        {
            if (!special) {
                ret.append("[").append(nums).append(" x i32] ");
            }
            ret.append("[");
            for (int i = 0; i < nums; i++) {
                ret.append("i32 ").append(((ConstantInt) elements.get(i)).getVal());
                if (i < nums - 1) {
                    ret.append(", ");
                }
            }
        } else {
            ret.append("[");
            for (int i = 0; i < nums; i++) {
                ret.append(((ConstantArray) elements.get(i)).myString(false));
                if (i < nums - 1) {
                    ret.append(", ");
                }
            }
        }
        ret.append("]");
        return ret.toString();
    }
}
