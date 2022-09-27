package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class RelExp implements MySyntaxTreeNode {
    private AddExp firaddexp;
    private ArrayList<Integer> operas;
    private ArrayList<AddExp> addexps;

    public RelExp() {
        firaddexp = null;
        operas = new ArrayList<>();
        addexps = new ArrayList<>();
    }

    public void loadFirAddExp(AddExp newn) {
        firaddexp = newn;
    }

    public void addOpera(int newn) {
        operas.add(newn);
    }

    public void addAddExp(AddExp newn) {
        addexps.add(newn);
    }

    public void output() throws IOException {
        if (firaddexp != null) {
            firaddexp.output();
        }
        if (addexps.size() > 0) {
            for (int i = 0; i < addexps.size(); i++) {
                OutputHandler.outALine("<RelExp>\n");
                TokenOutput.outputById(operas.get(i));
                addexps.get(i).output();
            }
        }
        OutputHandler.outALine("<RelExp>\n");
    }
}
