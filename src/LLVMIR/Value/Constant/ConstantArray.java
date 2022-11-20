package LLVMIR.Value.Constant;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.ArrayType;

import java.util.ArrayList;

public class ConstantArray extends AbstractConstant {
    private ArrayList<AbstractConstant> elements;

    public ConstantArray(String name, AbstractType ty, int num,
                         ArrayList<AbstractConstant> eles) {
        super(name, new ArrayType(ty, num), ty.getSize() * num);
        elements = eles;
    }

    public AbstractConstant getElementByIndex(int index) {
        return elements.get(index);
    }
}
