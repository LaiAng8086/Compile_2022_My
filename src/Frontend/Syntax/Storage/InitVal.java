package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class InitVal implements MySyntaxTreeNode {
    public static final int CHOICE1 = 1;    //单个变量
    public static final int CHOICE2 = 2;    //数组初值
    private int mode;
    private Exp exp;
    private int lbraceId;
    private int rbraceId;
    public InitVal firinitval;
    private ArrayList<Integer> commas;
    public ArrayList<InitVal> initvals;

    public InitVal() {
        mode = -1;
        exp = null;
        lbraceId = -1;
        rbraceId = -1;
        firinitval = null;
        commas = new ArrayList<>();
        initvals = new ArrayList<>();
    }

    public void setMode(int v) {
        mode = v;
    }

    public void loadExp(Exp newn) {
        exp = newn;
    }

    public void loadLbrace(int newn) {
        lbraceId = newn;
    }

    public void loadRbrace(int newn) {
        rbraceId = newn;
    }

    public void loadFirInitVal(InitVal newn) {
        firinitval = newn;
    }

    public void addComma(int newn) {
        commas.add(newn);
    }

    public void addInitVal(InitVal newn) {
        initvals.add(newn);
    }

    public int getMode() {
        return mode;
    }

    public Exp getExp() {
        return exp;
    }

    public void output() throws IOException {
        if (mode == CHOICE1) {
            if (exp != null) {
                exp.output();
            }
        } else if (mode == CHOICE2) {
            TokenOutput.outputById(lbraceId);
            if (firinitval != null) {
                firinitval.output();
            }
            if (initvals.size() > 0) {
                for (int i = 0; i < initvals.size(); i++) {
                    TokenOutput.outputById(commas.get(i));
                    initvals.get(i).output();
                }
            }
            TokenOutput.outputById(rbraceId);
        }
        OutputHandler.outALineWithoutEnter("<InitVal>\n");
    }
}
