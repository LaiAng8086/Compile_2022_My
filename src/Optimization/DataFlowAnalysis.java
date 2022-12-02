package Optimization;

import LLVMIR.Type.VoidType;
import LLVMIR.Value.Argument;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Constant.ConstantInt;
import LLVMIR.Value.Constant.GlobalVariable;
import LLVMIR.Value.Instruction.*;
import LLVMIR.Value.Value;

import java.math.BigInteger;
import java.util.*;

public class DataFlowAnalysis {
    private BasicBlock toDealwith;

    public DataFlowAnalysis(BasicBlock input) {
        toDealwith = input;
    }

    public void analyzeDataFlow() {
        LinkedList<AbstractInstruction> ins = toDealwith.getInsList();
        ListIterator it = ins.listIterator(ins.size());
        int index = ins.size() - 1;
        while (it.hasPrevious()) {
            AbstractInstruction now = (AbstractInstruction) it.previous();
            now.setUseIndex(index);
            for (Value q : now.getOperands()) {
                q.updateMaxUseLine(index);
            }
            index--;
        }
    }

    //删除只定义，未使用的指令
    public void deleteDeadCode() {
        LinkedList<AbstractInstruction> ins = toDealwith.getInsList();
        LinkedList<AbstractInstruction> ret = new LinkedList<>();
        Iterator it = ins.iterator();
        while (it.hasNext()) {
            AbstractInstruction now = (AbstractInstruction) it.next();
            if (now.getMaxUseLine() > 0) {  //只定义不使用的会被删掉
                ret.add(now);
            } else if (now instanceof StoreInstruction || now instanceof RetInstruction
                    || now instanceof BrInstruction || now instanceof AllocaInstruction
                    || now instanceof CallInstruction) {
                ret.add(now);
            }   //call也是不能删的，尽管返回值可能没用，但是里面可能对全局或数组有副作用
        }
        toDealwith.setInsList(ret);
    }

    //复制传播与常量传播，旨在在同一个基本块中，对同一个地址，中间代码仅load和store一次

    private HashMap<String, Value> addrToVirReg;
    private HashMap<String, String> replacement;
    private HashMap<String, Value> nameToVal;
    private HashMap<String, StoreInstruction> lastStore;

    private Value getReplaced(Value t) {
        if (t instanceof ConstantInt) {     //如果本来是常数，则不用替换，以免出错
            return t;
        }
        String now = t.getName();
        while (replacement.containsKey(now)) {
            now = replacement.get(now);
        }
        return nameToVal.getOrDefault(now, t);
    }

    public void copyForward() {
        LinkedList<AbstractInstruction> ins = toDealwith.getInsList();
        LinkedList<AbstractInstruction> ret = new LinkedList<>();
        addrToVirReg = new HashMap<>();
        replacement = new HashMap<>();
        nameToVal = new HashMap<>();
        lastStore = new HashMap<>();
        Iterator it = ins.iterator();
        while (it.hasNext()) {
            AbstractInstruction now = (AbstractInstruction) it.next();
            //更新替换
            ArrayList<Value> oldOps = now.getOperands();
            ArrayList<Value> newOps = new ArrayList<>();
            for (Value q : oldOps) {
                newOps.add(getReplaced(q));
            }
            now.setOperandsAll(newOps);
            //更新替换结束
            //对于数组放弃“缓存”优化。原因是下标是变量的情况下，可能追踪不到某些存储变化
            if (now instanceof StoreInstruction) {
                StoreInstruction ss = (StoreInstruction) now;
                if (!(ss.getOp2() instanceof GetElementPtrInstruction)) {
                    lastStore.put(ss.getOp2().getName(), ss);    //保存每个地址的最后一次存储
                    //更新每个地址的Value内容
                    addrToVirReg.put(ss.getOp2().getName(), ss.getOp1());
                    //如果保存全局变量，则需要登记
                    if (ss.getOp2() instanceof GlobalVariable) {
                        nameToVal.put(ss.getOp2().getName(), ss.getOp2());
                    }
                } else {    //数组情形必须存储
                    ret.add(now);
                }
                if (ss.getOp1() instanceof Argument || ss.getOp1() instanceof ConstantInt) {
                    nameToVal.put(ss.getOp1().getName(), ss.getOp1());  //形参在基本块外，这里可能接触不到,常数也要存一下
                }
            } else if (now instanceof LoadInstruction) {
                if (addrToVirReg.containsKey(now.getOp1().getName()))    //不用加载，直接替换
                {
                    Value temp = addrToVirReg.get(now.getOp1().getName());
                    replacement.put(now.getName(), temp.getName());
                } else {
                    ret.add(now);
                    addrToVirReg.put(now.getOp1().getName(), now);
                    nameToVal.put(now.getName(), now);
                    if (now.getOp1() instanceof GlobalVariable) {   //全局变量需要登记
                        nameToVal.put(now.getOp1().getName(), now.getOp1());
                    }
                }
            } else if (now instanceof CallInstruction) {
                //发生函数调用时，全局变量和数组的store全部需要立刻，因为在函数中可能发生修改。
                HashMap<String, StoreInstruction> newn = new HashMap<>();
                for (Map.Entry<String, StoreInstruction> qwq : lastStore.entrySet()) {
                    StoreInstruction temp = qwq.getValue();
                    if (temp.getOp2() instanceof GlobalVariable || temp.getOp2() instanceof GetElementPtrInstruction) {
                        ret.add(temp);
                        addrToVirReg.remove(temp.getOp2().getName());   //该地址失效，应当重新读取
                    } else {
                        newn.put(qwq.getKey(), qwq.getValue());
                    }
                }
                lastStore = newn;
                //此外，目前认为“缓存”的全局变量和数组也全部失效，在函数调用结束后的下一次访问需要再load，注意！查的是地址！
                HashMap<String, Value> newn2 = new HashMap<>();
                for (Map.Entry<String, Value> qwq : addrToVirReg.entrySet()) {
                    Value temp = nameToVal.get(qwq.getKey());
                    if (!(temp instanceof GlobalVariable ||
                            temp instanceof GetElementPtrInstruction)) {
                        newn2.put(qwq.getKey(), qwq.getValue());
                    }
                }
                addrToVirReg = newn2;
                ret.add(now);
                //若函数有返回值，别忘了存
                if (now.getName() != null && !(now.getName().equals("%l") || now.getName().equals(""))) {
                    nameToVal.put(now.getName(), now);
                }
            } else {
                ret.add(now);
                if (now.getName() != null && !(now.getName().equals("%l") || now.getName().equals(""))) {
                    nameToVal.put(now.getName(), now);
                }
            }
        }
        int lastIndex = ret.size() - 1;
        //插入跳转或返回之前
        for (Map.Entry<String, StoreInstruction> qwq : lastStore.entrySet()) {
            ret.add(lastIndex, qwq.getValue());
            lastIndex++;
        }
        toDealwith.setInsList(ret);
    }

    public void clearPreviousAnalysis() {
        LinkedList<AbstractInstruction> ins = toDealwith.getInsList();
        Iterator it = ins.iterator();
        while (it.hasNext()) {
            AbstractInstruction now = (AbstractInstruction) it.next();
            now.maxLineClear();
            for (Value t : now.getOperands()) {
                t.maxLineClear();
            }
        }
    }

    private HashMap<String, ConstantInt> identToConst;

    public Value replaceConst(Value t) {
        if (t instanceof ConstantInt) {     //如果本来是常数，则不用替换，以免出错
            return t;
        }
        if (identToConst.containsKey(t.getName())) {
            return identToConst.get(t.getName());
        } else {
            return t;
        }
    }

    public void constForward() {
        LinkedList<AbstractInstruction> ins = toDealwith.getInsList();
        LinkedList<AbstractInstruction> ret = new LinkedList<>();
        identToConst = new HashMap<>();
        Iterator it = ins.iterator();
        while (it.hasNext()) {
            AbstractInstruction now = (AbstractInstruction) it.next();
            //更新替换
            ArrayList<Value> oldOps = now.getOperands();
            ArrayList<Value> newOps = new ArrayList<>();
            for (Value q : oldOps) {
                newOps.add(replaceConst(q));
            }
            now.setOperandsAll(newOps);
            if (now instanceof AddInstruction) {
                if (now.getOp1() instanceof ConstantInt && now.getOp2() instanceof ConstantInt) {
                    int val1 = new BigInteger(now.getOp1().getName()).intValue();
                    int val2 = new BigInteger(now.getOp2().getName()).intValue();
                    ConstantInt rep = new ConstantInt(val1 + val2, 32);
                    identToConst.put(now.getName(), rep);
                } else {
                    ret.add(now);
                }
            } else if (now instanceof SubInstruction) {
                if (now.getOp1() instanceof ConstantInt && now.getOp2() instanceof ConstantInt) {
                    int val1 = new BigInteger(now.getOp1().getName()).intValue();
                    int val2 = new BigInteger(now.getOp2().getName()).intValue();
                    ConstantInt rep = new ConstantInt(val1 - val2, 32);
                    identToConst.put(now.getName(), rep);
                } else {
                    ret.add(now);
                }
            } else if (now instanceof MulInstruction) {
                if (now.getOp1() instanceof ConstantInt && now.getOp2() instanceof ConstantInt) {
                    int val1 = new BigInteger(now.getOp1().getName()).intValue();
                    int val2 = new BigInteger(now.getOp2().getName()).intValue();
                    ConstantInt rep = new ConstantInt(val1 * val2, 32);
                    identToConst.put(now.getName(), rep);
                } else {
                    ret.add(now);
                }
            } else if (now instanceof SDivInstruction) {
                if (now.getOp1() instanceof ConstantInt && now.getOp2() instanceof ConstantInt) {
                    int val1 = new BigInteger(now.getOp1().getName()).intValue();
                    int val2 = new BigInteger(now.getOp2().getName()).intValue();
                    ConstantInt rep = new ConstantInt(val1 / val2, 32);
                    identToConst.put(now.getName(), rep);
                } else {
                    ret.add(now);
                }
            } else if (now instanceof SRemInstruction) {
                if (now.getOp1() instanceof ConstantInt && now.getOp2() instanceof ConstantInt) {
                    int val1 = new BigInteger(now.getOp1().getName()).intValue();
                    int val2 = new BigInteger(now.getOp2().getName()).intValue();
                    ConstantInt rep = new ConstantInt(val1 % val2, 32);
                    identToConst.put(now.getName(), rep);
                } else {
                    ret.add(now);
                }
            } else if (now instanceof XorInstruction) {
                if (now.getOp1() instanceof ConstantInt && now.getOp2() instanceof ConstantInt) {
                    int val1 = new BigInteger(now.getOp1().getName()).intValue();
                    int val2 = new BigInteger(now.getOp2().getName()).intValue();
                    ConstantInt rep = new ConstantInt(val1 ^ val2, 32);
                    identToConst.put(now.getName(), rep);
                } else {
                    ret.add(now);
                }
            } else if (now instanceof ICmpInstruction) {
                if (now.getOp1() instanceof ConstantInt && now.getOp2() instanceof ConstantInt) {
                    int val1 = new BigInteger(now.getOp1().getName()).intValue();
                    int val2 = new BigInteger(now.getOp2().getName()).intValue();
                    ConstantInt rep = null;
                    if (((ICmpInstruction) now).getCmpOp().equals("slt")) {
                        rep = val1 < val2 ? new ConstantInt(1, 1) : new ConstantInt(0, 1);
                    } else if (((ICmpInstruction) now).getCmpOp().equals("sle")) {
                        rep = val1 <= val2 ? new ConstantInt(1, 1) : new ConstantInt(0, 1);
                    } else if (((ICmpInstruction) now).getCmpOp().equals("sgt")) {
                        rep = val1 > val2 ? new ConstantInt(1, 1) : new ConstantInt(0, 1);
                    } else if (((ICmpInstruction) now).getCmpOp().equals("sge")) {
                        rep = val1 >= val2 ? new ConstantInt(1, 1) : new ConstantInt(0, 1);
                    } else if (((ICmpInstruction) now).getCmpOp().equals("eq")) {
                        rep = val1 == val2 ? new ConstantInt(1, 1) : new ConstantInt(0, 1);
                    } else if (((ICmpInstruction) now).getCmpOp().equals("ne")) {
                        rep = val1 != val2 ? new ConstantInt(1, 1) : new ConstantInt(0, 1);
                    }
                    identToConst.put(now.getName(), rep);
                } else {
                    ret.add(now);
                }
            } else if (now instanceof ZextInstruction) {
                if (now.getOp1().getType().toString().equals(now.getType().toString())
                        && now.getOp1() instanceof ConstantInt) {
                    identToConst.put(now.getName(), (ConstantInt) now.getOp1());
                } else {
                    ret.add(now);
                }
            } else {
                ret.add(now);
            }
        }
        toDealwith.setInsList(ret);
    }
}
