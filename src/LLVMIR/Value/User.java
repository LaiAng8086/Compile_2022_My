package LLVMIR.Value;

import LLVMIR.Type.AbstractType;

import java.util.ArrayList;

public class User extends Value {
    protected ArrayList<Value> operands;

    public User(String name, AbstractType type, Value belong) {
        super(name, type, belong);
        operands = new ArrayList<>();
    }

    public int getNumOperands() {
        return operands.size();
    }
}
