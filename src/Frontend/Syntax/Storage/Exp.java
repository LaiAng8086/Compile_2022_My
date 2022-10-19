package Frontend.Syntax.Storage;

import Frontend.OutputHandler;

import java.io.IOException;

public class Exp implements MySyntaxTreeNode {
    private AddExp addexp;

    public Exp() {
        addexp = null;
    }

    public AddExp getAddexp() {  //specially for Stmt Parser.
        return addexp;
    }

    public void loadAddexp(AddExp newn) {
        addexp = newn;
    }

    public void output() throws IOException {
        if (addexp != null) {
            addexp.output();
        }
        OutputHandler.outALineWithoutEnter("<Exp>\n");
    }
}
