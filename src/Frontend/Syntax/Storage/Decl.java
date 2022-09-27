package Frontend.Syntax.Storage;

import Frontend.OutputHandler;

import java.io.IOException;

public class Decl implements MySyntaxTreeNode, BlockItem {
    private int decltype;
    private ConstDecl constdecl;
    private VarDecl vardecl;

    public Decl() {
        constdecl = null;
        vardecl = null;
        decltype = -1;  //1 for const 2 for var
    }

    public void loadConst(ConstDecl newn) {
        constdecl = newn;
        decltype = 1;
    }

    public void loadVar(VarDecl newn) {
        vardecl = newn;
        decltype = 2;
    }

    public void output() throws IOException {
        if (decltype == 1) {
            constdecl.output();
        } else if (decltype == 2) {
            vardecl.output();
        }
    }
}
