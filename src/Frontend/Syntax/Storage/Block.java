package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.Delayed;

public class Block implements MySyntaxTreeNode {
    private int lbraceId;
    private int rbraceId;
    private ArrayList<BlockItem> blockitems;

    public Block() {
        lbraceId = -1;
        rbraceId = -1;
        blockitems = new ArrayList<>();
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
        OutputHandler.outALine("<Block>\n");
    }
}
