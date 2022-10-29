package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;

public class UnaryExp implements MySyntaxTreeNode {
    public static final int PRIMARY = 1;
    public static final int IDENT = 2;
    public static final int UNARY = 3;
    private int mode;
    private PrimaryExp primaryexp;
    private int identId;
    private int lparentId;
    private int rparentId;
    private FuncRParams funcrparams;
    private UnaryOp unaryop;
    private UnaryExp unaryexp;

    public UnaryExp() {
        mode = -1;
        primaryexp = null;
        identId = -1;
        lparentId = -1;
        rparentId = -1;
        funcrparams = null;
        unaryop = null;
        unaryexp = null;
    }

    public PrimaryExp getPrimaryexp() {  //specially for Stmt Parser.
        return primaryexp;
    }

    public void setMode(int v) {
        mode = v;
    }

    public void loadPrimaryExp(PrimaryExp newn) {
        primaryexp = newn;
    }

    public void loadIdent(int newn) {
        identId = newn;
    }

    public void loadLParent(int newn) {
        lparentId = newn;
    }

    public void loadRParent(int newn) {
        rparentId = newn;
    }

    public void loadFuncRParams(FuncRParams newn) {
        funcrparams = newn;
    }

    public void loadUnaryOp(UnaryOp newn) {
        unaryop = newn;
    }

    public void loadUnaryExp(UnaryExp newn) {
        unaryexp = newn;
    }

    //For Error Process
    public int getMode() {
        return mode;
    }

    public int getIdentId() {
        return identId;
    }

    //Error Process End.

    public String getUnaryOp() {
        return TokenOutput.getTokenById(unaryop.getTypeId()).getType();
    }

    public UnaryExp getUnaryexp() {
        return unaryexp;
    }

    public FuncRParams getFuncrparams() {
        return funcrparams;
    }

    public void output() throws IOException {
        switch (mode) {
            case PRIMARY:
                if (primaryexp != null) {
                    primaryexp.output();
                }
                break;
            case IDENT:
                TokenOutput.outputById(identId);
                TokenOutput.outputById(lparentId);
                if (funcrparams != null) {
                    funcrparams.output();
                }
                TokenOutput.outputById(rparentId);
                break;
            case UNARY:
                if (unaryop != null) {
                    unaryop.output();
                }
                if (unaryexp != null) {
                    unaryexp.output();
                }
                break;
        }
        OutputHandler.outALineWithoutEnter("<UnaryExp>\n");
    }
}
