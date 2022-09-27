package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.EqExp;
import Frontend.Syntax.Storage.LAndExp;

public class LAndExpParser implements CommonParser {
    private LAndExp landexp;

    public LAndExpParser() {
        landexp = new LAndExp();
    }

    public LAndExp getResult() {
        return landexp;
    }

    public void Analyzer() {
        EqExpParser eqexpParser = new EqExpParser();
        eqexpParser.Analyzer();
        landexp.loadFirEqExp(eqexpParser.getResult());
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {
            if (now == null || !(now.getType().equals(Token.AND))) {
                break;
            }
            landexp.addOpera(TokenOutput.getIndex());
            TokenOutput.forward();
            EqExpParser eqexpParser2 = new EqExpParser();
            eqexpParser2.Analyzer();
            landexp.addEqExp(eqexpParser2.getResult());
            now = TokenOutput.getNowToken();
        }
    }
}
