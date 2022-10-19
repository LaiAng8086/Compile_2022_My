package SymbolTable;

import java.util.HashMap;

public class FuncTable {
    private HashMap<String, FuncTableItem> table;

    public FuncTable() {
        table = new HashMap<>();
    }

    public void insertItem(String FuncName, FuncTableItem newn) {
        table.put(FuncName, newn);
    }

    public FuncTableItem getByName(String FuncName) {
        return table.get(FuncName);
    }
}
