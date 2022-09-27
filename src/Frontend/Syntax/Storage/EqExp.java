package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class EqExp implements MySyntaxTreeNode {
    private RelExp firrelexp;
    private ArrayList<Integer> operas;
    private ArrayList<RelExp> relexps;

    public EqExp() {
        firrelexp = null;
        operas = new ArrayList<>();
        relexps = new ArrayList<>();
    }

    public void loadFirRelExp(RelExp newn) {
        firrelexp = newn;
    }

    public void addOpera(int newn) {
        operas.add(newn);
    }

    public void addRelExp(RelExp newn) {
        relexps.add(newn);
    }

    public void output() throws IOException {
        if (firrelexp != null) {
            firrelexp.output();
        }
        if (relexps.size() > 0) {
            for (int i = 0; i < relexps.size(); i++) {
                OutputHandler.outALine("<EqExp>\n");
                TokenOutput.outputById(operas.get(i));
                relexps.get(i).output();
            }
        }
        OutputHandler.outALine("<EqExp>\n");
    }
}
