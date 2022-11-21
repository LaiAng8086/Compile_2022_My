package Frontend.Syntax.Storage;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class Stmt implements MySyntaxTreeNode, BlockItem {
    public static final int ASSIGN = 1;
    public static final int INPUT = 2;
    public static final int EXP = 3;
    public static final int BLOCK = 4;
    public static final int IF = 5;
    public static final int WHILE = 6;
    public static final int BREAK = 7;
    public static final int CONTINUE = 8;
    public static final int RETURN = 9;
    public static final int OUTPUT = 10;
    private int mode;
    private LVal lval;
    private int assignId;
    private Exp exp;
    private int semicnId;
    private int getintId;
    private int lparentId;
    private int rparentId;
    private Block block;
    private int ifId;
    private Cond cond;
    private int elseId;
    private Stmt stmt1;
    private Stmt elseStmt;
    private int whileId;
    private int breakId;
    private int continueId;
    private int returnId;
    private int printfId;
    private int strconId;
    private ArrayList<Integer> commas;
    private ArrayList<Exp> exps; //注意区分！

    public Stmt() {
        mode = -1;
        lval = null;
        assignId = -1;
        exp = null;
        semicnId = -1;
        getintId = -1;
        lparentId = -1;
        rparentId = -1;
        block = null;
        ifId = -1;
        cond = null;
        elseId = -1;
        stmt1 = null;
        elseStmt = null;
        whileId = -1;
        breakId = -1;
        continueId = -1;
        returnId = -1;
        printfId = -1;
        strconId = -1;
        commas = new ArrayList<>();
        exps = new ArrayList<>(); //注意区分！
    }

    public void setMode(int v) {
        mode = v;
    }

    public void loadLVal(LVal newn) {
        lval = newn;
    }

    public void loadAssignId(int newn) {
        assignId = newn;
    }

    public void loadExp(Exp newn) {  //注意區分！
        exp = newn;
    }

    public void loadSemicnId(int newn) {
        semicnId = newn;
    }

    public void loadGetintId(int newn) {
        getintId = newn;
    }

    public void loadLParentId(int newn) {
        lparentId = newn;
    }

    public void loadRParentId(int newn) {
        rparentId = newn;
    }

    public void loadBlock(Block newn) {
        block = newn;
    }

    public void loadIfId(int newn) {
        ifId = newn;
    }

    public void loadCond(Cond newn) {
        cond = newn;
    }

    public void loadElseId(int newn) {
        elseId = newn;
    }

    public void loadStmt(Stmt newn) {  //注意區分！
        stmt1 = newn;
    }

    public void loadElseStmt(Stmt newn) {
        elseStmt = newn;
    }

    public void loadWhileId(int newn) {
        whileId = newn;
    }

    public void loadBreakId(int newn) {
        breakId = newn;
    }

    public void loadContinueId(int newn) {
        continueId = newn;
    }

    public void loadReturnId(int newn) {
        returnId = newn;
    }

    public void loadPrintfId(int newn) {
        printfId = newn;
    }

    public void loadStrconId(int newn) {
        strconId = newn;
    }

    public void addComma(int newn) {
        commas.add(newn);
    }

    public void addExp(Exp newn) {//!!!注意區分，这是用在printf里得
        exps.add(newn);
    }  //注意区分！

    //For Error Process.
    public Token getFormatString() {
        return TokenOutput.getTokenById(strconId);
    }

    public int getPrintfExps() {
        return exps.size();
    }

    public Token getPrintfWord() {
        return TokenOutput.getTokenById(printfId);
    }

    public int getMode() {
        return mode;
    }

    public int getBreakId() {
        return breakId;
    }

    public int getContinueId() {
        return continueId;
    }
    //For Error Process end.

    public Exp getExp() {
        return exp;
    }

    public LVal getLval() {
        return lval;
    }

    public Block getBlock() {
        return block;
    }

    public Exp getExpById(int index) {
        return exps.get(index);
    }

    public int getExpsNum() {
        return exps.size();
    }

    public Cond getCond() {
        return cond;
    }

    public boolean hasElse() {
        return elseId != -1;
    }

    public Stmt getStmt1() {
        return stmt1;
    }

    public Stmt getElseStmt() {
        return elseStmt;
    }

    public void output() throws IOException {
        switch (mode) {
            case ASSIGN:
                if (lval != null) {
                    lval.output();
                }
                TokenOutput.outputById(assignId);
                if (exp != null) {
                    exp.output();
                }
                TokenOutput.outputById(semicnId);
                break;
            case INPUT:
                if (lval != null) {
                    lval.output();
                }
                TokenOutput.outputById(assignId);
                TokenOutput.outputById(getintId);
                TokenOutput.outputById(lparentId);
                TokenOutput.outputById(rparentId);
                TokenOutput.outputById(semicnId);
                break;
            case EXP:
                if (exp != null) {
                    exp.output();
                }
                TokenOutput.outputById(semicnId);
                break;
            case BLOCK:
                if (block != null) {
                    block.output();
                }
                break;
            case IF:
                TokenOutput.outputById(ifId);
                TokenOutput.outputById(lparentId);
                if (cond != null) {
                    cond.output();
                }
                TokenOutput.outputById(rparentId);
                if (stmt1 != null) {
                    stmt1.output();
                }
                if (elseId != -1) {
                    TokenOutput.outputById(elseId);
                    if (elseStmt != null) {
                        elseStmt.output();
                    }
                }
                break;
            case WHILE:
                TokenOutput.outputById(whileId);
                TokenOutput.outputById(lparentId);
                if (cond != null) {
                    cond.output();
                }
                TokenOutput.outputById(rparentId);
                if (stmt1 != null) {
                    stmt1.output();
                }
                break;
            case BREAK:
                TokenOutput.outputById(breakId);
                TokenOutput.outputById(semicnId);
                break;
            case CONTINUE:
                TokenOutput.outputById(continueId);
                TokenOutput.outputById(semicnId);
                break;
            case RETURN:
                TokenOutput.outputById(returnId);
                if (exp != null) {
                    exp.output();
                }
                TokenOutput.outputById(semicnId);
                break;
            case OUTPUT:
                TokenOutput.outputById(printfId);
                TokenOutput.outputById(lparentId);
                TokenOutput.outputById(strconId);
                if (exps.size() > 0) {
                    for (int i = 0; i < exps.size(); i++) {
                        TokenOutput.outputById(commas.get(i));
                        exps.get(i).output();
                    }
                }
                TokenOutput.outputById(rparentId);
                TokenOutput.outputById(semicnId);
                break;
            default:
        }
        OutputHandler.outALineWithoutEnter("<Stmt>\n");
    }
}
