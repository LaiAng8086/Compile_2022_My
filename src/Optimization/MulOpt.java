package Optimization;

import Backend.Instructions.AbstractMIPSInstr;
import Backend.Instructions.Mul2;
import Backend.Instructions.Sll;
import Backend.MIPSProgram;

import java.math.BigInteger;
import java.util.Iterator;
import java.util.LinkedList;

public class MulOpt {
    public static void replaceMul2(MIPSProgram mips) {
        LinkedList<AbstractMIPSInstr> instrs = mips.getText();
        LinkedList<AbstractMIPSInstr> ret = new LinkedList<>();
        Iterator it = instrs.iterator();
        while (it.hasNext()) {
            AbstractMIPSInstr now = (AbstractMIPSInstr) it.next();
            if (now instanceof Mul2) {
                long imme = now.getImme();
                int dst = now.getDst();
                int src1 = now.getSrc1();
                int near_2pow = (int) Math.floor(Math.log(imme) / Math.log(2));
                if (imme == BigInteger.valueOf(2).pow(near_2pow).intValue()) {
                    // instrs.remove(index);
                    ret.add(new Sll(dst, src1, near_2pow));
                } else {
                    ret.add(now);
                }
            } else {
                ret.add(now);
            }
        }
        mips.setText(ret);
    }
}
