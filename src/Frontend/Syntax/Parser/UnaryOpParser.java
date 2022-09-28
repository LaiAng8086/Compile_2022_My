package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.UnaryOp;

public class UnaryOpParser implements CommonParser {
    private UnaryOp unaryop;

    public UnaryOpParser() {
        unaryop = new UnaryOp();
    }

    public UnaryOp getResult() {
        return unaryop;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null && (now.getType().equals(Token.PLUS)
                || now.getType().equals(Token.MINU) || now.getType().equals(Token.NOT))) {
            unaryop.loadTypeId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        if(OutputHandler.debug) {
            System.out.println("UnaryOp Finished");
        }
    }
}
