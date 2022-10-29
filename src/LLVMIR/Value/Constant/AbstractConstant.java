package LLVMIR.Value.Constant;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.IntType;
import LLVMIR.Value.User;

public abstract class AbstractConstant extends User {
    private int size;

    AbstractConstant(String name, AbstractType ty, int newsiz) { //No consider of belong ???
        super(name, ty, null);
        size = newsiz;
    }

    public int getSize() {
        return size;
    }

    public static AbstractConstant getAllZero(AbstractType t) {
        if (t instanceof IntType) {
            return new ConstantInt(0, 32);
        }
        return null;
    }
}
