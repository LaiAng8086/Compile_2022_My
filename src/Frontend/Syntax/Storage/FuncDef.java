package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;

public class FuncDef implements MySyntaxTreeNode {
    private FuncType functype;
    private int identId;
    private int lparentId;
    private int rparentId;
    private FuncFParams funcfparams;
    private Block block;

    public FuncDef() {
        functype = null;
        identId = -1;
        lparentId = -1;
        rparentId = -1;
        funcfparams = null;
        block = null;
    }

    public void loadFuncType(FuncType newn) {
        functype = newn;
    }

    public void loadIdentId(int newn) {
        identId = newn;
    }

    public void loadLParentId(int newn) {
        lparentId = newn;
    }

    public void loadRParentId(int newn) {
        rparentId = newn;
    }

    public void loadFuncFParams(FuncFParams newn) {
        funcfparams = newn;
    }

    public void loadBlock(Block newn) {
        block = newn;
    }

    public void output() throws IOException {
        if (functype != null) {
            functype.output();
        }
        TokenOutput.outputById(identId);
        TokenOutput.outputById(lparentId);
        if (funcfparams != null) {
            funcfparams.output();
        }
        TokenOutput.outputById(rparentId);
        if (block != null) {
            block.output();
        }
        OutputHandler.outALine("<Funcdef>\n");
    }
}
