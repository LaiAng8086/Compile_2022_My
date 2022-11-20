package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class LAndExp implements MySyntaxTreeNode {
    public EqExp fireqexp;
    private ArrayList<Integer> operas;
    public ArrayList<EqExp> eqexps;

    public LAndExp() {
        fireqexp = null;
        operas = new ArrayList<>();
        eqexps = new ArrayList<>();
    }

    public void loadFirEqExp(EqExp newn) {
        fireqexp = newn;
    }

    public void addOpera(int newn) {
        operas.add(newn);
    }

    public void addEqExp(EqExp newn) {
        eqexps.add(newn);
    }

    public void output() throws IOException {
        if (fireqexp != null) {
            fireqexp.output();
        }
        if (eqexps.size() > 0) {
            for (int i = 0; i < eqexps.size(); i++) {
                OutputHandler.outALineWithoutEnter("<LAndExp>\n");
                TokenOutput.outputById(operas.get(i));
                eqexps.get(i).output();
            }
        }
        OutputHandler.outALineWithoutEnter("<LAndExp>\n");
    }
}
