package SymbolTable;

public class MyBasicType {
    public static int INT = 1;
    public static int VOID = 2;
    private int type;

    public MyBasicType(int newn) {
        type = newn;
    }

    public int getType() {
        return type;
    }
}
