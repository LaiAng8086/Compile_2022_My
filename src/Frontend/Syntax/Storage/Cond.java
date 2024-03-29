package Frontend.Syntax.Storage;

import Frontend.OutputHandler;

import java.io.IOException;

public class Cond implements MySyntaxTreeNode {
    private LOrExp lorexp;

    public Cond() {
        lorexp = null;
    }

    public void loadLorExp(LOrExp newn) {
        lorexp = newn;
    }

    public LOrExp getLorExp() {
        return lorexp;
    }

    public void output() throws IOException {
        if (lorexp != null) {
            lorexp.output();
        }
        OutputHandler.outALineWithoutEnter("<Cond>\n");
    }
}
