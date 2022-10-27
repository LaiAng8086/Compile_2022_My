package LLVMIR.Value.Constant;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.IntType;
import LLVMIR.Value.User;

public abstract class AbstractConstant extends User {
    AbstractConstant(String name, AbstractType ty) { //No consider of belong ???
        super(name, ty, null);
    }

    public static AbstractConstant getAllZero(AbstractType t) {
        if (t instanceof IntType) {
            return new ConstantInt(0, 32);
        }
        return null;
    }
}
