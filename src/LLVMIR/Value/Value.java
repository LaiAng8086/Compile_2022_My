package LLVMIR.Value;

import LLVMIR.Type.AbstractType;

import java.util.ArrayList;

public class Value {
    protected ArrayList<User> users;
    protected String name;
    protected AbstractType type;
    protected Value belong;

    public Value(String name, AbstractType ty, Value ref) {
        users = new ArrayList<>();
        this.name = name;
        type = ty;
        belong = ref;
    }

    public String getName() {
        return name;
    }

    public void setName(String newn) {
        name = newn;
    }

    public AbstractType getType() {
        return type;
    }

}
