package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import SymbolTable.*;

import java.io.IOException;
import java.util.ArrayList;

public class FuncRParams implements MySyntaxTreeNode {
    public Exp firexp;
    private ArrayList<Integer> commas;
    public ArrayList<Exp> exps;
    private NonFuncTable table;

    public FuncRParams(NonFuncTable tableInvolved) {
        firexp = null;
        commas = new ArrayList<>();
        exps = new ArrayList<>();
        table = tableInvolved;
    }

    public UnaryExp getSingleUnaryExp(Exp now) {
        AddExp t1 = now.getAddexp();
        if (t1.isSingle()) {
            MulExp t2 = t1.getFirmulexp();
            if (t2.isSingle()) {
                return t2.getFirunaryexp();
            }
        }
        return null;
    }

    public void addFuncTableItemFromExp(Exp t, FuncTableItem a) {
        UnaryExp t1 = getSingleUnaryExp(t);
        if (t1 != null) {
            switch (t1.getMode()) {
                case UnaryExp.PRIMARY:
                    PrimaryExp t2 = t1.getPrimaryexp();
                    switch (t2.getMode()) {
                        case PrimaryExp.EXP:
                        case PrimaryExp.NUMBER:
                            a.addParamType(MyBasicType.INT);
                            a.addParamDimensions(0);
                            break;
                        case PrimaryExp.LVAL:
                            LVal t3 = t2.getLVal();
                            NonFuncTableItem var = table.getItem(
                                    TokenOutput.getTokenById(t3.getIdentId()).getContent()
                            );
                            if (var != null) {
                                a.addParamType(var.getBasicType().getType());
                                a.addParamDimensions(var.getDimensions() - t3.getDimensions());//声明维数-调用时显示维数
                            }
                            break;
                    }
                    break;
                case UnaryExp.IDENT:
                    FuncTableItem func = adminTable.globalFunctable.getByName(
                            TokenOutput.getTokenById(t1.getIdentId()).getContent()
                    );
                    a.addParamType(func.getBasicType().getType());
                    a.addParamDimensions(0);
                    break;
                case UnaryExp.UNARY:
                    a.addParamType(MyBasicType.INT);
                    a.addParamDimensions(0);
                    break;
            }
        } else    //If there exists some calculation then the result of a exp should be int.
        {
            a.addParamType(MyBasicType.INT);
            a.addParamDimensions(0);

        }
    }

    public FuncTableItem convertToTableItem() {
        FuncTableItem ret = new FuncTableItem(-1);//Just for parameters, so ignore the return value type.
        if (firexp != null) {
            addFuncTableItemFromExp(firexp, ret);
        }
        if (exps.size() > 0) {
            for (Exp e : exps) {
                addFuncTableItemFromExp(e, ret);
            }
        }
        return ret;
    }


    public void loadFirExp(Exp newn) {
        firexp = newn;
    }

    public void addComma(int newn) {
        commas.add(newn);
    }

    public void addExp(Exp newn) {
        exps.add(newn);
    }

    public void output() throws IOException {
        if (firexp != null) {
            firexp.output();
        }
        if (exps.size() > 0) {
            for (int i = 0; i < exps.size(); i++) {
                TokenOutput.outputById(commas.get(i));
                exps.get(i).output();
            }
        }
        OutputHandler.outALineWithoutEnter("<FuncRParams>\n");
    }
}
