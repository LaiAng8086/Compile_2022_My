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

    //Error Process
    public int getTypeId() {
        return typeId;
    }
    //Error Process End

    public void output() throws IOException {
        TokenOutput.outputById(typeId);
        OutputHandler.outALineWithoutEnter("<FuncType>\n");
    }
}
