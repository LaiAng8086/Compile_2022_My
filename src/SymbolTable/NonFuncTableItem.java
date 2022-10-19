package SymbolTable;

public class NonFuncTableItem {
    private String name;
    private MyBasicType bastype;
    private boolean isConst;
    private int dimensions;


    public NonFuncTableItem(String newnName, int type, boolean isCon, int dims) {
        name = newnName;
        bastype = new MyBasicType(type);
        isConst = isCon;
        dimensions = dims;
    }

    public MyBasicType getBasicType() {
        return bastype;
    }

    public boolean getIsConst() {
        return isConst;
    }

    public int getDimensions() {
        return dimensions;
    }

}
