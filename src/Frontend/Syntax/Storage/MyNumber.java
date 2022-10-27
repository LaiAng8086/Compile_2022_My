package Frontend.Syntax.Storage;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;

import java.io.IOException;

public class MyNumber implements MySyntaxTreeNode {
    private int intconId;

    public MyNumber() {
        intconId = -1;
    }

    public void loadIntCon(int newn) {
        intconId = newn;
    }

    public String getNumber() {
        return TokenOutput.getTokenById(intconId).getContent();
    }

    public void output() throws IOException {
        TokenOutput.outputById(intconId);
        OutputHandler.outALineWithoutEnter("<Number>\n");
    }
}
