package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class MulExp implements MySyntaxTreeNode {
    private UnaryExp firunaryexp;
    public ArrayList<Integer> operas;  //* / %
    public ArrayList<UnaryExp> unaryexps;

    public MulExp() {
        firunaryexp = null;
        operas = new ArrayList<>();
        unaryexps = new ArrayList<>();
    }

    public UnaryExp getFirunaryexp() {  //specially for Stmt Parser.
        return firunaryexp;
    }

    public void loadFirUnaryExp(UnaryExp newn) {
        firunaryexp = newn;
    }

    public void addOpera(int newn) {
        operas.add(newn);
    }

    public void addUnaryExp(UnaryExp newn) {
        unaryexps.add(newn);
    }

    //For Error Process
    public boolean isSingle() {
        return firunaryexp != null && unaryexps.size() == 0;
    }
    //Error Process End

    public void output() throws IOException {
        if (firunaryexp != null) {
            firunaryexp.output();
        }
        if (unaryexps.size() > 0) {
            for (int i = 0; i < unaryexps.size(); i++) {
                OutputHandler.outALineWithoutEnter("<MulExp>\n");
                TokenOutput.outputById(operas.get(i));
                unaryexps.get(i).output();
            }

        }
        OutputHandler.outALineWithoutEnter("<MulExp>\n");
    }
}
