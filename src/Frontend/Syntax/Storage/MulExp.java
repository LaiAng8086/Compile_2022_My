package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class MulExp implements MySyntaxTreeNode {
    private UnaryExp firunaryexp;
    private ArrayList<Integer> operas;  //* / %
    private ArrayList<UnaryExp> unaryexps;

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

    public void output() throws IOException {
        if (firunaryexp != null) {
            firunaryexp.output();
        }
        if (unaryexps.size() > 0) {
            for (int i = 0; i < unaryexps.size(); i++) {
                OutputHandler.outALine("<MulExp>\n");
                TokenOutput.outputById(operas.get(i));
                unaryexps.get(i).output();
            }

        }
        OutputHandler.outALine("<MulExp>\n");
    }
}
