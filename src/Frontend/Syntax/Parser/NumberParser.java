package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.MyNumber;

public class NumberParser implements CommonParser {
    private MyNumber number;

    public NumberParser() {
        number = new MyNumber();
    }

    public MyNumber getResult() {
        return number;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.INTCON)) {
            number.loadIntCon(TokenOutput.getIndex());
            TokenOutput.forward();
        }
    }
}
