package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class FuncFParams implements MySyntaxTreeNode {
    public FuncFParam firfuncfparam;
    public ArrayList<Integer> commas;
    public ArrayList<FuncFParam> funcfparams;

    public FuncFParams() {
        firfuncfparam = null;
        commas = new ArrayList<>();
        funcfparams = new ArrayList<>();
    }

    public void loadFirFuncFParam(FuncFParam newn) {
        firfuncfparam = newn;
    }

    public boolean checkFirFuncFParam() {
        return firfuncfparam == null;
    }

    public void addComma(int newn) {
        commas.add(newn);
    }

    public void addFuncFParam(FuncFParam newn) {
        funcfparams.add(newn);
    }

    public void output() throws IOException {
        if (firfuncfparam != null) {
            firfuncfparam.output();
        }
        if (funcfparams.size() > 0) {
            for (int i = 0; i < funcfparams.size(); i++) {
                TokenOutput.outputById(commas.get(i));
                funcfparams.get(i).output();
            }
        }
        OutputHandler.outALine("<FuncFParams>\n");
    }
}
