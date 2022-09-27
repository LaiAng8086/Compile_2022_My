package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class ConstInitVal implements MySyntaxTreeNode {
    public static final int CHOICE1 = 1;
    public static final int CHOICE2 = 2;
    private int mode;  //choice1 = ConstExp, choice2 = {[ConstInitVal{,ConstInitVal}]}
    private ConstExp constexp;
    private int lbraceId;
    private int rbraceId;
    private ConstInitVal firconstinitval;
    private ArrayList<Integer> commas;
    private ArrayList<ConstInitVal> constinitvals;

    public ConstInitVal() {
        mode = -1;
        lbraceId = -1;
        rbraceId = -1;
        constexp = null;
        firconstinitval = null;
        commas = new ArrayList<>();
        constinitvals = new ArrayList<>();
    }

    public void setMode(int v) {
        mode = v;
    }

    public void loadConstExp(ConstExp newn) {
        constexp = newn;
    }

    public void loadLbrace(int newn) {
        lbraceId = newn;
    }

    public void loadRbrace(int newn) {
        rbraceId = newn;
    }

    public boolean checkFirConstInitVal() {  //empty returns true
        return firconstinitval == null;
    }

    public void loadfirConstInitVal(ConstInitVal newn) {
        firconstinitval = newn;
    }

    public void addComma(int newn) {
        commas.add(newn);
    }

    public void addConstInitVal(ConstInitVal newn) {
        constinitvals.add(newn);
    }

    public void output() throws IOException {
        if (mode == CHOICE1) {
            constexp.output();
        } else {
            TokenOutput.outputById(lbraceId);
            if (firconstinitval != null) {
                firconstinitval.output();
            }
            if (constinitvals.size() > 0) {
                for (int i = 0; i < constinitvals.size(); i++) {
                    TokenOutput.outputById(commas.get(i));
                    constinitvals.get(i).output();
                }
            }
            TokenOutput.outputById(rbraceId);
        }
        OutputHandler.outALine("<ConstInitVal>\n");
    }
}
