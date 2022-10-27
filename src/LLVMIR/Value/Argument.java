package LLVMIR.Value;

import LLVMIR.Type.AbstractType;

public class Argument extends Value {
    public Argument(String name, AbstractType type, BasicBlock ref) {
        super("%l"+name, type, ref);
    }

    @Override
    public String toString() {
        return type + " " + name;
    }
}
