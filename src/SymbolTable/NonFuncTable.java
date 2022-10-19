package SymbolTable;

import java.util.HashMap;
import java.util.Map;

public class NonFuncTable {
    private NonFuncTable fa;
    private HashMap<String, NonFuncTableItem> table;
    private boolean isGlobal;

    public NonFuncTable(NonFuncTable newnFa) {
        fa = newnFa;
        table = new HashMap<>();
        isGlobal = false;
    }

    public void setGlobal() {
        isGlobal = true;
    }


    public void insertItem(String name, NonFuncTableItem newn) {
        table.put(name, newn);
    }

    public NonFuncTableItem getLocalItem(String name) {
        if (table.containsKey(name)) {
            return table.get(name);
        }
        return null;
    }

    public NonFuncTableItem getItem(String name) {
        NonFuncTable now = this;
        //Local
        while (!now.isGlobal) {
            for (Map.Entry<String, NonFuncTableItem> t : now.table.entrySet()) {
                if (t.getKey().equals(name)) {
                    return t.getValue();
                }
            }
            now = this.fa;
        }
        //Global
        for (Map.Entry<String, NonFuncTableItem> t : adminTable.globalNonFunctable.table.entrySet()) {
            if (t.getKey().equals(name)) {
                return t.getValue();
            }
        }
        return null;
    }
}
