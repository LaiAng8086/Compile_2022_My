package SymbolTable;

public class adminTable {
    public static NonFuncTable globalNonFunctable = new NonFuncTable(null);
    public static FuncTable globalFunctable = new FuncTable();

    static {
        globalNonFunctable.setGlobal();
    }
}
