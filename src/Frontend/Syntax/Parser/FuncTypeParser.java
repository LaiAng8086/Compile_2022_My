package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.FuncType;

public class FuncTypeParser implements CommonParser {
    private FuncType functype;

    public FuncTypeParser() {
        functype = new FuncType();
    }

    public FuncType getResult() {
        return functype;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null && (now.getType().equals(Token.VOIDTK)
                || now.getType().equals(Token.INTTK))) {
            functype.loadTypeId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        if (OutputHandler.debug) {
            System.out.println("FuncType Finished");
        }
    }
}
