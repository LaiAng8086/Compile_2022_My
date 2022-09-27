package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.AddExp;
import Frontend.Syntax.Storage.MulExp;

public class AddExpParser implements CommonParser {
    private AddExp addexp;

    public AddExpParser() {
        addexp = new AddExp();
    }

    public AddExp getResult() {
        return addexp;
    }

    public void Analyzer() {
        MulExpParser mulExpParser = new MulExpParser();
        mulExpParser.Analyzer();
        addexp.loadFirMulExp(mulExpParser.getResult());
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {
            if (now == null || !(now.getType().equals(Token.PLUS) || now.getType().equals(Token.MINU))) {
                break;
            }
            addexp.addOpera(TokenOutput.getIndex());
            TokenOutput.forward();
            MulExpParser mulexpParser2 = new MulExpParser();
            mulexpParser2.Analyzer();
            addexp.addMulExp(mulexpParser2.getResult());
            now = TokenOutput.getNowToken();
        }
    }
}
