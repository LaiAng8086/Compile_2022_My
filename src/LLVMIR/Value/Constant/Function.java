package LLVMIR.Value.Constant;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.Argument;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Instruction.AllocaInstruction;
import LLVMIR.Value.User;
import LLVMIR.Value.Value;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class Function extends User {
    private ArrayList<Argument> args;
    private ArrayList<BasicBlock> bblocks;
    public boolean hasReturn;  //Whether there exists a return statement in bb?

    /**
     * 新建函数
     *
     * @param name 这里的名称直接由标识符转化，构造器中加上@
     * @param ty
     * @param ref
     */
    //这里暂时没有启用Function Type,type应该用的就是其返回值的类型
    public Function(String name, AbstractType ty, Value ref) {  //in fact, the ref should be module.
        super("@" + name, ty, ref);
        args = new ArrayList<>();
        bblocks = new ArrayList<>();
        hasReturn = false;
    }

    public void addAllArgs(ArrayList<Argument> newn) {
        args.addAll(newn);
    }

    public void addBasicBlock(BasicBlock newn) {
        bblocks.add(newn);
    }

    public ArrayList<Argument> getArgs() {  //返回形参情况，用于后端函数调用
        return args;
    }

    /**
     * 看在中间代码中调用的形参是第几个
     *
     * @param argName
     * @return
     */
    public int findArgIndex(String argName) {
        for (int i = 0; i < args.size(); i++) {
            if (args.get(i).getName().equals(argName)) {
                return i;
            }
        }
        return -1;
    }

    public ArrayList<BasicBlock> getBblocks() {
        return bblocks;
    }

    public void addAlloca(AllocaInstruction newn) {
        int lastIndex = bblocks.get(0).getLastAllocaIndex() + 1;
        bblocks.get(0).addInstruction(lastIndex, newn);
    }

    public BasicBlock getLastBB() {
        return bblocks.get(bblocks.size() - 1);
    }

    @Override
    public String toString() {
        StringBuilder ret = new StringBuilder();
        ret.append("define ").append(getType()).append(" ").append(getName()).append("(");
        for (int i = 0; i < args.size(); i++) {
            if (i == 0) {
                ret.append(args.get(i));
            } else {
                ret.append(", ").append(args.get(i));
            }
        }
        ret.append("){\n");
        for (int i = 0; i < bblocks.size(); i++)  //默认要求block打出标号
        {
            if (bblocks.get(i).getInstSize() == 0) {    //可能因为break和continue造成的空块，不用管
                continue;
            }
            ret.append(bblocks.get(i));
            if (i != bblocks.size() - 1) {
                ret.append("\n");
            }
        }
        ret.append("}\n");
        return ret.toString();
    }

}
