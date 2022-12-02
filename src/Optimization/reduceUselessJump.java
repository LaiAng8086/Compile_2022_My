package Optimization;

import Backend.Instructions.AbstractMIPSInstr;
import Backend.Instructions.Label;
import Backend.Instructions.NoCondJump;
import Backend.MIPSProgram;
import LLVMIR.Type.VoidType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Constant.ConstantInt;
import LLVMIR.Value.Instruction.AbstractInstruction;
import LLVMIR.Value.Instruction.BrInstruction;

import java.util.Iterator;
import java.util.LinkedList;

public class reduceUselessJump {
    public static void frontReduce(BasicBlock bb) {
        LinkedList<AbstractInstruction> ins = bb.getInsList();
        AbstractInstruction lasIns = ins.getLast(); //基本块只有最后一条语句可能是跳转
        if (lasIns instanceof BrInstruction) {
            BrInstruction br = (BrInstruction) lasIns;
            if (br.isCJump() && lasIns.getOp1() instanceof ConstantInt) {
                int jury = ((ConstantInt) lasIns.getOp1()).getVal();
                if (jury == 1) {
                    //注意，Br初始化的时候会先加上一个'b'所以先去掉当前有的。
                    BrInstruction newn = new BrInstruction("", new VoidType(), bb, br.getJump1().substring(1));
                    ins.removeLast();
                    ins.addLast(newn);
                } else if (jury == 0) {
                    BrInstruction newn = new BrInstruction("", new VoidType(), bb, br.getJump2().substring(1));
                    ins.removeLast();
                    ins.addLast(newn);
                }
            }
        }
    }

    public static void backReduce(LinkedList<AbstractMIPSInstr> input, MIPSProgram mips) {
        LinkedList<AbstractMIPSInstr> ret = new LinkedList<>();
        Iterator it = input.iterator();
        while (it.hasNext()) {
            AbstractMIPSInstr now = (AbstractMIPSInstr) it.next();
            if (now instanceof NoCondJump && it.hasNext()) {
                AbstractMIPSInstr nextInstr = (AbstractMIPSInstr) it.next();
                if (nextInstr instanceof Label && now.getLabel().equals(nextInstr.getLabel())) {
                    ret.add(nextInstr); //这一步无条件跳转不需要了
                } else {
                    ret.add(now);
                    ret.add(nextInstr);
                }
            } else {
                ret.add(now);
            }
        }
        mips.setText(ret);
    }
}
