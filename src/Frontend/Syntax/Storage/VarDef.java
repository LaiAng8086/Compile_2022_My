package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class VarDef implements MySyntaxTreeNode {
    private int identId;
    private ArrayList<Integer> lbracks;
    private ArrayList<Integer> rbracks;
    private ArrayList<ConstExp> constexps;
    private int assignId;
    private InitVal initval;

    public VarDef() {
        identId = -1;
        lbracks = new ArrayList<>();
        rbracks = new ArrayList<>();
        constexps = new ArrayList<>();
        assignId = -1;
        initval = null;
    }

    public void loadIdentId(int newn) {
        identId = newn;
    }

    public void addLbrack(int newn) {
        lbracks.add(newn);
    }

    public void addRbrack(int newn) {
        rbracks.add(newn);
    }

    public void addConstExp(ConstExp newn) {
        constexps.add(newn);
    }

    public void loadAssignId(int newn) {
        assignId = newn;
    }

    public void loadInitVal(InitVal newn) {
        initval = newn;
    }

    //For Symbol Table
    public int getDimensions() {
        return lbracks.size();
    }
    //Symbol Table End.

    public void output() throws IOException {
        TokenOutput.outputById(identId);
        if (constexps.size() > 0) {
            for (int i = 0; i < constexps.size(); i++) {
                TokenOutput.outputById(lbracks.get(i));
                constexps.get(i).output();
                TokenOutput.outputById(rbracks.get(i));
            }
        }
        if (assignId != -1) {
            TokenOutput.outputById(assignId);
            if (initval != null) {
                initval.output();
            }
        }
        OutputHandler.outALineWithoutEnter("<VarDef>\n");
    }
}
