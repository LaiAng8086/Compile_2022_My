package Backend;

import Backend.Global.GlobalMIPSString;
import Backend.Global.GlobalMIPSVar;
import Backend.Instructions.*;
import LLVMIR.Module;
import LLVMIR.Type.IntType;
import LLVMIR.Type.VoidType;
import LLVMIR.Value.Argument;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Constant.ConstantInt;
import LLVMIR.Value.Constant.ConstantString;
import LLVMIR.Value.Constant.Function;
import LLVMIR.Value.Constant.GlobalVariable;
import LLVMIR.Value.Instruction.*;
import LLVMIR.Value.Value;
import SymbolTable.NonFuncTable;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;

public class TranslateToMIPS {
    private MIPSProgram mips;
    private GRF grfControl;

    public TranslateToMIPS(MIPSProgram td) {
        mips = td;
        grfControl = new GRF(mips);
    }

    public void toMIPS() {
        ArrayList<GlobalVariable> globals = Module.getInstance().getGlobalVariables();
        for (int i = 0; i < globals.size(); i++) {
            translateGlobal(globals.get(i));
        }
        ArrayList<Function> functions = Module.getInstance().getFunctions();
        for (int i = 0; i < functions.size(); i++) {
            grfControl = new GRF(mips); //新的函数进入后，相当于所管理的寄存器又都是可以用的了
            mips.setCurStackSize(0);
            translateFunction(functions.get(i));
        }
    }

    public void translateGlobal(GlobalVariable t) {
        if (t.initExists() && t.getInitval() instanceof ConstantString) {
            //MIPSString构造器内部会转换输出字符串
            mips.addGlobalSetting(new GlobalMIPSString(t.getName(), ((ConstantString) t.getInitval()).getContent()));
        } else if (t.initExists() && t.getInitval() instanceof ConstantInt) {
            GlobalMIPSVar newVar = new GlobalMIPSVar(t.getName(), 4);
            newVar.addInitval(((ConstantInt) t.getInitval()).getVal());
            mips.addGlobalSetting(newVar);
        } else if (!t.initExists() && t.getType() instanceof IntType) {
            mips.addGlobalSetting(new GlobalMIPSVar(t.getName(), 4));
        } else {
            //todo: array case
            ;
        }

    }

    private void translateFunction(Function t) {
        mips.addInstr(new Label(t.getName()));
        mips.addInstr(new Move(GRF.FP, GRF.SP));    //在返回语句时会将恢复SP的原值
        ArrayList<Argument> FArgs = t.getArgs();
        int curStackSize = mips.getCurStackSize();
        for (int i = 0; i < FArgs.size(); i++) {
            curStackSize += 4;
            String ident = FArgs.get(i).getName();
            if (i == 0) {
                grfControl.setReg(ident, GRF.A0);
            } else {
                grfControl.setAddress(ident, curStackSize);
            }
        }
        //这里的curStackSize只是模拟压形参，不真的改变
        ArrayList<BasicBlock> bblocks = t.getBblocks();
        for (int i = 0; i < bblocks.size(); i++) {
            translateBasicBlock(bblocks.get(i));
        }
    }

    private void translateBasicBlock(BasicBlock t) {
        LinkedList<AbstractInstruction> irInstrs = t.getInsList();
        for (AbstractInstruction i : irInstrs) {
            if (i instanceof AllocaInstruction) {
                translateAlloca((AllocaInstruction) i);
            } else if (i instanceof StoreInstruction) {
                translateStore((StoreInstruction) i);
            } else if (i instanceof LoadInstruction) {
                translateLoad((LoadInstruction) i);
            } else if (i instanceof AddInstruction) {
                translateAdd((AddInstruction) i);
            } else if (i instanceof SubInstruction) {
                translateSub((SubInstruction) i);
            } else if (i instanceof MulInstruction) {
                translateMul((MulInstruction) i);
            } else if (i instanceof SDivInstruction) {
                translateSDiv((SDivInstruction) i);
            } else if (i instanceof SRemInstruction) {
                translateSRem((SRemInstruction) i);
            } else if (i instanceof SimpleGEP) {
                translateSimpleGEP((SimpleGEP) i);
            } else if (i instanceof CallInstruction) {
                translateCall((CallInstruction) i);
            } else if (i instanceof RetInstruction) {
                translateRet((RetInstruction) i);
            } else if (i instanceof BrInstruction) {
                translateBr((BrInstruction) i);
            } else if (i instanceof ICmpInstruction) {
                translateIcmp((ICmpInstruction) i);
            } else if (i instanceof XorInstruction) {
                translateXor((XorInstruction) i);
            } else if (i instanceof ZextInstruction) {
                translateZext((ZextInstruction) i);
            } else {
                //todo: more instructions
            }
        }
    }

    private void translateAlloca(AllocaInstruction t) {
        int curStackSize = mips.getCurStackSize() + 4;
        grfControl.setAddress(t.getName(), curStackSize);
        mips.setCurStackSize(curStackSize);
    }

    private void translateStore(StoreInstruction i) {
        int regId = -1;
        if (i.getOp1().getName().charAt(0) == '%') //虚拟寄存器
        {
            if (grfControl.isInRegsiter(i.getOp1().getName())) {    //在寄存器中
                regId = grfControl.getRegByName(i.getOp1().getName());
            } else {    //  不在寄存器中
                int addr = grfControl.getAddress(i.getOp1().getName());
                regId = grfControl.allocReg(i.getOp1().getName(), false);
                mips.addInstr(new LoadWord(regId, -addr, GRF.FP));
            }
        } else    //常数
        {
            regId = grfControl.allocReg(i.getOp1().getName(), true);
            mips.addInstr(new LoadImmediate(regId, (new BigInteger(i.getOp1().getName())).intValue()));
        }
        if (i.getOp2() instanceof GlobalVariable) {
            mips.addInstr(new StoreWord2(regId, i.getOp2().getName()));
        } else {
            mips.addInstr(new StoreWord(regId, -grfControl.getAddress(i.getOp2().getName()), GRF.FP));
        }
    }

    private void translateLoad(LoadInstruction i) {
        int regId = grfControl.allocReg(i.getName(), false);
        if (i.getOp1() instanceof GlobalVariable) {
            mips.addInstr(new LoadWord2(regId, i.getOp1().getName()));
        } else {
            mips.addInstr(new LoadWord(regId, -grfControl.getAddress(i.getOp1().getName()), GRF.FP));
        }
    }

    private void translateAdd(AddInstruction t) {
        if (t.getOp1().getName().charAt(0) != '%') {
            int src1 = grfControl.getReg(t.getOp2().getName());
            int imm = (new BigInteger(t.getOp1().getName())).intValue();
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Addiu(dst, src1, imm));
        } else if (t.getOp2().getName().charAt(0) != '%') {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int imm = (new BigInteger(t.getOp2().getName())).intValue();
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Addiu(dst, src1, imm));
        } else {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Addu(dst, src1, src2));
        }
    }

    private void translateSub(SubInstruction t) {
        if (t.getOp1().getName().charAt(0) != '%') {
            int src1 = grfControl.allocReg("", true);
            mips.addInstr(new LoadImmediate(src1, new BigInteger(t.getOp1().getName()).intValue()));
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Subu(dst, src1, src2));
        } else if (t.getOp2().getName().charAt(0) != '%') {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int imm = -(new BigInteger(t.getOp2().getName()).intValue());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Addiu(dst, src1, imm));
        } else {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Subu(dst, src1, src2));
        }
    }

    private void translateMul(MulInstruction t) {   //此时如果按照Mars文档说法，低32位的结果应当在dst对应寄存器中。
        if (t.getOp1().getName().charAt(0) != '%') {
            int src1 = grfControl.allocReg("", true);
            mips.addInstr(new LoadImmediate(src1, new BigInteger(t.getOp1().getName()).intValue()));
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Mul(dst, src1, src2));
        } else if (t.getOp2().getName().charAt(0) != '%') {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int src2 = grfControl.allocReg("", true);
            mips.addInstr(new LoadImmediate(src2, new BigInteger(t.getOp2().getName()).intValue()));
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Mul(dst, src1, src2));
        } else {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Mul(dst, src1, src2));
        }
    }

    private void translateSDiv(SDivInstruction t) {
        if (t.getOp1().getName().charAt(0) != '%') {
            int src1 = grfControl.allocReg("", true);
            mips.addInstr(new LoadImmediate(src1, new BigInteger(t.getOp1().getName()).intValue()));
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Div(src1, src2));
            mips.addInstr(new Mflo(dst));
        } else if (t.getOp2().getName().charAt(0) != '%') {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int src2 = grfControl.allocReg("", true);
            mips.addInstr(new LoadImmediate(src2, new BigInteger(t.getOp2().getName()).intValue()));
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Div(src1, src2));
            mips.addInstr(new Mflo(dst));
        } else {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Div(src1, src2));
            mips.addInstr(new Mflo(dst));
        }
    }

    private void translateSRem(SRemInstruction t) {
        if (t.getOp1().getName().charAt(0) != '%') {
            int src1 = grfControl.allocReg("", true);
            mips.addInstr(new LoadImmediate(src1, new BigInteger(t.getOp1().getName()).intValue()));
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Div(src1, src2));
            mips.addInstr(new Mfhi(dst));
        } else if (t.getOp2().getName().charAt(0) != '%') {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int src2 = grfControl.allocReg("", true);
            mips.addInstr(new LoadImmediate(src2, new BigInteger(t.getOp2().getName()).intValue()));
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Div(src1, src2));
            mips.addInstr(new Mfhi(dst));
        } else {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Div(src1, src2));
            mips.addInstr(new Mfhi(dst));
        }
    }

    private void translateSimpleGEP(SimpleGEP t) {
        mips.addInstr(new LoadAddress(GRF.A0, t.getOp1().getName()));
    }

    private void translateCall(CallInstruction t) {
        if (t.getFuncName().equals("@getint")) {
            mips.addInstr(new LoadImmediate(GRF.V0, 5));
            mips.addInstr(new Syscall());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Move(dst, GRF.V0));
        } else if (t.getFuncName().equals("@putstr")) {
            mips.addInstr(new LoadImmediate(GRF.V0, 4));
            mips.addInstr(new Syscall());   //这里的假设就是这条ir的上一条一定是获取字符串首地址
        } else if (t.getFuncName().equals("@putint")) {
            String ident = t.getOp1().getName();
            if (!(t.getOp1().getName().charAt(0) == '%'))  //数值情形
            {
                mips.addInstr(new LoadImmediate(GRF.A0, (new BigInteger(t.getOp1().getName()).intValue())));
            } else {
                if (grfControl.isInRegsiter(ident))  //在寄存器堆中，则move到a0
                {
                    int dst = grfControl.getReg(ident);
                    mips.addInstr(new Move(GRF.A0, dst));
                } else    //不在寄存器堆中，则直接加载到a0
                {
                    int addr = grfControl.getAddress(ident);
                    mips.addInstr(new LoadWord(GRF.A0, -addr, GRF.FP));
                }
            }
            mips.addInstr(new LoadImmediate(GRF.V0, 1));
            mips.addInstr(new Syscall());
        } else {   //一般函数调用
            grfControl.saveScene();     //保存现场：将所有所管理的正在使用寄存器,a0,ra,fp进行保存
            //变更$sp，注意，这里的sp只是用来算子函数栈帧的fp，所以不用管在本函数中的真实状态，本函数中的偏移量都是可以维护的。
            int curStackSize = mips.getCurStackSize();
            mips.addInstr(new Addiu(GRF.SP, GRF.SP, -curStackSize));
            //填参数，此时本函数的寄存器均已保存好，为了不破坏之前的寄存器使用记录，临时用$t0作为中转进行传参
            ArrayList<Value> RArgs = t.getFuncRArgs();
            int offset;
            for (int i = 0; i < RArgs.size(); i++) {
                String ident = RArgs.get(i).getName();
                if (i == 0)    //第一个参数填入$a0
                {
                    if (ident.charAt(0) == '%') {  //变量情形
                        if (grfControl.isInRegsiter(ident)) {
                            int regId = grfControl.getRegByName(ident); //由于$a0是不受管理的，所以此时必然有move
                            mips.addInstr(new Move(GRF.A0, regId));
                        } else {
                            int addr = grfControl.getAddress(ident);
                            mips.addInstr(new LoadWord(GRF.A0, -addr, GRF.FP));
                        }
                    } else {   //常量数值情形，直接li到$a0
                        mips.addInstr(new LoadImmediate(GRF.A0, (new BigInteger(ident)).intValue()));
                    }
                } else    //其余参数填入内存，注意，子函数的第一个参数处要空出来
                {
                    offset = (i + 1) * 4;   //使用时也是取其负数
                    if (ident.charAt(0) == '%') {  //变量情形
                        if (grfControl.isInRegsiter(ident)) {
                            int regId = grfControl.getRegByName(ident); //由于$a0是不受管理的，所以此时必然有move
                            mips.addInstr(new StoreWord(regId, -offset, GRF.SP));
                        } else {
                            int addr = grfControl.getAddress(ident);
                            mips.addInstr(new LoadWord(GRF.T0, -addr, GRF.FP));
                            mips.addInstr(new StoreWord(GRF.T0, -offset, GRF.SP));
                        }
                    } else {   //常量数值情形，先li 到$t0再保存
                        mips.addInstr(new LoadImmediate(GRF.T0, (new BigInteger(ident)).intValue()));
                        mips.addInstr(new StoreWord(GRF.T0, -offset, GRF.SP));
                    }

                }
            }
            //jal调用
            mips.addInstr(new Jal(t.getFuncName()));
            //恢复现场
            mips.addInstr(new Addiu(GRF.SP, GRF.SP, curStackSize)); //直接恢复到与本函数的$fp相同
            grfControl.loadScene();
            //有返回值的函数保存返回值
            if (!(t.getType() instanceof VoidType)) {
                String ident = t.getName();
                int regId = grfControl.getReg(ident);
                mips.addInstr(new Move(regId, GRF.V0));
            }
        }
    }

    private void translateRet(RetInstruction t) {
        if (t.getMainRet()) {
            mips.addInstr(new LoadImmediate(GRF.V0, 10));
            mips.addInstr(new Syscall());
        } else {
            mips.addInstr(new Move(GRF.SP, GRF.FP));
            if (!(t.getOp1().getType() instanceof VoidType))    //有返回值
            {
                if (t.getOp1().getName().charAt(0) == '%') //变量形式
                {
                    String ident = t.getOp1().getName();
                    if (grfControl.isInRegsiter(ident)) {
                        mips.addInstr(new Move(GRF.V0, grfControl.getRegByName(ident)));
                    } else {
                        mips.addInstr(new LoadWord(GRF.V0, -grfControl.getAddress(ident), GRF.FP));
                    }
                } else {
                    mips.addInstr(new LoadImmediate(GRF.V0, (new BigInteger(t.getOp1().getName())).intValue()));
                }
            }
            mips.addInstr(new Jr(GRF.RA));
        }
    }

    public void translateBr(BrInstruction t) {
        if (t.isCJump()) {
            mips.addInstr(new NoCondJump(t.getJump1()));
        } else {
            int srcId = grfControl.getReg(t.getOp1().getName());
            mips.addInstr(new Bgtz(srcId, t.getJump1()));
            mips.addInstr(new NoCondJump(t.getJump2()));
        }
    }

    public static HashMap<String, String> relationOp = new HashMap<>();

    static {
        relationOp.put("slt", "slt");
        relationOp.put("sle", "sle");
        relationOp.put("sgt", "sgt");
        relationOp.put("sge", "sge");
        relationOp.put("eq", "seq");
        relationOp.put("ne", "sne");
    }

    public void translateIcmp(ICmpInstruction t) {
        String rop = relationOp.get(t.getCmpOp());
        if (t.getOp1().getName().charAt(0) != '%') {    //保险起见，第一个数如果是常数，则load
            int src1 = grfControl.allocReg("", true);
            mips.addInstr(new LoadImmediate(src1, new BigInteger(t.getOp1().getName()).intValue()));
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new SetRelation1(dst, src1, src2, rop));
        } else if (t.getOp2().getName().charAt(0) != '%') {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int imme = new BigInteger(t.getOp2().getName()).intValue();
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new SetRelation2(dst, src1, imme, rop));
        } else {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new SetRelation1(dst, src1, src2, rop));
        }
    }

    public void translateXor(XorInstruction t) {
        if (t.getOp1().getName().charAt(0) != '%') {    //可以交换src1和src2
            int imme = new BigInteger(t.getOp1().getName()).intValue();
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Xori(dst, src2, imme));
        } else if (t.getOp2().getName().charAt(0) != '%') {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int imme = new BigInteger(t.getOp2().getName()).intValue();
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Xori(dst, src1, imme));
        } else {
            int src1 = grfControl.getReg(t.getOp1().getName());
            int src2 = grfControl.getReg(t.getOp2().getName());
            int dst = grfControl.getReg(t.getName());
            mips.addInstr(new Xori(dst, src1, src2));
        }
    }

    public void translateZext(ZextInstruction t) {
        grfControl.addZext(t.getOp1().getName(), t.getName());

    }
}
