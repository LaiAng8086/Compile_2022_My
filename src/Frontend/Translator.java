package Frontend;

import Frontend.Lexer.Token;
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
import jdk.nashorn.internal.codegen.CompilerConstants;

import java.util.ArrayList;

public class Translator {
    private int nowIntVal;
    private final LLVMControl ctrl;
    private Function curFunction;
    private BasicBlock curBB;
    private boolean isTransConst;
    private Value initVal;
    private Value calcVal;

    public Translator() {
        nowIntVal = 0;
        ctrl = new LLVMControl();
        curFunction = null;
        curBB = null;
        isTransConst = false;
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
                //todo
                break;
            case Stmt.WHILE:
                //todo
                break;
            case Stmt.BREAK:
                //todo
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
                    //todo:Cond case
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
                    //todo:Cond case
                }
            }
        } else if (t.getMode() == UnaryExp.IDENT)    //func call
        {
            String funcName = TokenOutput.getTokenById(t.getIdentId()).getContent();
            Function callee = (Function) Module.getInstance().symbolTable.findGlobalName(funcName);
            CallInstruction callRes = null;
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
