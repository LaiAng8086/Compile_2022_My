package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class FuncRParams implements MySyntaxTreeNode {
    private Exp firexp;
    private ArrayList<Integer> commas;
    private ArrayList<Exp> exps;

    public FuncRParams() {
        firexp = null;
        commas = new ArrayList<>();
        exps = new ArrayList<>();
    }

    public void loadFirExp(Exp newn) {
        firexp = newn;
    }

    public void addComma(int newn) {
        commas.add(newn);
    }

    public void addExp(Exp newn) {
        exps.add(newn);
    }

    public void output() throws IOException {
        if (firexp != null) {
            firexp.output();
        }
        if (exps.size() > 0) {
            for (int i = 0; i < exps.size(); i++) {
                TokenOutput.outputById(commas.get(i));
                exps.get(i).output();
            }
        }
        OutputHandler.outALine("<FuncRParams>\n");
    }
}
