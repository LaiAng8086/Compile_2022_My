package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class RelExp implements MySyntaxTreeNode {
    public AddExp firaddexp;
    public ArrayList<Integer> operas;
    public ArrayList<AddExp> addexps;

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
                OutputHandler.outALineWithoutEnter("<RelExp>\n");
                TokenOutput.outputById(operas.get(i));
                addexps.get(i).output();
            }
        }
        OutputHandler.outALineWithoutEnter("<RelExp>\n");
    }
}
