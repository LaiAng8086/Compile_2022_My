package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;

public class LVal implements MySyntaxTreeNode {
    private int identId;
    private ArrayList<Integer> lbracks;
    private ArrayList<Integer> rbracks;
    private ArrayList<Exp> exps;

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

    public void output() throws IOException {
        TokenOutput.outputById(identId);
        if (exps.size() > 0) {
            for (int i = 0; i < exps.size(); i++) {
                exps.get(i).output();
            }
        }
        OutputHandler.outALine("<LVal>\n");
    }
}
