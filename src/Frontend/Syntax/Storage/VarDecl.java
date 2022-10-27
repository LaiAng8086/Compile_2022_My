package Frontend.Syntax.Storage;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class VarDecl implements MySyntaxTreeNode {
    private int btypeId;
    public VarDef firvardef;
    private ArrayList<Integer> commas;
    public ArrayList<VarDef> vardefs;
    private int semicnId;

    public VarDecl() {
        btypeId = -1;
        firvardef = null;
        commas = new ArrayList<>();
        vardefs = new ArrayList<>();
        semicnId = -1;
    }

    public void loadBtype(int newn) {
        btypeId = newn;
    }

    public void loadFirVarDef(VarDef newn) {
        firvardef = newn;
    }

    public boolean checkFirVarDef() {
        return firvardef == null;
    }

    public void addComma(int newn) {
        commas.add(newn);
    }

    public void addVarDef(VarDef newn) {
        vardefs.add(newn);
    }

    public void loadSemicn(int newn) {
        semicnId = newn;
    }

    public String getType() {
        return TokenOutput.getTokenById(btypeId).getType();
    }

    public void output() throws IOException {
        TokenOutput.outputById(btypeId);
        if (firvardef != null) {
            firvardef.output();
        }
        if (vardefs.size() > 0) {
            for (int i = 0; i < vardefs.size(); i++) {
                TokenOutput.outputById(commas.get(i));
                vardefs.get(i).output();
            }
        }
        TokenOutput.outputById(semicnId);
        OutputHandler.outALineWithoutEnter("<VarDecl>\n");
    }

}
