package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;

public class UnaryOp implements MySyntaxTreeNode {
    private int typeId;

    public UnaryOp() {
        typeId = -1;
    }

    public void loadTypeId(int newn) {
        typeId = newn;
    }

    public void output() throws IOException {
        if (typeId != -1) {
            TokenOutput.outputById(typeId);
        }
        OutputHandler.outALine("<UnaryOp>\n");
    }
}
