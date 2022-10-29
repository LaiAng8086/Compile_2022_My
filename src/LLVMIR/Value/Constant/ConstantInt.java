package LLVMIR.Value.Constant;

import LLVMIR.Type.IntType;

public class ConstantInt extends AbstractConstant {
    private int valint;

    public ConstantInt(int constval, int width) {
        super(String.valueOf(constval), new IntType(width),4);
        valint = constval;
    }

    public int getVal() {
        return valint;
    }

    @Override
    public String toString() {
        return String.valueOf(valint);
    }

}
