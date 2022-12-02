package LLVMIR.Value;

import LLVMIR.Type.AbstractType;

import java.util.ArrayList;
import java.util.Objects;

public class Value {
    protected ArrayList<User> users;
    protected String name;
    protected AbstractType type;
    protected Value belong;
    protected int maxUseLine;

    public Value(String name, AbstractType ty, Value ref) {
        users = new ArrayList<>();
        this.name = name;
        type = ty;
        belong = ref;
        maxUseLine = 0;
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

    public int getMaxUseLine() {
        return maxUseLine;
    }

    public void maxLineClear() {
        maxUseLine = 0;
    }

    public void updateMaxUseLine(int newn) {
        if (maxUseLine < newn) {
            maxUseLine = newn;
        }
    }

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Value)) {
            return false;
        }
        return getName().equals(((Value) o).getName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }
}
