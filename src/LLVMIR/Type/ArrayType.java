package LLVMIR.Type;

import LLVMIR.Value.Constant.ConstantArray;
import LLVMIR.Value.User;
import LLVMIR.Value.Value;

import java.util.ArrayList;

public class ArrayType extends AbstractType {
    private final AbstractType elementType;
    private final int elementNum;
    private int size;
    private ConstantArray constInitVal;
    private User iniVal;
    //注：这些初始值只有源代码中的数组才有效,其他情况不填就是了（默认为空）。
    //又注：变量和常量的情况是不同的。变量里存的可能是虚拟寄存器。

    public ArrayType(AbstractType ty, int num) {
        elementType = ty;
        elementNum = num;
        size = 0;
        if (elementType != null) {
            size = elementNum * elementType.getSize();
        }
        iniVal = null;
    }

    public AbstractType getElementType() {
        return elementType;
    }

    public void setConstInitVal(ConstantArray cinit) {
        constInitVal = cinit;
    }

    public void setIniVal(User newn) {
        iniVal = newn;
    }

    public ConstantArray getConIniVal() {
        return constInitVal;
    }

    public User getIniVal() {
        return iniVal;
    }


    public int getSize() {
        return size;
    }

    @Override
    public String toString() {
        return "[" + elementNum + " x " + elementType.toString() + "]";
    }
}
