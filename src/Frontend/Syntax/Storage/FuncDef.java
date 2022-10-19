package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class FuncDef implements MySyntaxTreeNode {
    private FuncType functype;
    private int identId;
    private int lparentId;
    private int rparentId;
    private FuncFParams funcfparams;
    private Block block;
    private NonFuncTable table;

    public FuncDef(NonFuncTable fa) {
        functype = null;
        identId = -1;
        lparentId = -1;
        rparentId = -1;
        funcfparams = null;
        block = null;
        table = new NonFuncTable(fa);
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

    //Error Process
    public NonFuncTable getTable() {
        return table;
    }

    public int getFuncTypeId() {
        return functype.getTypeId();
    }

    public Block getBlock() {
        return block;
    }
    //Error Process End

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
        OutputHandler.outALineWithoutEnter("<FuncDef>\n");
    }
}
