package LLVMIR.Type;

import java.util.ArrayList;

public class FunctionType extends AbstractType {
    private AbstractType retType;
    private ArrayList<AbstractType> paramsType;

    public FunctionType() {
        paramsType = new ArrayList<>();
    }

    public void loadRetType(AbstractType newn) {
        retType = newn;
    }

    public void addParamType(AbstractType newn) {
        paramsType.add(newn);
    }

    public AbstractType getReturnType() {
        return retType;
    }

    public AbstractType getParamType(int index) {
        return paramsType.get(index);
    }

    public int getSize() {
        return 0;
    }

    public int getNumParams() {
        return paramsType.size();
    }
}
