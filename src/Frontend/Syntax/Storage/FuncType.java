package Frontend.Syntax.Storage;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;

public class FuncType implements MySyntaxTreeNode {
    private int typeId;

    public FuncType() {
        typeId = -1;
    }

    public void loadTypeId(int newn) {
        typeId = newn;
    }

    public void output() throws IOException {
        TokenOutput.outputById(typeId);
        OutputHandler.outALine("<FuncType>\n");
    }
}
