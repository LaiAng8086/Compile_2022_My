package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class LVal implements MySyntaxTreeNode {
    private int identId;
    private ArrayList<Integer> lbracks;
    private ArrayList<Integer> rbracks;
    public ArrayList<Exp> exps;

    public LVal() {
        identId = -1;
        lbracks = new ArrayList<>();
        rbracks = new ArrayList<>();
        exps = new ArrayList<>();
    }

    public void loadIdent(int newn) {
        identId = newn;
    }

    public void addLBrack(int newn) {
        lbracks.add(newn);
    }

    public void addRBrack(int newn) {
        rbracks.add(newn);
    }

    public void addExp(Exp newn) {
        exps.add(newn);
    }

    //For Error Process
    public int getIdentId() {
        return identId;
    }

    public int getDimensions() {
        return lbracks.size();
    }

    //Error Process End
    public void output() throws IOException {
        TokenOutput.outputById(identId);
        if (exps.size() > 0) {
            for (int i = 0; i < exps.size(); i++) {
                TokenOutput.outputById(lbracks.get(i));
                exps.get(i).output();
                TokenOutput.outputById(rbracks.get(i));
            }
        }
        OutputHandler.outALineWithoutEnter("<LVal>\n");
    }
}
