package LLVMIR.Value.Constant;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.ArrayType;
import LLVMIR.Type.PointerType;
import LLVMIR.Value.User;
import LLVMIR.Value.Value;

import java.util.ArrayList;

//主要特征：在编译期分配内存,而且必须被初始化，是Constant的指针
public class GlobalVariable extends User {
    private boolean isCon;
    private boolean hasInit;
    private boolean zeroinitialzer;

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
        if (ty instanceof ArrayType) {
            zeroinitialzer = true;
        }
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

    public boolean initExists() {
        return hasInit;
    }

    public Value getInitval() {
        return operands.get(0);
    }

    @Override
    public String toString() {
        StringBuilder gir = new StringBuilder();
        gir.append(name).append(" =").append(isCon ? " constant " : " global ").append(((PointerType) type).getPointee());
        gir.append(" ");
        if (hasInit) {
            if (operands.get(0) instanceof ConstantString) {
                gir.append(operands.get(0).toString());
            } else if (operands.get(0) instanceof ConstantInt) {
                gir.append(((ConstantInt) operands.get(0)).getVal());
            }
        } else {
            if (zeroinitialzer) {
                gir.append("zeroinitializer");
            }
        }
        gir.append("\n");
        return gir.toString();
    }
}
