package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;

public class PrimaryExp implements MySyntaxTreeNode {
    public static final int EXP = 1;
    public static final int LVAL = 2;
    public static final int NUMBER = 3;
    private int mode;
    private int lparentId;
    private int rparentId;
    private Exp exp;
    private LVal lval;
    private MyNumber number;

    public PrimaryExp() {
        mode = -1;
        lparentId = -1;
        rparentId = -1;
        exp = null;
        lval = null;
        number = null;
    }

    public LVal getLVal() {  //specially for Stmt parser
        return lval;
    }

    public void setMode(int v) {
        mode = v;
    }

    public void loadLParent(int newn) {
        lparentId = newn;
    }

    public void loadRParent(int newn) {
        rparentId = newn;
    }

    public void loadExp(Exp newn) {
        exp = newn;
    }

    public void loadLVal(LVal newn) {
        lval = newn;
    }

    public void loadNumber(MyNumber newn) {
        number = newn;
    }

    //For Error Process
    public int getMode() {
        return mode;
    }

    //Error Process End

    public Exp getExp(){
        return exp;
    }

    public int getNumber(){
        return Integer.valueOf(number.getNumber());
    }

    public void output() throws IOException {
        switch (mode) {
            case EXP:
                TokenOutput.outputById(lparentId);
                if (exp != null) {
                    exp.output();
                }
                TokenOutput.outputById(rparentId);
                break;
            case LVAL:
                if (lval != null) {
                    lval.output();
                }
                break;
            case NUMBER:
                if (number != null) {
                    number.output();
                }
                break;
            default:
        }
        OutputHandler.outALineWithoutEnter("<PrimaryExp>\n");
    }
}
