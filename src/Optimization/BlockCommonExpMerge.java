package Optimization;

import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Constant.ConstantInt;
import LLVMIR.Value.Instruction.*;
import LLVMIR.Value.Value;

import java.util.*;

public class BlockCommonExpMerge {
    private HashMap<String, String> valReplaceTable; //key应当替换为value
    private HashMap<String, Value> nameToValue;
    //为了避免麻烦，分类放置各种指令。<该指令，以及该指令的返回值(其实是一回事，只是方便存储)>
    private HashMap<AddInstruction, Value> uniAddInstrs;
    private HashMap<AndInstruction, Value> uniAndInstrs;
    private HashMap<MulInstruction, Value> uniMulInstrs;
    private HashMap<OrInstruction, Value> uniOrInstrs;
    private HashMap<SDivInstruction, Value> uniSDivInstrs;
    private HashMap<SRemInstruction, Value> uniSRemInstrs;
    private HashMap<SubInstruction, Value> uniSubInstrs;
    private HashMap<XorInstruction, Value> uniXorInstrs;
    private HashMap<ICmpInstruction, Value> uniIcmpInstrs;
    private HashMap<GetElementPtrInstruction, Value> uniGEPInstrs;
    private BasicBlock toDealWith;

    public BlockCommonExpMerge(BasicBlock input) {
        toDealWith = input;
        valReplaceTable = new HashMap<>();
        nameToValue = new HashMap<>();
        uniAddInstrs = new HashMap<>();
        uniAndInstrs = new HashMap<>();
        uniMulInstrs = new HashMap<>();
        uniOrInstrs = new HashMap<>();
        uniSDivInstrs = new HashMap<>();
        uniSRemInstrs = new HashMap<>();
        uniSubInstrs = new HashMap<>();
        uniXorInstrs = new HashMap<>();
        uniIcmpInstrs = new HashMap<>();
        uniGEPInstrs = new HashMap<>();
    }

    private Value getReplacement(Value t) {
        String ret = t.getName();
        while (valReplaceTable.containsKey(ret)) {
            ret = valReplaceTable.get(ret);
        }
        return nameToValue.getOrDefault(ret, t);
    }


    public void mergeCommon() {
        LinkedList<AbstractInstruction> ret = new LinkedList<>();
        Iterator it = toDealWith.getInsList().iterator();
        while (it.hasNext()) {
            AbstractInstruction now = (AbstractInstruction) it.next();
            ArrayList<Value> newOps = new ArrayList<>();
            ArrayList<Value> oldOps = now.getOperands();
            for (int i = 0; i < oldOps.size(); i++) {
                newOps.add(getReplacement(oldOps.get(i)));
            }
            now.setOperandsAll(newOps);
            if (now instanceof AddInstruction) {
                if (uniAddInstrs.containsKey(now)) {
                    valReplaceTable.put(now.getName(), uniAddInstrs.get(now).getName());
                } else {
                    uniAddInstrs.put((AddInstruction) now, now);
                    nameToValue.put(now.getName(), now);
                    ret.add(now);
                }
            } else if (now instanceof AndInstruction) {
                if (uniAndInstrs.containsKey(now)) {
                    valReplaceTable.put(now.getName(), uniAndInstrs.get(now).getName());
                } else {
                    uniAndInstrs.put((AndInstruction) now, now);
                    nameToValue.put(now.getName(), now);
                    ret.add(now);
                }
            } else if (now instanceof MulInstruction) {
                if (uniMulInstrs.containsKey(now)) {
                    valReplaceTable.put(now.getName(), uniMulInstrs.get(now).getName());
                } else {
                    uniMulInstrs.put((MulInstruction) now, now);
                    nameToValue.put(now.getName(), now);
                    ret.add(now);
                }
            } else if (now instanceof OrInstruction) {
                if (uniOrInstrs.containsKey(now)) {
                    valReplaceTable.put(now.getName(), uniOrInstrs.get(now).getName());
                } else {
                    uniOrInstrs.put((OrInstruction) now, now);
                    nameToValue.put(now.getName(), now);
                    ret.add(now);
                }
            } else if (now instanceof SDivInstruction) {
                if (uniSDivInstrs.containsKey(now)) {
                    valReplaceTable.put(now.getName(), uniSDivInstrs.get(now).getName());
                } else {
                    uniSDivInstrs.put((SDivInstruction) now, now);
                    nameToValue.put(now.getName(), now);
                    ret.add(now);
                }
            } else if (now instanceof SRemInstruction) {
                if (uniSRemInstrs.containsKey(now)) {
                    valReplaceTable.put(now.getName(), uniSRemInstrs.get(now).getName());
                } else {
                    uniSRemInstrs.put((SRemInstruction) now, now);
                    nameToValue.put(now.getName(), now);
                    ret.add(now);
                }
            } else if (now instanceof SubInstruction) {
                if (uniSubInstrs.containsKey(now)) {
                    valReplaceTable.put(now.getName(), uniSubInstrs.get(now).getName());
                } else {
                    uniSubInstrs.put((SubInstruction) now, now);
                    nameToValue.put(now.getName(), now);
                    ret.add(now);
                }
            } else if (now instanceof XorInstruction) {
                if (uniXorInstrs.containsKey(now)) {
                    valReplaceTable.put(now.getName(), uniXorInstrs.get(now).getName());
                } else {
                    uniXorInstrs.put((XorInstruction) now, now);
                    nameToValue.put(now.getName(), now);
                    ret.add(now);
                }
            } else if (now instanceof ICmpInstruction) {
                if (uniIcmpInstrs.containsKey(now)) {
                    valReplaceTable.put(now.getName(), uniIcmpInstrs.get(now).getName());
                } else {
                    uniIcmpInstrs.put((ICmpInstruction) now, now);
                    nameToValue.put(now.getName(), now);
                    ret.add(now);
                }
            } else if (now instanceof GetElementPtrInstruction) {
                if (uniGEPInstrs.containsKey(now)) {
                    valReplaceTable.put(now.getName(), uniGEPInstrs.get(now).getName());
                } else {
                    uniGEPInstrs.put((GetElementPtrInstruction) now, now);
                    nameToValue.put(now.getName(), now);
                    ret.add(now);
                }
            } else {
                ret.add(now);
            }
        }
        toDealWith.setInsList(ret);
    }
}
