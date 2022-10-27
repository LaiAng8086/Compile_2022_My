package LLVMIR.Value.Constant;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.PointerType;
import LLVMIR.Value.User;
import LLVMIR.Value.Value;

//主要特征：在编译期分配内存,而且必须被初始化，是Constant的指针
public class GlobalVariable extends User {
    private boolean isCon;
    private boolean hasInit;

    /**
     * 新建全局变量定义
     *
     * @param name   直接从标识符来，构造器中加@
     * @param ty     该全局变量定义对象的类型
     * @param belong 所属Module
     */
    public GlobalVariable(String name, AbstractType ty, Value belong) {
        super("@" + name, new PointerType(ty), belong);
        operands.add(AbstractConstant.getAllZero(ty));
        isCon = false;
        hasInit = false;
    }

    public GlobalVariable(String name, AbstractType ty, Value belong, AbstractConstant initVal) {
        super("@" + name, new PointerType(ty), belong);
        operands.add(initVal);
        isCon = false;
        hasInit = true;
    }

    public void setConst() {
        isCon = true;
    }

    @Override
    public String toString() {
        return name + " =" + (isCon ? " constant " : " global ") + ((PointerType) type).getPointee()
                + " " + operands.get(0).getName() + "\n";
    }
}
