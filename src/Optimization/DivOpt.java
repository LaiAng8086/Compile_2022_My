package Optimization;

import Backend.Instructions.*;
import Backend.MIPSProgram;
import DataStructure.MathTools;
import DataStructure.MyPairForDivOpt;

import java.math.BigInteger;

public class DivOpt {
    public static MyPairForDivOpt getMultiplier(long d, int p)   //第一个参数实际是无符号整数
    {
        // System.out.println("DivOpt_Test_input_d:" + d);
        // System.out.println("DivOpt_Test_input_p:" + p);
        int l = (int) Math.ceil(Math.log(d) / Math.log(2));
        final BigInteger common = BigInteger.valueOf(2).pow(32 + l);
        BigInteger low = common.divide(BigInteger.valueOf(d));
        BigInteger high = common.add(BigInteger.valueOf(2).pow(32 + l - p)).divide(BigInteger.valueOf(d));
        while (low.divide(BigInteger.valueOf(2)).compareTo(high.divide(BigInteger.valueOf(2))) < 0 && l > 0) {
            low = low.divide(BigInteger.valueOf(2));
            high = high.divide(BigInteger.valueOf(2));
            l--;
        }
        // System.out.println("DivOpt_Test_high:" + high.longValue());
        // System.out.println("DivOpt_Test_l:" + l);
        return new MyPairForDivOpt(high, l);
    }

    public static void replaceDiv(MIPSProgram mips, int src1, int src2, int dst) {  //src2是为常数的除数
        boolean needNeg = false;
        long d = -1;
        if (src2 < 0) {
            needNeg = true;
            d = MathTools.getUnsignedInt(-src2);
        } else {
            d = MathTools.getUnsignedInt(src2);
        }
        if (d >= BigInteger.valueOf(2).pow(31).longValue()) {
            mips.addInstr(new SetRelation2(dst, src1, d, "sgeu"));
        } else {
            int s = 0;
            long tD = d;
            while (tD % 2 == 0) {
                s++;
                tD /= 2;
            }
            if (d == MathTools.getUnsignedInt(1 << s)) {
                if (s > 0) {
                    mips.addInstr(new Sra(dst, src1, s));
                }
            } else {
                MyPairForDivOpt choose = getMultiplier(d, 32);
                final BigInteger jury = BigInteger.valueOf(2).pow(32);
                if (choose.getA().compareTo(jury) < 0) {
                    s = 0;
                } else {
                    choose = getMultiplier(d >> s, 32 - s);
                }
                if (choose.getA().compareTo(jury) < 0) {
                    if (s > 0) {
                        mips.addInstr(new Sra(src1, src1, s));
                    }
                    mips.addInstr(new Mulu(dst, src1, choose.getA().longValue()));
                    mips.addInstr(new Mfhi(dst));
                    if (choose.getB() > 0) {
                        mips.addInstr(new Sra(dst, dst, choose.getB()));
                    }
                } else {
                    BigInteger temp = choose.getA().subtract(BigInteger.valueOf(2).pow(32));
                    mips.addInstr(new Mulu(dst, src1, temp.longValue())); //t=muluh
                    mips.addInstr(new Mfhi(dst));
                    mips.addInstr(new Subu(src1, src1, dst)); //n - t
                    mips.addInstr(new Sra(src1, src1, 1));    //(n-t)>>1
                    mips.addInstr(new Addu(dst, dst, src1));  //((n-t)>>1)+t
                    mips.addInstr(new Sra(dst, dst, choose.getB() - 1));
                }
            }
        }
        if (needNeg) {
            mips.addInstr(new Subu(dst, 0, dst));
        }
    }
}
