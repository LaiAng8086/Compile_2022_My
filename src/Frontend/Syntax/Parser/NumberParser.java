package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.MyNumber;

public class NumberParser implements CommonParser {
    private MyNumber number;

    public NumberParser() {
        number = new MyNumber();
    }

    public MyNumber getResult() {
        return number;
    }

    public void Analyzer() {    //IntConst
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.INTCON)) {
            number.loadIntCon(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        if (OutputHandler.debug) {
            System.out.println("Number Finished");
        }
    }
}
