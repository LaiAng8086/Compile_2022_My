package LLVMIR.Value;

import LLVMIR.Type.AbstractType;

import java.util.ArrayList;

public class User extends Value {
    protected ArrayList<Value> operands;

    public User(String name, AbstractType type, Value belong) {
        super(name, type, belong);
        operands = new ArrayList<>();
    }

    //一些另类的用法，倒也符合LLVM的定义，其实确实存的是用到的量

    public ArrayList<Value> getOperands() {
        return operands;
    }

    public void loadOperandsAll(ArrayList<Value> newn) {
        operands = newn;
    }

    public void addOp(Value t) {
        operands.add(t);
    }

    public int getNumOperands() {
        return operands.size();
    }
}
