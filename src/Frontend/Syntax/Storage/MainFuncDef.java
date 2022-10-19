package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import SymbolTable.NonFuncTable;
import SymbolTable.adminTable;

import java.io.IOException;

public class MainFuncDef implements MySyntaxTreeNode {
    private int inttkId;
    private int mainId;
    private int lparentId;
    private int rparentId;
    private Block block;
    private NonFuncTable table;

    public MainFuncDef() {
        inttkId = -1;
        mainId = -1;
        lparentId = -1;
        rparentId = -1;
        table = new NonFuncTable(adminTable.globalNonFunctable);
    }

    public void loadInttkId(int newn) {
        inttkId = newn;
    }

    public void loadMainId(int newn) {
        mainId = newn;
    }

    public void loadLparentId(int newn) {
        lparentId = newn;
    }

    public void loadRparentId(int newn) {
        rparentId = newn;
    }

    public void loadBlock(Block newn) {
        block = newn;
    }

    //For Error Process
    public NonFuncTable getTable() {
        return table;
    }

    public int getInttkId() {
        return inttkId;
    }

    public Block getBlock() {
        return block;
    }

    public int getRparentId() {
        return rparentId;
    }

    //Error Process End
    public void output() throws IOException {
        TokenOutput.outputById(inttkId);
        TokenOutput.outputById(mainId);
        TokenOutput.outputById(lparentId);
        TokenOutput.outputById(rparentId);
        if (block != null) {
            block.output();
        }
        OutputHandler.outALineWithoutEnter("<MainFuncDef>\n");
    }
}
