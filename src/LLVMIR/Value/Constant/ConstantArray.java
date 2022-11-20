package LLVMIR.Value.Constant;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.ArrayType;
import LLVMIR.Value.Value;

import java.util.ArrayList;

public class ConstantArray extends AbstractConstant {
    public ConstantArray(String name, AbstractType ty, int num) {
        super(name, new ArrayType(ty, num), ty.getSize() * num);
    }
}
