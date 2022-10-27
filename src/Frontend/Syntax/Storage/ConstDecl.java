package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class ConstDecl implements MySyntaxTreeNode {
    private int conid;
    private int btypeid;
    public ConstDef firconstdef;
    private ArrayList<Integer> commas;
    public ArrayList<ConstDef> constdefs;
    private int semicnid;

    public ConstDecl() {
        conid = -1;
        btypeid = -1;
        firconstdef = null;
        commas = new ArrayList<>();
        constdefs = new ArrayList<>();
        semicnid = -1;
    }

    public void addConId(int newn) {
        conid = newn;
    }

    public void addBtypeId(int newn) {
        btypeid = newn;
    }

    public void loadFirConstDef(ConstDef newn) {
        firconstdef = newn;
    }

    public void addComma(int newn) {
        commas.add(newn);
    }

    public void addConstDef(ConstDef newn) {
        constdefs.add(newn);
    }

    public void addSemicnId(int newn) {
        semicnid = newn;
    }

    public String getType() {
        return TokenOutput.getTokenById(btypeid).getType();
    }

    public void output() throws IOException {
        TokenOutput.outputById(conid);
        TokenOutput.outputById(btypeid);
        if (firconstdef != null) {
            firconstdef.output();
        }
        if (constdefs.size() > 0) {
            for (int i = 0; i < constdefs.size(); i++) {
                TokenOutput.outputById(commas.get(i));
                constdefs.get(i).output();
            }
        }
        TokenOutput.outputById(semicnid);
        OutputHandler.outALineWithoutEnter("<ConstDecl>\n");
    }
}
