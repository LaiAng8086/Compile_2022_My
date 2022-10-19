package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class FuncFParam implements MySyntaxTreeNode {
    private int btypeId;
    private int identId;
    private int lbrackId;
    private int rbrackId;
    private ArrayList<Integer> lbracks;
    private ArrayList<Integer> rbracks;
    private ArrayList<ConstExp> constexps;

    public FuncFParam() {
        btypeId = -1;
        identId = -1;
        lbrackId = -1;
        rbrackId = -1;
        lbracks = new ArrayList<>();
        rbracks = new ArrayList<>();
        constexps = new ArrayList<>();
    }

    public void loadBType(int newn) {
        btypeId = newn;
    }

    public void loadIdent(int newn) {
        identId = newn;
    }

    public void loadLBrack(int newn) {
        lbrackId = newn;
    }

    public void loadRBrack(int newn) {
        rbrackId = newn;
    }

    public void addLBrack(int newn) {  //注意区分！
        lbracks.add(newn);
    }

    public void addRBrack(int newn) {
        rbracks.add(newn);
    }

    public void addConstExp(ConstExp newn) {
        constexps.add(newn);
    }

    public void output() throws IOException {
        TokenOutput.outputById(btypeId);
        TokenOutput.outputById(identId);
        if (lbrackId != -1 && rbrackId != -1) {
            TokenOutput.outputById(lbrackId);
            TokenOutput.outputById(rbrackId);
            if (constexps.size() > 0) {
                for (int i = 0; i < constexps.size(); i++) {
                    TokenOutput.outputById(lbracks.get(i));
                    constexps.get(i).output();
                    TokenOutput.outputById(rbracks.get(i));
                }
            }
        }
        OutputHandler.outALineWithoutEnter("<FuncFParam>\n");
    }
}
