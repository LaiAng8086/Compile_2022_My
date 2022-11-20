package Frontend;

import Backend.Instructions.Label;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.*;
import LLVMIR.IRUtil;
import LLVMIR.LLVMControl;
import LLVMIR.Module;
import LLVMIR.Type.*;
import LLVMIR.Value.Argument;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Constant.*;
import LLVMIR.Value.Instruction.*;
import LLVMIR.Value.Value;
import sun.awt.image.ImageWatched;

import java.util.ArrayList;
import java.util.LinkedList;

public class Translator {
    private int nowIntVal;
    private final LLVMControl ctrl;
    private Function curFunction;
    private BasicBlock curBB;
    private boolean isTransConst;
    private Value initVal;
    private Value calcVal;
    private LinkedList<String> loopStack;
    private LinkedList<ArrayList<BrInstruction>> breaks;

    public Translator() {
        nowIntVal = 0;
        ctrl = new LLVMControl();
        curFunction = null;
        curBB = null;
        isTransConst = false;
        loopStack = new LinkedList<>();
        breaks = new LinkedList<>();
    }

    public void translateCompUnit(CompUnit t) {
        if (t.decls.size() > 0) {
            for (int i = 0; i < t.decls.size(); i++) {
                translateDecl(t.decls.get(i));
            }
        }
        if (t.funcdefs.size() > 0) {
            for (int i = 0; i < t.funcdefs.size(); i++) {
                translateFuncDef(t.funcdefs.get(i));
            }
        }
        translateMainFuncDef(t.main);
    }

    public void translateDecl(Decl t) {
        if (t.getDecltype() == Decl.CONST) {
            translateConstDecl(t.getConstdecl());
        } else if (t.getDecltype() == Decl.VAR) {
            translateVarDecl(t.getVardecl());
        }
    }

    public void translateFuncDef(FuncDef t) {
        AbstractType funcRet;
        if (TokenOutput.getTokenById(t.getFuncTypeId()).getType().equals("INTTK")) {
            funcRet = new IntType(32);
        } else {
            funcRet = new VoidType();
        }

        String funcName = t.getFuncName();
        Function newFunc = new Function(funcName, funcRet, Module.getInstance());
        //非main函数也要加入符号表，方便起见。将这两步提前，是为了防止递归调用
        Module.getInstance().symbolTable.getCurrentTable().put(funcName, newFunc);

        Module.getInstance().addFunction(newFunc);

        curFunction = newFunc;

        Module.getInstance().symbolTable.addTable();

        ctrl.setRegNameByFunc(0);

        BasicBlock newBB = new BasicBlock(String.valueOf(ctrl.getRegName()), new LabelType(), curFunction);
        curFunction.addBasicBlock(newBB);
        curBB = newBB;

        //先要有基本块才能往里插形参的store指令
        if (t.funcfparams != null) {
            ArrayList<Argument> fparams = translateFuncFParams(t.funcfparams);
            curFunction.addAllArgs(fparams);
        }

        translateBlock(t.getBlock());

        Module.getInstance().symbolTable.dropTable();
        //如果没有返回值，则在最后一个基本块的最后一条加上ret void。
        if (funcRet instanceof VoidType && !curFunction.hasReturn) {
            BasicBlock lastBB = curFunction.getLastBB();
            lastBB.addInstruction(new RetInstruction("", null, curBB, IRUtil.getVoidValue()));
        }


    }

    public void translateMainFuncDef(MainFuncDef t) {
        AbstractType funcRet = new IntType(32);
        String funcName = "main";
        Function newFunc = new Function(funcName, funcRet, Module.getInstance());
        curFunction = newFunc;

        ctrl.setRegNameByFunc(0);

        Module.getInstance().symbolTable.addTable();

        BasicBlock newBB = new BasicBlock(String.valueOf(ctrl.getRegName()), new LabelType(), curFunction);
        curFunction.addBasicBlock(newBB);
        curBB = newBB;
        translateBlock(t.getBlock());

        Module.getInstance().symbolTable.dropTable();
        Module.getInstance().addFunction(newFunc);
    }

    public void translateConstDecl(ConstDecl t) {
        AbstractType constVarType = null;
        if (t.getType().equals("INTTK")) {
            constVarType = new IntType(32);
        }
        isTransConst = true;
        if (t.firconstdef != null) {
            translateConstDef(constVarType, t.firconstdef);
        }
        if (t.constdefs.size() > 0) {
            for (int i = 0; i < t.constdefs.size(); i++) {
                translateConstDef(constVarType, t.constdefs.get(i));
            }
        }
        isTransConst = false;
    }

    public void translateVarDecl(VarDecl t) {
        AbstractType varType = null;
        if (t.getType().equals("INTTK")) {
            varType = new IntType(32);
        }
        // Still var
        if (t.firvardef != null) {
            translateVarDef(varType, t.firvardef);
        }
        if (t.vardefs.size() > 0) {
            for (int i = 0; i < t.vardefs.size(); i++) {
                translateVarDef(varType, t.vardefs.get(i));
            }
        }
    }

    public ArrayList<Argument> translateFuncFParams(FuncFParams t) {
        ArrayList<Argument> ret = new ArrayList<>();
        if (t.firfuncfparam != null) {
            ret.add(translateFuncFParam(t.firfuncfparam));
        }
        if (t.funcfparams.size() > 0) {
            for (int i = 0; i < t.funcfparams.size(); i++) {
                ret.add(translateFuncFParam(t.funcfparams.get(i)));
            }
        }
        return ret;
    }

    public void translateBlock(Block t) {
        for (int i = 0; i < t.blockitems.size(); i++) {
            if (t.blockitems.get(i) instanceof Decl) {
                translateDecl((Decl) t.blockitems.get(i));
            } else {
                translateStmt((Stmt) t.blockitems.get(i));
            }
        }
    }

    public void translateConstDef(AbstractType type, ConstDef t) {
        if (t.constexps.size() == 0) {
            if (Module.getInstance().symbolTable.getSize() == 1)   //Global Const and const must have constinitval
            {
                translateConstInitVal(t.getConstinitval());
                GlobalVariable newG = new GlobalVariable(t.getName(), type, Module.getInstance(), (ConstantInt) initVal);
                newG.setConst();
                Module.getInstance().symbolTable.getCurrentTable().put(t.getName(), initVal);
                Module.getInstance().addGlobalVariable(newG);
            } else {    //Local Const
                AllocaInstruction constAlloca = new AllocaInstruction(String.valueOf(ctrl.getRegName()),
                        new PointerType(type), curBB);
                curFunction.addAlloca(constAlloca);
                if (t.getConstinitval() != null) {  //? what is the type of a store instruction? It's seems can be ignored.
                    translateConstInitVal(t.getConstinitval());
                    StoreInstruction constStore = new StoreInstruction("", new VoidType(), curBB, initVal, constAlloca);
                    curBB.addInstruction(constStore);
                    Module.getInstance().symbolTable.getCurrentTable().put(t.getName(), initVal);
                }
            }
        } else {
            ;//todo:array case.
        }
    }

    public void translateVarDef(AbstractType type, VarDef t) {
        if (t.constexps.size() == 0) {
            if (Module.getInstance().symbolTable.getSize() == 1)   //Global var
            {
                if (t.initval != null) {
                    translateInitval(t.initval);
                    // the pointer conversion will happen in Global Variable Function
                    //按照语义约束，全局变量的初始值应当为常数数值
                    GlobalVariable newG = new GlobalVariable(t.getName(), type, Module.getInstance(), (AbstractConstant) initVal);
                    Module.getInstance().symbolTable.getCurrentTable().put(t.getName(), newG);
                    Module.getInstance().addGlobalVariable(newG);
                } else {
                    //根据语义约束，未显式初始化的全局变量，其元素值均被初始化为0
                    GlobalVariable newG = new GlobalVariable(t.getName(), type,
                            Module.getInstance(), new ConstantInt(0, 32));
                    Module.getInstance().symbolTable.getCurrentTable().put(t.getName(), newG);
                    Module.getInstance().addGlobalVariable(newG);
                }
            } else    //Local var
            {
                AllocaInstruction varAlloca = new AllocaInstruction(String.valueOf(ctrl.getRegName()),
                        new PointerType(type), curBB);
                curFunction.addAlloca(varAlloca);
                if (t.initval != null) {
                    translateInitval(t.initval);
                    initVal = needLoad(initVal);    //有可能加载的是全局变量的指针
                    StoreInstruction varInit = new StoreInstruction("", new VoidType(), curBB, initVal, varAlloca);
                    curBB.addInstruction(varInit);
                    Module.getInstance().symbolTable.getCurrentTable().put(t.getName(), varAlloca);
                } else {
                    //局部变量没有初始化则不用store，只需要alloca，符号表就存alloca的指针
                    Module.getInstance().symbolTable.getCurrentTable().put(t.getName(), varAlloca);
                }
            }
        } else {
            //todo:Array Case.
        }
    }

    public Argument translateFuncFParam(FuncFParam t) {
        AbstractType btype = null;
        if (t.getType().equals("INTTK")) {
            btype = new IntType(32);
        }
        if (t.lbrackId == -1 && t.lbracks.size() == 0)   //a var
        {
            Argument ret = new Argument(String.valueOf(ctrl.getRegName()), btype, curBB);
            Module.getInstance().symbolTable.getCurrentTable().put(t.getName(), ret);
            AllocaInstruction paramAlloca = new AllocaInstruction(String.valueOf(ctrl.getRegName()),
                    new PointerType(btype), curBB);
            curFunction.addAlloca(paramAlloca);
            StoreInstruction initSaveParam = new StoreInstruction("", new VoidType(), curBB, ret, paramAlloca);
            curBB.addInstruction(initSaveParam);
            //此时登录符号表的应当是申请的指针指向的内存
            Module.getInstance().symbolTable.getCurrentTable().put(t.getName(), paramAlloca);
            return ret;
        } else {
            //todo:Array Case
        }
        return null;
    }

    public void translateStmt(Stmt t) {
        switch (t.getMode()) {
            case Stmt.ASSIGN:
                translateAssign(t);
                break;
            case Stmt.EXP:
                translateExp(t.getExp());
                break;
            case Stmt.BLOCK://我认为此处不会造成新的基本块出现，只不过有些变量的生命周期有变化。
                Module.getInstance().symbolTable.addTable();
                translateBlock(t.getBlock());
                Module.getInstance().symbolTable.dropTable();
                break;
            case Stmt.IF:
                int trueBoxId = ctrl.getRegName();
                int nextBoxId = ctrl.getRegName();
                int falseBoxId = -1;
                if (t.hasElse()) {
                    falseBoxId = ctrl.getRegName();
                    translateCond(t.getCond(), trueBoxId, falseBoxId);
                } else {
                    translateCond(t.getCond(), trueBoxId, nextBoxId);
                }
                BasicBlock trueBox = new BasicBlock(String.valueOf(trueBoxId), new LabelType(), curFunction);
                curFunction.addBasicBlock(trueBox);
                curBB = trueBox;
                translateStmt(t.getStmt1());
                //如果在条件成立的块中最后是break continue 或 return 则不用添加
                if (!(curBB.getInstSize() > 0 && (curBB.getLastInst() instanceof BrInstruction ||
                        curBB.getLastInst() instanceof RetInstruction))) {
                    curBB.addInstruction(new BrInstruction("", new VoidType(), curBB,
                            String.valueOf(nextBoxId)));
                }
                if (t.hasElse()) {
                    BasicBlock falseBox = new BasicBlock(String.valueOf(falseBoxId), new LabelType(), curFunction);
                    curFunction.addBasicBlock(falseBox);
                    curBB = falseBox;
                    translateStmt(t.getElseStmt());
                    //如果在条件成立的块中最后是break continue 或 return 则不用添加
                    if (!(curBB.getInstSize() > 0 && (curBB.getLastInst() instanceof BrInstruction ||
                            curBB.getLastInst() instanceof RetInstruction))) {
                        curBB.addInstruction(new BrInstruction("", new VoidType(), curBB, String.valueOf(nextBoxId)));
                    }
                }
                BasicBlock nextBox = new BasicBlock(String.valueOf(nextBoxId), new LabelType(), curFunction);
                curFunction.addBasicBlock(nextBox);
                curBB = nextBox;
                break;
            case Stmt.WHILE:
                int whileId = ctrl.getRegName();
                curBB.addInstruction(new BrInstruction("", new VoidType(), curBB, String.valueOf(whileId)));
                BasicBlock newLoopBox = new BasicBlock(String.valueOf(whileId), new LabelType(), curFunction);
                curFunction.addBasicBlock(newLoopBox);
                curBB = newLoopBox;
                loopStack.add(String.valueOf(whileId));
                ArrayList<BrInstruction> possibleBreak = new ArrayList<>();
                breaks.add(possibleBreak);
                //cond and stmt
                int whileTrueId = ctrl.getRegName();
                int whileNextId = ctrl.getRegName();
                //cond
                translateCond(t.getCond(), whileTrueId, whileNextId);
                BasicBlock whileTrueBox = new BasicBlock(String.valueOf(whileTrueId), new LabelType(), curFunction);
                curFunction.addBasicBlock(whileTrueBox);
                curBB = whileTrueBox;
                //stmt
                translateStmt(t.getStmt1());
                //如果在条件成立的块中最后是break continue 或 return 则不用添加
                if (!(curBB.getInstSize() > 0 && (curBB.getLastInst() instanceof BrInstruction ||
                        curBB.getLastInst() instanceof RetInstruction))) {
                    curBB.addInstruction(
                            new BrInstruction("", new VoidType(), curBB, String.valueOf(whileId))
                    );
                }
                //回填break
                for (BrInstruction br : breaks.getLast()) {
                    br.changeJump(String.valueOf(whileNextId));
                }
                breaks.removeLast();
                loopStack.removeLast();
                //结束，进入下一个块
                BasicBlock whileNextBox = new BasicBlock(String.valueOf(whileNextId), new LabelType(), curFunction);
                curFunction.addBasicBlock(whileNextBox);
                curBB = whileNextBox;
                break;
            case Stmt.BREAK:
                BrInstruction brk = new BrInstruction("", new VoidType(), curBB, "DaiHuiTian");
                curBB.addInstruction(brk);
                breaks.getLast().add(brk);
                // int afterBreakId = ctrl.getRegName();
                //讲道理,break和continue后面不该有语句，因为根本不会执行。
                // BasicBlock afterbreakBox = new BasicBlock(String.valueOf(afterBreakId),
                //         new LabelType(), curFunction);
                // curFunction.addBasicBlock(afterbreakBox);
                // curBB = afterbreakBox;
                break;
            case Stmt.CONTINUE:
                BrInstruction contin = new BrInstruction("", new VoidType(), curBB, loopStack.getLast());
                curBB.addInstruction(contin);
                //同上，按理说都不应该出现
                // int afterContinueId = ctrl.getRegName();
                // BasicBlock aftercontinueBox = new BasicBlock(String.valueOf(afterContinueId),
                //         new LabelType(), curFunction);
                // curFunction.addBasicBlock(aftercontinueBox);
                // curBB = aftercontinueBox;
                break;
            case Stmt.RETURN:
                translateReturn(t);
                break;
            case Stmt.INPUT:
                translateInput(t);
                break;
            case Stmt.OUTPUT:
                translateOutput(t);
                break;

        }
    }

    public void translateCond(Cond t, int trueId, int falseId) {
        translateLOrExp(t.getLorExp(), trueId, falseId);
    }

    public void translateLOrExp(LOrExp t, int trueId, int falseId) {
        if (t.landexps.size() == 0) {
            translateLAndExp(t.firlandexp, trueId, falseId);
        } else {
            int nextId = ctrl.getRegName();
            translateLAndExp(t.firlandexp, trueId, nextId);
            for (int i = 0; i < t.landexps.size(); i++) {
                BasicBlock newBox = new BasicBlock(String.valueOf(nextId), new LabelType(), curFunction);
                curFunction.addBasicBlock(newBox);
                curBB = newBox;
                if (i < t.landexps.size() - 1) {
                    nextId = ctrl.getRegName();
                    translateLAndExp(t.landexps.get(i), trueId, nextId);
                } else {
                    translateLAndExp(t.landexps.get(i), trueId, falseId);
                }
            }
        }
    }

    public Value convertWidth(Value now, int targetWidth) {
        if (now.getType() instanceof IntType && ((IntType) now.getType()).getBits() != targetWidth) {
            Value ret = new ZextInstruction(String.valueOf(ctrl.getRegName()), new IntType(targetWidth),
                    curBB, now);
            curBB.addInstruction((AbstractInstruction) ret);
            return ret;
        } else
            return now;
    }

    public ICmpInstruction buildIcmp(String name, Value op1, Value op2, String cmpOp) {
        int width1 = ((IntType) op1.getType()).getBits();
        int width2 = ((IntType) op2.getType()).getBits();
        if (width1 == width2) {
            return new ICmpInstruction(name, new IntType(1), curBB, cmpOp, new IntType(width1), op1, op2);
        } else {
            if (width1 > width2) {
                Value newop2 = convertWidth(op2, width1);
                return new ICmpInstruction(name, new IntType(1), curBB, cmpOp, new IntType(width1), op1, newop2);
            } else {
                Value newop1 = convertWidth(op1, width2);
                return new ICmpInstruction(name, new IntType(1), curBB, cmpOp, new IntType(width2), newop1, op2);
            }
        }
    }

    public Value convertLogic(Value now) {
        if (now.getType() instanceof IntType && ((IntType) now.getType()).getBits() != 1) {
            ICmpInstruction ret = buildIcmp(String.valueOf(ctrl.getRegName()), now,
                    new ConstantInt(0, 32), "ne");
            curBB.addInstruction(ret);
            return ret;
        }
        return now;
    }

    public void translateLAndExp(LAndExp t, int trueId, int falseId) {
        if (t.eqexps.size() == 0) {
            translateEqExp(t.fireqexp);
            calcVal = convertLogic(calcVal);  //这一步保证了条件判断时一定是i1
            curBB.addInstruction(new BrInstruction("", new VoidType(), curBB, calcVal,
                    String.valueOf(trueId), String.valueOf(falseId)));
        } else {
            int nextId = ctrl.getRegName();
            translateEqExp(t.fireqexp);
            calcVal = convertLogic(calcVal);
            curBB.addInstruction(new BrInstruction("", new VoidType(), curBB, calcVal,
                    String.valueOf(nextId), String.valueOf(falseId)));
            for (int i = 0; i < t.eqexps.size(); i++) {
                BasicBlock newBox = new BasicBlock(String.valueOf(nextId), new LabelType(), curFunction);
                curFunction.addBasicBlock(newBox);
                curBB = newBox;
                if (i < t.eqexps.size() - 1) {
                    nextId = ctrl.getRegName();
                    translateEqExp(t.eqexps.get(i));
                    calcVal = convertLogic(calcVal);
                    curBB.addInstruction(new BrInstruction("", new VoidType(), curBB, calcVal,
                            String.valueOf(nextId), String.valueOf(falseId)));
                } else {
                    translateEqExp(t.eqexps.get(i));
                    calcVal = convertLogic(calcVal);
                    curBB.addInstruction(new BrInstruction("", new VoidType(), curBB, calcVal,
                            String.valueOf(trueId), String.valueOf(falseId)));
                }
            }
        }
    }

    public void translateEqExp(EqExp t) {
        Value left, right;
        translateRelExp(t.firrelexp);
        left = calcVal;
        if (t.relexps.size() > 0) {
            for (int i = 0; i < t.relexps.size(); i++) {
                translateRelExp(t.relexps.get(i));
                right = calcVal;
                if (left instanceof ConstantInt && right instanceof ConstantInt) {
                    ConstantInt res = null;
                    if (getOpera(t.operas.get(i)).equals("EQL")) {
                        int jury = ((ConstantInt) left).getVal() == ((ConstantInt) right).getVal() ? 1 : 0;
                        res = new ConstantInt(jury, 1);
                    } else if (getOpera(t.operas.get(i)).equals("NEQ")) {
                        int jury = ((ConstantInt) left).getVal() != ((ConstantInt) right).getVal() ? 1 : 0;
                        res = new ConstantInt(jury, 1);
                    }
                    left = res;  //? Just remain it as a const int.
                } else {
                    if (getOpera(t.operas.get(i)).equals("EQL")) {
                        left = needLoad(left);
                        right = needLoad(right);
                        ICmpInstruction cmpRes = buildIcmp(String.valueOf(ctrl.getRegName()), left, right, "eq");
                        curBB.addInstruction(cmpRes);
                        left = cmpRes;
                    } else if (getOpera(t.operas.get(i)).equals("NEQ")) {
                        left = needLoad(left);
                        right = needLoad(right);
                        ICmpInstruction cmpRes = buildIcmp(String.valueOf(ctrl.getRegName()), left, right, "ne");
                        curBB.addInstruction(cmpRes);
                        left = cmpRes;
                    }
                }
            }
        }
        calcVal = left;
    }

    public void translateRelExp(RelExp t) {
        Value left, right;
        translateAddExp(t.firaddexp);
        left = calcVal;
        if (t.addexps.size() > 0) {
            for (int i = 0; i < t.addexps.size(); i++) {
                translateAddExp(t.addexps.get(i));
                right = calcVal;
                if (left instanceof ConstantInt && right instanceof ConstantInt) {
                    ConstantInt res = null;
                    if (getOpera(t.operas.get(i)).equals("LSS")) {
                        int jury = ((ConstantInt) left).getVal() < ((ConstantInt) right).getVal() ? 1 : 0;
                        res = new ConstantInt(jury, 1);
                    } else if (getOpera(t.operas.get(i)).equals("LEQ")) {
                        int jury = ((ConstantInt) left).getVal() <= ((ConstantInt) right).getVal() ? 1 : 0;
                        res = new ConstantInt(jury, 1);
                    } else if (getOpera(t.operas.get(i)).equals("GRE")) {
                        int jury = ((ConstantInt) left).getVal() > ((ConstantInt) right).getVal() ? 1 : 0;
                        res = new ConstantInt(jury, 1);
                    } else if (getOpera(t.operas.get(i)).equals("GEQ")) {
                        int jury = ((ConstantInt) left).getVal() >= ((ConstantInt) right).getVal() ? 1 : 0;
                        res = new ConstantInt(jury, 1);
                    }
                    left = res;  //? Just remain it as a const int.
                } else {
                    if (getOpera(t.operas.get(i)).equals("LSS")) {
                        left = needLoad(left);
                        right = needLoad(right);
                        ICmpInstruction cmpRes = buildIcmp(String.valueOf(ctrl.getRegName()), left, right, "slt");
                        curBB.addInstruction(cmpRes);
                        left = cmpRes;
                    } else if (getOpera(t.operas.get(i)).equals("LEQ")) {
                        left = needLoad(left);
                        right = needLoad(right);
                        ICmpInstruction cmpRes = buildIcmp(String.valueOf(ctrl.getRegName()), left, right, "sle");
                        curBB.addInstruction(cmpRes);
                        left = cmpRes;
                    } else if (getOpera(t.operas.get(i)).equals("GRE")) {
                        left = needLoad(left);
                        right = needLoad(right);
                        ICmpInstruction cmpRes = buildIcmp(String.valueOf(ctrl.getRegName()), left, right, "sgt");
                        curBB.addInstruction(cmpRes);
                        left = cmpRes;
                    } else if (getOpera(t.operas.get(i)).equals("GEQ")) {
                        left = needLoad(left);
                        right = needLoad(right);
                        ICmpInstruction cmpRes = buildIcmp(String.valueOf(ctrl.getRegName()), left, right, "sge");
                        curBB.addInstruction(cmpRes);
                        left = cmpRes;
                    }
                }
            }
        }
        calcVal = left;
    }

    public void translateAssign(Stmt t) {
        Value left, right;
        translateExp(t.getExp());
        right = needLoad(calcVal);
        translateLVal(t.getLval());
        left = calcVal;
        StoreInstruction storeRes = new StoreInstruction("", new VoidType(), curBB, right, left);
        curBB.addInstruction(storeRes);
    }

    public void translateReturn(Stmt t) {
        if (t.getExp() != null) {
            translateExp(t.getExp());
            Value retVal = needLoad(calcVal);
            RetInstruction ret = new RetInstruction("", new VoidType(), curBB, retVal);
            if (curFunction.getName().equals("@main")) {    //Main函数的返回时直接结束程序
                ret.setMainRet();
            }
            curBB.addInstruction(ret);
            curFunction.hasReturn = true;
        } else    //In legal situation, only void function
        {
            if (curFunction.getType() instanceof VoidType) {
                RetInstruction ret = new RetInstruction("", new VoidType(), curBB, IRUtil.getVoidValue());
                if (curFunction.getName().equals("@main")) {    //Main函数的返回时直接结束程序，不过理论上来说不会触发这里
                    ret.setMainRet();
                }
                curBB.addInstruction(ret);
                curFunction.hasReturn = true;
            }
        }
    }

    public void translateInput(Stmt t) {
        translateLVal(t.getLval());
        CallInstruction callInput = new CallInstruction(String.valueOf(ctrl.getRegName()),
                Module.getint, curBB, null);
        curBB.addInstruction(callInput);
        StoreInstruction stoRes = new StoreInstruction("", new VoidType(), curBB, callInput, calcVal);
        curBB.addInstruction(stoRes);
    }

    private void outputStr(String t) {
        String sp = t;
        sp = sp.replace("\\n", "\n");
        int strLength = sp.length();
        sp = sp.replace("\n", "\\0a");
        sp = sp + "\\00";
        strLength++;
        GlobalVariable newG = new GlobalVariable("_str_" + Module.getInstance().getStrId(),
                IRUtil.get1DArrayType(8, strLength), Module.getInstance(),
                new ConstantString("", "\"" + sp + "\""));
        newG.setConst();
        Module.getInstance().addGlobalVariable(newG);
        SimpleGEP output = new SimpleGEP(String.valueOf(ctrl.getRegName()), new PointerType(new IntType(8)),
                curBB, newG);
        curBB.addInstruction(output);
        ArrayList<Value> temp = new ArrayList<>();
        temp.add(output);
        CallInstruction callOut = new CallInstruction("", Module.putstr, curBB, temp);
        curBB.addInstruction(callOut);
    }

    public void translateOutput(Stmt t) {
        int las = 1;
        int putCnt = 0;
        String format = t.getFormatString().getContent();
        for (int i = 1; i < format.length() - 1; i++) {
            if (format.charAt(i) == '%') {
                if (las <= i - 1) {
                    String sp = format.substring(las, i);
                    outputStr(sp);
                }
                las = i + 2;
                translateExp(t.getExpById(putCnt++));
                Value forOutput = needLoad(calcVal);
                CallInstruction putInt = new CallInstruction("", Module.putint, curBB,
                        IRUtil.getOnlyArg(forOutput));
                curBB.addInstruction(putInt);
            }
        }
        if (las <= format.length() - 2) {
            String sp = format.substring(las, format.length() - 1); //[start,end)
            outputStr(sp);
        }
    }

    public void translateConstInitVal(ConstInitVal t) {
        if (t.getMode() == ConstInitVal.CHOICE1) {
            translateConstExp(t.getConstexp());
            initVal = calcVal;
        } else {
            ;//todo:Array case.
        }
    }

    public void translateInitval(InitVal t) {
        if (t.getMode() == InitVal.CHOICE1) {
            translateExp(t.getExp());
            initVal = calcVal;
        } else {
            ;//todo:Array Case.
        }

    }

    public void translateConstExp(ConstExp t) {
        translateAddExp(t.getAddExp());
    }


    public void translateExp(Exp t) {
        if (t != null) {            //防备空语句
            translateAddExp(t.getAddexp());
        }
    }

    private String getOpera(int id) {
        return TokenOutput.getTokenById(id).getType();
    }

    private Value needLoad(Value t) {
        if (t.getType() instanceof PointerType) {
            AbstractInstruction ret
                    = new LoadInstruction(String.valueOf(ctrl.getRegName()),
                    ((PointerType) t.getType()).getPointee(), curBB, t);
            curBB.addInstruction(ret);
            return ret;
        }
        return t;
    }

    public void translateAddExp(AddExp t) {
        Value left, right;
        translateMulExp(t.getFirmulexp());
        left = calcVal;
        if (t.mulexps.size() > 0) {
            for (int i = 0; i < t.mulexps.size(); i++) {
                translateMulExp(t.mulexps.get(i));
                right = calcVal;
                if (left instanceof ConstantInt && right instanceof ConstantInt) {
                    ConstantInt res = null;
                    if (getOpera(t.operas.get(i)).equals("PLUS")) {
                        res = new ConstantInt(((ConstantInt) left).getVal() + ((ConstantInt) right).getVal(), 32);
                    } else if (getOpera(t.operas.get(i)).equals("MINU")) { //如果减出负数了咋办？
                        res = new ConstantInt(((ConstantInt) left).getVal() - ((ConstantInt) right).getVal(), 32);
                    }
                    left = res;  //? Just remain it as a const int.
                } else {
                    if (getOpera(t.operas.get(i)).equals("PLUS")) {
                        left = needLoad(left);
                        right = needLoad(right);

                        AddInstruction addRes = new AddInstruction(String.valueOf(ctrl.getRegName()),
                                new IntType(32), curBB, left, right);
                        curBB.addInstruction(addRes);
                        left = addRes;
                    } else if (getOpera(t.operas.get(i)).equals("MINU")) {
                        left = needLoad(left);
                        right = needLoad(right);
                        SubInstruction subRes = new SubInstruction(String.valueOf(ctrl.getRegName()),
                                new IntType(32), curBB, left, right);
                        curBB.addInstruction(subRes);
                        left = subRes;
                    }
                }
            }
        }
        calcVal = left;
    }

    public void translateMulExp(MulExp t) {
        Value left, right;
        translateUnaryExp(t.getFirunaryexp());
        left = calcVal;
        if (t.unaryexps.size() > 0) {
            for (int i = 0; i < t.unaryexps.size(); i++) {
                translateUnaryExp(t.unaryexps.get(i));
                right = calcVal;
                if (left instanceof ConstantInt && right instanceof ConstantInt) {
                    ConstantInt res = null;
                    if (getOpera(t.operas.get(i)).equals("MULT")) {
                        res = new ConstantInt(((ConstantInt) left).getVal() * ((ConstantInt) right).getVal(), 32);
                    } else if (getOpera(t.operas.get(i)).equals("DIV")) {
                        res = new ConstantInt(((ConstantInt) left).getVal() / ((ConstantInt) right).getVal(), 32);
                    } else if (getOpera(t.operas.get(i)).equals("MOD")) {
                        res = new ConstantInt(((ConstantInt) left).getVal() % ((ConstantInt) right).getVal(), 32);
                    }
                    left = res;
                } else {
                    if (getOpera(t.operas.get(i)).equals("MULT")) {
                        left = needLoad(left);
                        right = needLoad(right);
                        MulInstruction mulRes = new MulInstruction(String.valueOf(ctrl.getRegName()),
                                new IntType(32), curBB, left, right);
                        curBB.addInstruction(mulRes);
                        left = mulRes;
                    } else if (getOpera(t.operas.get(i)).equals("DIV")) {
                        left = needLoad(left);
                        right = needLoad(right);
                        SDivInstruction sdivRes = new SDivInstruction(String.valueOf(ctrl.getRegName()),
                                new IntType(32), curBB, left, right);
                        curBB.addInstruction(sdivRes);
                        left = sdivRes;
                    } else if (getOpera(t.operas.get(i)).equals("MOD")) {
                        left = needLoad(left);
                        right = needLoad(right);
                        SRemInstruction sremRes = new SRemInstruction(String.valueOf(ctrl.getRegName()),
                                new IntType(32), curBB, left, right);
                        curBB.addInstruction(sremRes);
                        left = sremRes;
                    }
                }
            }
        }
        calcVal = left;
    }

    private void translateUnaryExp(UnaryExp t) {
        if (t.getMode() == UnaryExp.UNARY) {
            Value left, right;
            left = new ConstantInt(0, 32);
            translateUnaryExp(t.getUnaryexp());
            right = calcVal;
            if (right instanceof ConstantInt) {
                if (t.getUnaryOp().equals("PLUS")) {
                    calcVal = right;
                } else if (t.getUnaryOp().equals("MINU")) {
                    calcVal = new ConstantInt(-((ConstantInt) right).getVal(), 32);
                } else if (t.getUnaryOp().equals("NOT")) {
                    int jury = ((ConstantInt) right).getVal() == 0 ? 0 : 1;
                    calcVal = new ConstantInt(jury, 32);
                }
            } else {
                if (t.getUnaryOp().equals("PLUS")) {
                    calcVal = right; //no special process
                } else if (t.getUnaryOp().equals("MINU")) {
                    left = needLoad(left);
                    right = needLoad(right);
                    SubInstruction subRes = new SubInstruction(String.valueOf(ctrl.getRegName()), new IntType(32),
                            curBB, left, right);
                    curBB.addInstruction(subRes);
                    calcVal = subRes;
                } else if (t.getUnaryOp().equals("NOT")) {
                    right = needLoad(right);
                    right = convertLogic(right);
                    XorInstruction xorRes = new XorInstruction(String.valueOf(ctrl.getRegName()), new IntType(1),
                            curBB, right, new ConstantInt(1, 1));
                    curBB.addInstruction(xorRes);
                    calcVal = convertWidth(xorRes, 32);
                }
            }
        } else if (t.getMode() == UnaryExp.IDENT)    //func call
        {
            String funcName = TokenOutput.getTokenById(t.getIdentId()).getContent();
            Function callee = (Function) Module.getInstance().symbolTable.findGlobalName(funcName);
            CallInstruction callRes;
            if (t.getFuncrparams() != null) {
                ArrayList<Value> args = translateFuncRParams(t.getFuncrparams());
                callRes = new CallInstruction(String.valueOf(ctrl.getRegName()), callee, curBB, args);
            } else {
                callRes = new CallInstruction(String.valueOf(ctrl.getRegName()), callee, curBB, null);
            }
            curBB.addInstruction(callRes);
            calcVal = callRes;
        } else if (t.getMode() == UnaryExp.PRIMARY) {
            translatePrimaryExp(t.getPrimaryexp());
        }
    }

    public ArrayList<Value> translateFuncRParams(FuncRParams t) {
        ArrayList<Value> ret = new ArrayList<>();
        if (t.firexp != null) {
            translateExp(t.firexp);
            Value RParam = needLoad(calcVal);
            ret.add(RParam);
        }
        if (t.exps.size() > 0) {
            for (int i = 0; i < t.exps.size(); i++) {
                translateExp(t.exps.get(i));
                Value RParam = needLoad(calcVal);
                ret.add(RParam);
            }
        }
        return ret;
    }

    public void translatePrimaryExp(PrimaryExp t) {
        if (t.getMode() == PrimaryExp.EXP) {
            translateExp(t.getExp());
        } else if (t.getMode() == PrimaryExp.NUMBER) {
            calcVal = new ConstantInt(t.getNumber(), 32);
        } else if (t.getMode() == PrimaryExp.LVAL) {
            translateLVal(t.getLVal());
        }
    }

    public void translateLVal(LVal t) {
        if (t.getDimensions() == 0)    //single var
        {
            String varName = TokenOutput.getTokenById(t.getIdentId()).getContent();
            calcVal = Module.getInstance().symbolTable.findByName(varName);
        } else {
            //todo:array case
        }
    }
}
