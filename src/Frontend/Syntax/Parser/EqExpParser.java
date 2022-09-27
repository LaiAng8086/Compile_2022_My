package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.EqExp;
import Frontend.Syntax.Storage.RelExp;

public class EqExpParser implements CommonParser {
    private EqExp eqexp;

    public EqExpParser() {
        eqexp = new EqExp();
    }

    public EqExp getResult() {
        return eqexp;
    }

    public void Analyzer() {
        RelExpParser relexpParser = new RelExpParser();
        relexpParser.Analyzer();
        eqexp.loadFirRelExp(relexpParser.getResult());
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {
            if (now == null || !(now.getType().equals(Token.EQL) || now.getType().equals(Token.NEQ))) {
                break;
            }
            eqexp.addOpera(TokenOutput.getIndex());
            TokenOutput.forward();
            RelExpParser relexpParser2 = new RelExpParser();
            relexpParser2.Analyzer();
            eqexp.addRelExp(relexpParser2.getResult());
            now = TokenOutput.getNowToken();
        }
    }
}
