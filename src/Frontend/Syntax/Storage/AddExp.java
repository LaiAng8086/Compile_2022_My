package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class AddExp implements MySyntaxTreeNode {
    private MulExp firmulexp;
    private ArrayList<Integer> operas;
    private ArrayList<MulExp> mulexps;

    public AddExp() {
        firmulexp = null;
        operas = new ArrayList<>();
        mulexps = new ArrayList<>();
    }

    public MulExp getFirmulexp() {  //specially for Stmt Parser.
        return firmulexp;
    }

    public void loadFirMulExp(MulExp newn) {
        firmulexp = newn;
    }

    public void addOpera(int newn) {
        operas.add(newn);
    }

    public void addMulExp(MulExp newn) {
        mulexps.add(newn);
    }

    //For Error Process
    public boolean isSingle() {
        return firmulexp != null && mulexps.size() == 0;
    }
    //Error Process End

    public void output() throws IOException {
        if (firmulexp != null) {
            firmulexp.output();
        }
        if (mulexps.size() > 0) {
            for (int i = 0; i < mulexps.size(); i++) {
                OutputHandler.outALineWithoutEnter("<AddExp>\n");
                TokenOutput.outputById(operas.get(i));
                mulexps.get(i).output();
            }
        }
        OutputHandler.outALineWithoutEnter("<AddExp>\n");
    }
}
