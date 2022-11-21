package LLVMIR;

import LLVMIR.Value.Value;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

public class LLVMSymbolTable {
    private LinkedList<HashMap<String, Value>> symbletables;

    public LLVMSymbolTable() {
        symbletables = new LinkedList<>();
        HashMap<String, Value> global = new HashMap<>();
        symbletables.add(global);
    }

    public int getSize() {
        return symbletables.size();
    }

    public Value findGlobalName(String name) {
        if (symbletables.get(0).containsKey(name)) {
            return symbletables.get(0).get(name);
        }
        return null;
    }

    public Value findByName(String name) {
        for (int i = symbletables.size() - 1; i >= 0; i--) {
            if (symbletables.get(i).containsKey(name)) {
                return symbletables.get(i).get(name);
            }
        }
        return null;
    }

    public void addTable() {
        HashMap<String, Value> newtable = new HashMap<>();
        symbletables.add(newtable);
    }

    public void dropTable() {
        symbletables.removeLast();
    }

    public HashMap<String, Value> getCurrentTable() {
        return symbletables.getLast();
    }
}
