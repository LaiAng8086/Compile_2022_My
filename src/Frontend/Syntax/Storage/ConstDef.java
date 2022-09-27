package Frontend.Syntax.Storage;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;

public class ConstDef implements MySyntaxTreeNode {
    private int identId;
    private ArrayList<Integer> lbrackId;
    private ArrayList<Integer> rbrackId;
    private ArrayList<ConstExp> constexps;
    private int assignId;
    private ConstInitVal constinitval;

    public ConstDef() {
        identId = -1;
        lbrackId = new ArrayList<>();
        rbrackId = new ArrayList<>();
        constexps = new ArrayList<>();
        assignId = -1;
        constinitval = null;
    }

    public void loadIdent(int newn) {
        identId = newn;
    }

    public void addLbrack(int newn) {
        lbrackId.add(newn);
    }

    public void addRbrack(int newn) {
        rbrackId.add(newn);
    }

    public void addConstExp(ConstExp newn) {
        constexps.add(newn);
    }

    public void loadAssign(int newn) {
        assignId = newn;
    }

    public void loadConstInitVal(ConstInitVal newn) {
        constinitval = newn;
    }

    public void output() throws IOException {
        TokenOutput.outputById(identId);
        if (lbrackId.size() > 0) {
            for (int i = 0; i < lbrackId.size(); i++) {
                TokenOutput.outputById(lbrackId.get(i));
                constexps.get(i).output();
                TokenOutput.outputById(rbrackId.get(i));
            }
        }
        TokenOutput.outputById(assignId);
        if (constinitval != null) {
            constinitval.output();
        }
        OutputHandler.outALine("<ConstDef>\n");
    }
}
