package Frontend.Syntax.Storage;

import Frontend.OutputHandler;

import java.io.IOException;

public class ConstExp implements MySyntaxTreeNode {
    private AddExp addexp;

    public ConstExp() {
        addexp = null;
    }

    public void loadAddExp(AddExp newn) {
        addexp = newn;
    }

    public void output() throws IOException {
        if (addexp != null) {
            addexp.output();
        }
        OutputHandler.outALineWithoutEnter("<ConstExp>\n");
    }
}
