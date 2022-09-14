package Frontend.Lexer;

import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class TokenOutput {
    private ArrayList<Token> tokens;

    public TokenOutput() {
        tokens = new ArrayList<>();
    }

    public void addToken(Token newn) {
        tokens.add(newn);
    }

    public void output() throws IOException {
        for (Token t : tokens) {
            t.output();
        }
        OutputHandler.endOutput();
    }
}
