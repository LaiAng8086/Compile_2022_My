package LLVMIR.Value.Constant;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.ArrayType;
import LLVMIR.Type.IntType;

public class ConstantString extends AbstractConstant {
    private String forout;

    public ConstantString(String name, String content) {
        super(name, new ArrayType(new IntType(8), content.length()), content.length());
        forout = content;
    }

    public String getContent() {
        return forout;
    }

    @Override
    public String toString() {
        return "c" + forout;
    }
}
