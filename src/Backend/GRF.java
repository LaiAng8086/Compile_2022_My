package Backend;

import Backend.Instructions.LoadWord;
import Backend.Instructions.StoreWord;

import java.util.*;

public class GRF {
    public static HashMap<Integer, String> regName = new HashMap<>();
    public static int ZERO = 0;
    public static int AT = 1;
    public static int V0 = 2;
    public static int V1 = 3;
    public static int A0 = 4;
    public static int A1 = 5;
    public static int A2 = 6;
    public static int A3 = 7;
    public static int T0 = 8;
    public static int T1 = 9;
    public static int T2 = 10;
    public static int T3 = 11;
    public static int T4 = 12;
    public static int T5 = 13;
    public static int T6 = 14;
    public static int T7 = 15;
    public static int S0 = 16;
    public static int S1 = 17;
    public static int S2 = 18;
    public static int S3 = 19;
    public static int S4 = 20;
    public static int S5 = 21;
    public static int S6 = 22;
    public static int S7 = 23;
    public static int T8 = 24;
    public static int T9 = 25;
    public static int K0 = 26;
    public static int K1 = 27;
    public static int GP = 28;
    public static int SP = 29;
    public static int FP = 30;
    public static int RA = 31;

    static {
        regName.put(0, "zero");
        regName.put(1, "at");
        regName.put(2, "v0");
        regName.put(3, "v1");
        regName.put(4, "a0");
        regName.put(5, "a1");
        regName.put(6, "a2");
        regName.put(7, "a3");
        regName.put(8, "t0");
        regName.put(9, "t1");
        regName.put(10, "t2");
        regName.put(11, "t3");
        regName.put(12, "t4");
        regName.put(13, "t5");
        regName.put(14, "t6");
        regName.put(15, "t7");
        regName.put(16, "s0");
        regName.put(17, "s1");
        regName.put(18, "s2");
        regName.put(19, "s3");
        regName.put(20, "s4");
        regName.put(21, "s5");
        regName.put(22, "s6");
        regName.put(23, "s7");
        regName.put(24, "t8");
        regName.put(25, "t9");
        regName.put(26, "k0");
        regName.put(27, "k1");
        regName.put(28, "gp");
        regName.put(29, "sp");
        regName.put(30, "fp");
        regName.put(31, "ra");
    }

    //注意：这里管理的寄存器都是5-25号寄存器，其他的不管

    private HashMap<String, Boolean> isInReg;   //当前变量是否在寄存器中。
    private HashMap<String, Integer> identGRF;   //当前变量如果在寄存器中，则寄存器的编号
    private HashMap<String, Integer> identMemory;     //当前变量在内存中的相对地址（无论现在在不在）
    private HashMap<Integer, String> regContent;  //当前每个寄存器的变量名,如果是常数，不用记
    private LinkedList<Integer> regInUse;    //正在使用的寄存器
    private LinkedList<Integer> freeRegs;  //当前空闲的寄存器
    private MIPSProgram mips;

    public GRF(MIPSProgram dealWith) {
        isInReg = new HashMap<>();
        identGRF = new HashMap<>();
        identMemory = new HashMap<>();
        regContent = new HashMap<>();
        regInUse = new LinkedList<>();
        freeRegs = new LinkedList<>();
        mips = dealWith;
        for (int i = 5; i <= 25; i++) {
            freeRegs.addLast(i);
        }
    }

    private boolean hasFreeReg() {
        return !freeRegs.isEmpty();
    }

    public void setAddress(String name, int addr) {
        identMemory.put(name, addr);
        isInReg.put(name, false);
    }

    public void setReg(String name, int regId)   //主要为第一个参数存到$a0做铺垫
    {
        identGRF.put(name, regId);
        regContent.put(regId, name);
        isInReg.put(name, true);
    }

    public int getRegByName(String ident) {
        return identGRF.get(ident);
    }

    private void writeBackToMem(int regId) {    //事实上，应该除了常数进寄存器需要临时申请数组，其他的情况，应该在alloca阶段就申请好了。
        String wbIdent = regContent.get(regId);
        if (!identMemory.containsKey(wbIdent)) {
            int curStackSize = mips.getCurStackSize() + 4;
            mips.setCurStackSize(curStackSize);
            identMemory.put(wbIdent, curStackSize);
        }
        mips.addInstr(new StoreWord(regId, -identMemory.get(wbIdent), GRF.FP));
        isInReg.put(wbIdent, false);
    }

    public void needWriteBack(int regId) {
        if (regContent.containsKey(regId)) {
            writeBackToMem(regId);
        }
    }

    public int allocReg(String ident, boolean isConst) {  //强制分配一个寄存器，如果没有空闲的，就利用置换策略写回一个到内存，然后匀出去
        if (hasFreeReg()) {
            int ret = freeRegs.removeFirst();
            if (!isConst) {
                identGRF.put(ident, ret);
                regContent.put(ret, ident);
                isInReg.put(ident, true);
            }
            regInUse.addLast(ret);
            return ret;
        } else {
            //Write back old
            int ret = regInUse.removeFirst();
            needWriteBack(ret); //  如常数这类没有追踪其寄存器存储变量的情况，不用写回内存
            //Get new
            identGRF.put(ident, ret);
            regContent.put(ret, ident);
            isInReg.put(ident, true);
            regInUse.addLast(ret);
            return ret;
        }
    }

    public int getReg(String ident) //要么在寄存器中，直接返回，要么申请一个返回
    {
        if (isInReg.containsKey(ident)) {
            return identGRF.get(ident);
        } else {
            return allocReg(ident, false);
        }
    }

    public boolean isInRegsiter(String ident) {
        if (!isInReg.containsKey(ident)) {  //从未进入过寄存器，所以默认不在
            return false;
        }
        return isInReg.get(ident);
    }

    public int getAddress(String ident) {
        if (identMemory.containsKey(ident)) {
            return identMemory.get(ident);
        }
        return -1;
    }

    private HashMap<Integer, Integer> scene; //这里就不动保存现场前的各变量和寄存器状态了，专门记一下保存的寄存器的情况即可

    public void saveScene() {
        scene = new HashMap<>();
        int curStackSize = mips.getCurStackSize();
        //写回正在使用的寄存器
        while (!regInUse.isEmpty()) {
            curStackSize += 4;
            int regId = regInUse.removeFirst();
            mips.addInstr(new StoreWord(regId, -curStackSize, GRF.FP));
            scene.put(regId, curStackSize);
        }
        //保存$a0
        curStackSize += 4;
        mips.addInstr(new StoreWord(GRF.A0, -curStackSize, GRF.FP));
        //保存$fp
        curStackSize += 4;
        mips.addInstr(new StoreWord(GRF.FP, -curStackSize, GRF.FP));
        //保存$ra
        curStackSize += 4;
        mips.addInstr(new StoreWord(GRF.RA, -curStackSize, GRF.FP));
        //更新栈帧大小
        mips.setCurStackSize(curStackSize);
    }

    public void loadScene() {
        int curStackSize = mips.getCurStackSize();
        mips.addInstr(new LoadWord(GRF.RA, 0, GRF.SP));   //先把地址最低的三个恢复了
        mips.addInstr(new LoadWord(GRF.FP, 4, GRF.SP));
        mips.addInstr(new LoadWord(GRF.A0, 8, GRF.SP));
        //之后可以使用FP的值进行恢复
        curStackSize -= 12;
        for (Map.Entry<Integer, Integer> q : scene.entrySet()) {
            curStackSize -= 4;
            mips.addInstr(new LoadWord(q.getKey(), -q.getValue(), GRF.FP));
        }
        mips.setCurStackSize(curStackSize);
    }


}