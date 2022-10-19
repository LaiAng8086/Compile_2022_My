package SymbolTable;

import java.util.ArrayList;

public class FuncTableItem {
    private MyBasicType bastype;
    private int paramsCount;
    private ArrayList<MyBasicType> paramsType;
    private ArrayList<Integer> paramsDimensions;

    public FuncTableItem(int type) {
        bastype = new MyBasicType(type);
        paramsCount = 0;
        paramsType = new ArrayList<>();
        paramsDimensions = new ArrayList<>();
    }

    public void addParamType(int type) {
        paramsType.add(new MyBasicType(type));
    }

    public void addParamDimensions(int d) {
        paramsDimensions.add(d);
        paramsCount++;
    }

    public MyBasicType getBasicType() {
        return bastype;
    }


    public int getParamsCount() {
        return paramsCount;
    }

    public boolean isMatchedParamsType(FuncTableItem other) {  //assume the count is equal. true for matched.
        int length = paramsType.size();
        for (int i = 0; i < length; i++) {
            if (paramsType.get(i).getType() != other.paramsType.get(i).getType()) {
                return false;
            }
            if (!paramsDimensions.get(i).equals(other.paramsDimensions.get(i))) { //维数不同
                return false;
            }
        }
        return true;
    }
}
