package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import SymbolTable.NonFuncTable;

import java.io.IOException;
import java.util.ArrayList;

public class Block implements MySyntaxTreeNode {
    private int lbraceId;
    private int rbraceId;
    private ArrayList<BlockItem> blockitems;
    private NonFuncTable table;
    private boolean isFuncBlock;

    public Block(boolean funcblock, NonFuncTable fa) {
        lbraceId = -1;
        rbraceId = -1;
        blockitems = new ArrayList<>();
        if (funcblock) {
            table = fa;
            isFuncBlock = true;
        } else {
            isFuncBlock = false;
            table = new NonFuncTable(fa);
        }
    }

    public void loadLBrace(int newn) {
        lbraceId = newn;
    }

    public void loadRBrace(int newn) {
        rbraceId = newn;
    }

    public void addBlockItem(BlockItem newn) {
        blockitems.add(newn);
    }

    //For Error Process
    public BlockItem getLastStmt() {
        int length = blockitems.size();
        if (length == 0) {
            return null;
        }
        return blockitems.get(length - 1);
    }

    public NonFuncTable getTable() {
        return table;
    }

    public int getRbraceId() {
        return rbraceId;
    }
    //Error Process End.

    public void output() throws IOException {
        TokenOutput.outputById(lbraceId);
        if (blockitems.size() > 0) {
            for (BlockItem t : blockitems) {
                if (t instanceof Decl) {
                    ((Decl) t).output();
                } else if (t instanceof Stmt) {
                    ((Stmt) t).output();
                }
            }
        }
        TokenOutput.outputById(rbraceId);
        OutputHandler.outALineWithoutEnter("<Block>\n");
    }
}
