package Frontend.Syntax.Storage;

import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class CompUnit implements MySyntaxTreeNode {
    public ArrayList<Decl> decls;
    public ArrayList<FuncDef> funcdefs;
    public MainFuncDef main;

    public CompUnit() {
        decls = new ArrayList<>();
        funcdefs = new ArrayList<>();
        main = null;
    }

    public void addDecl(Decl newn) {
        decls.add(newn);
    }

    public void addFuncDef(FuncDef newn) {
        funcdefs.add(newn);
    }

    public void loadMain(MainFuncDef newn) {
        main = newn;
    }

    public void output() throws IOException {
        if (decls.size() > 0) {
            for (int i = 0; i < decls.size(); i++) {
                decls.get(i).output();
            }
        }
        if (funcdefs.size() > 0) {
            for (int i = 0; i < funcdefs.size(); i++) {
                funcdefs.get(i).output();
            }
        }
        if (main != null) {
            main.output();
        }
        OutputHandler.outALineWithoutEnter("<CompUnit>\n");
    }
}
