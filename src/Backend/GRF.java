package Backend;

import Backend.Instructions.LoadWord;
import Backend.Instructions.StoreWord;
import LLVMIR.Value.Instruction.LoadInstruction;
import LLVMIR.Value.Value;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

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
    private HashMap<String, String> zextTranslate;
    private LinkedList<Integer> regInUse_s;     //供load后的局部变量使用寄存器，正在使用者
    private LinkedList<Integer> freeRegs_s;     //供load后的局部变量使用寄存器，空闲者
    private LinkedList<Integer> regInUse_t;    //供运算用临时变量使用寄存器，正在使用者
    private LinkedList<Integer> freeRegs_t;  //供运算用临时变量使用寄存器，空闲者
    private MIPSProgram mips;
    private HashMap<String, Integer> identMaxLine;  //用于写回判断，基本块内最大使用行

    public static int LOCAL = 0;
    public static int TEMP = 1;

    //打算采用折中方案，局部变量采用相对当前函数栈帧的相对地址，数组地址保存绝对地址

    public GRF(MIPSProgram dealWith) {
        isInReg = new HashMap<>();
        identGRF = new HashMap<>();
        identMemory = new HashMap<>();
        regContent = new HashMap<>();
        regInUse_s = new LinkedList<>();
        freeRegs_s = new LinkedList<>();
        regInUse_t = new LinkedList<>();
        freeRegs_t = new LinkedList<>();
        mips = dealWith;
        for (int i = 5; i <= 18; i++) {
            freeRegs_t.add(i);
        }
        freeRegs_t.add(T8);
        freeRegs_t.add(T9);
        for (int i = 19; i <= 23; i++) {
            freeRegs_s.add(i);
        }
        zextTranslate = new HashMap<>();    //为了兼容llvm的麻烦事
        identMaxLine = new HashMap<>();
    }

    public void addIdentLineInfo(String ident, int mL) {
        identMaxLine.put(ident, mL);
    }

    public void addZext(String old, String newn) {     //对转换后值的访问，重定向为转换前。
        zextTranslate.put(newn, old);
    }

    private String checkZext(String input) {    //直到找到最初的虚拟寄存器号
        String attempt = input;
        while (zextTranslate.containsKey(attempt)) {
            attempt = zextTranslate.get(attempt);
        }
        return attempt;
    }

    //约定：0代表s类，1代表t类

    private boolean hasFreeReg(int type) {
        if (type == 0) {
            return !freeRegs_s.isEmpty();
        } else {
            return !freeRegs_t.isEmpty();
        }
    }

    //重新设计，如果设定地址，则放弃寄存器，在形参和alloca中使用。
    public void setAddress(String name, int addr) {
        String rname = checkZext(name);
        identMemory.put(rname, addr);
        isInReg.remove(rname);
    }

    public void setReg(String name, int regId)   //主要为第一个参数存到$a0做铺垫，当然还有的用途是给gep用
    {
        String rname = checkZext(name);
        identGRF.put(rname, regId);
        regContent.put(regId, rname);
        isInReg.put(rname, true);
    }

    public void freeAReg(int regId, int type) {
        String nowIdent = regContent.get(regId);
        identGRF.remove(nowIdent);
        isInReg.remove(nowIdent);
        regContent.remove(regId);
        if (type == 0) {
            regInUse_s.remove((Integer) regId);
            freeRegs_s.add(regId);
        } else {
            regInUse_t.remove((Integer) regId);
            freeRegs_t.add(regId);
        }
    }

    public int getRegByName(String ident) {
        return identGRF.get(checkZext(ident));
    }

    private void writeBackToMem(int regId) {    //事实上，应该除了常数进寄存器需要临时申请数组，其他的情况，应该在alloca阶段就申请好了。
        String wbIdent = regContent.get(regId);
        if (identMaxLine.get(wbIdent) >= mips.getNowLine()) {    //如果本基本块后面没有用到，则不用保存，注意等号还是要保留的
            if (!identMemory.containsKey(wbIdent)) {
                int curStackSize = mips.getCurStackSize() + 4;
                mips.setCurStackSize(curStackSize);
                identMemory.put(wbIdent, curStackSize);
            }
            mips.addInstr(new StoreWord(regId, -identMemory.get(wbIdent), GRF.FP));
        }
        identGRF.remove(wbIdent);   //!大bug
        isInReg.remove(wbIdent);
        regContent.remove(regId);   //同样是大bug，这样就会导致如果下一次load一个常数，再写回就要出事。
    }

    public void needWriteBack(int regId) {
        if (regContent.containsKey(regId)) {
            writeBackToMem(regId);
        }
    }

    //强制分配一个寄存器，如果没有空闲的，就利用置换策略写回一个到内存，然后匀出去
    //注意：有的时候isConst为真并不代表此时寄存器是常数，只是说此时物理寄存器不对应llvm中的虚拟寄存器，故无需写回。
    public int allocReg(String ident, int type, boolean isConst) {
        String rident = checkZext(ident);
        if (hasFreeReg(type)) {
            int ret = type == 0 ? freeRegs_s.removeFirst() : freeRegs_t.removeFirst();
            if (!isConst) {
                identGRF.put(rident, ret);
                regContent.put(ret, rident);
                isInReg.put(rident, true);
            }
            if (type == 0) {
                regInUse_s.addLast(ret);
            } else {
                regInUse_t.addLast(ret);
            }
            return ret;
        } else {
            //Write back old
            int ret = type == 0 ? regInUse_s.removeFirst() : regInUse_t.removeFirst();
            needWriteBack(ret); //  如常数这类没有追踪其寄存器存储变量的情况，不用写回内存
            //Get new
            if (!isConst) {
                identGRF.put(rident, ret);
                regContent.put(ret, rident);
                isInReg.put(rident, true);
            }
            if (type == 0) {
                regInUse_s.addLast(ret);
            } else {
                regInUse_t.addLast(ret);
            }
            return ret;
        }
    }

    public int getReg(String ident, int type) //要么在寄存器中，直接返回，要么申请一个返回（注意：此版本不加载内容）
    {
        String rident = checkZext(ident);
        if (isInReg.containsKey(rident) && isInReg.get(rident)) {
            return identGRF.get(rident);
        } else {
            return allocReg(rident, type, false);
        }
    }

    public int getReg(Value t) {
        if (t instanceof LoadInstruction) {
            return getReg(t.getName(), LOCAL);
        } else {
            return getReg(t.getName(), TEMP);
        }
    }

    public int getRegMayLoad(String ident, int type) {    //按照llvm应该在寄存器中，但是由于分配策略被置换，现在申请一个加载、返回。
        String rident = checkZext(ident);
        if (isInReg.containsKey(rident) && isInReg.get(rident)) {
            return identGRF.get(rident);
        } else {
            int retId = allocReg(rident, type, false);
            mips.addInstr(new LoadWord(retId, -identMemory.get(rident), GRF.FP));
            return retId;
        }
    }

    public int getRegMayLoad(Value t) {
        if (t instanceof LoadInstruction) {
            return getRegMayLoad(t.getName(), LOCAL);
        } else {
            return getRegMayLoad(t.getName(), TEMP);
        }
    }

    public boolean isInRegsiter(String ident) {
        String rident = checkZext(ident);
        if (!isInReg.containsKey(rident)) {  //从未进入过寄存器，所以默认不在
            return false;
        }
        return isInReg.get(rident);
    }

    public int getAddress(String ident) {
        String rident = checkZext(ident);
        if (identMemory.containsKey(rident)) {
            return identMemory.get(rident);
        }
        return -1;
    }

    //基本块开始时，临时变量是空的
    public void clearTemp() {
        for (Integer regId : regInUse_s) {
            String ident = regContent.get(regId);
            isInReg.remove(ident);
            identGRF.remove(ident);
            regContent.remove((Integer) regId);
        }
        regInUse_s = new LinkedList<>();
        freeRegs_s = new LinkedList<>();
        for (int i = 19; i <= 23; i++) {
            freeRegs_s.add(i);
        }
        for (Integer regId : regInUse_t) {
            String ident = regContent.get(regId);
            isInReg.remove(ident);
            identGRF.remove(ident);
            regContent.remove((Integer) regId);
        }
        regInUse_t = new LinkedList<>();
        freeRegs_t = new LinkedList<>();
        for (int i = 5; i <= 18; i++) {
            freeRegs_t.add(i);
        }
        freeRegs_t.add(T8);
        freeRegs_t.add(T9);
    }

    private HashMap<Integer, Integer> scene; //这里就不动保存现场前的各变量和寄存器状态了，专门记一下保存的寄存器的情况即可

    public void saveScene() {   //两者都要写回
        scene = new HashMap<>();
        int curStackSize = mips.getCurStackSize();
        //写回正在使用的寄存器
        ArrayList<Integer> toFree_s = new ArrayList<>();
        for (Integer regId : regInUse_s)    //注意：这个地方并不是真的要放弃寄存器，因为恢复现场后应该还是这样,故不要remove
        {
            if (regContent.get(regId) == null || identMaxLine.get(regContent.get(regId)) < mips.getNowLine()) { //  如果之后没用了，可以直接清掉
                toFree_s.add(regId);
                continue;
            }
            curStackSize += 4;
            mips.addInstr(new StoreWord(regId, -curStackSize, GRF.FP));
            scene.put(regId, curStackSize);
        }
        for (Integer regId : toFree_s) {
            freeAReg(regId, LOCAL);
        }
        ArrayList<Integer> toFree_t = new ArrayList<>();
        for (Integer regId : regInUse_t)    //注意：这个地方并不是真的要放弃寄存器，因为恢复现场后应该还是这样,故不要remove
        {
            if (regContent.get(regId) == null || identMaxLine.get(regContent.get(regId)) < mips.getNowLine()) { //  如果之后没用了，可以直接清掉
                toFree_t.add(regId);
                continue;
            }
            curStackSize += 4;
            mips.addInstr(new StoreWord(regId, -curStackSize, GRF.FP));
            scene.put(regId, curStackSize);
        }
        for (Integer regId : toFree_t) {
            freeAReg(regId, TEMP);
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

    public void loadScene() {   //此外，恢复现场后，其实所有寄存器应该可以回到空白状态。
        int curStackSize = mips.getCurStackSize();
        mips.addInstr(new LoadWord(GRF.RA, -curStackSize, GRF.SP));   //先把地址最低的三个恢复了
        curStackSize -= 4;
        mips.addInstr(new LoadWord(GRF.FP, -curStackSize, GRF.SP));
        curStackSize -= 4;
        mips.addInstr(new LoadWord(GRF.A0, -curStackSize, GRF.SP));
        //之后可以使用FP的值进行恢复
        for (Map.Entry<Integer, Integer> q : scene.entrySet()) {
            curStackSize -= 4;
            mips.addInstr(new LoadWord(q.getKey(), -q.getValue(), GRF.FP));
        }
        mips.setCurStackSize(curStackSize);
    }


}