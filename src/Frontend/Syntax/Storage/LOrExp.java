package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class LOrExp implements MySyntaxTreeNode {
    private LAndExp firlandexp;
    private ArrayList<Integer> operas;
    private ArrayList<LAndExp> landexps;

    public LOrExp() {
        firlandexp = null;
        operas = new ArrayList<>();
        landexps = new ArrayList<>();
    }

    public void loadFirLAndExp(LAndExp newn) {
        firlandexp = newn;
    }

    public void addOpera(int newn) {
        operas.add(newn);
    }

    public void addLAndExp(LAndExp newn) {
        landexps.add(newn);
    }

    public void output() throws IOException {
        if (firlandexp != null) {
            firlandexp.output();
        }
        if (landexps.size() > 0) {
            for (int i = 0; i < landexps.size(); i++) {
                OutputHandler.outALineWithoutEnter("<LOrExp>\n");
                TokenOutput.outputById(operas.get(i));
                landexps.get(i).output();
            }
        }
        OutputHandler.outALineWithoutEnter("<LOrExp>\n");
    }
}
