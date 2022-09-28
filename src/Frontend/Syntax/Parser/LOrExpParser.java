package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.LOrExp;

public class LOrExpParser implements CommonParser {
    private LOrExp lorexp;

    public LOrExpParser() {
        lorexp = new LOrExp();
    }

    public LOrExp getResult() {
        return lorexp;
    }

    public void Analyzer() {
        LAndExpParser landexpParser = new LAndExpParser();
        landexpParser.Analyzer();
        lorexp.loadFirLAndExp(landexpParser.getResult());   //LAndExp
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{'||' LAndExp}
            if (now == null || !now.getType().equals(Token.OR)) {
                break;
            }
            lorexp.addOpera(TokenOutput.getIndex());
            TokenOutput.forward();
            LAndExpParser landexpParser2 = new LAndExpParser();
            landexpParser2.Analyzer();
            lorexp.addLAndExp(landexpParser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("LOrExp Finished");
            System.out.println("Token=" + TokenOutput.getNowToken().getType());
        }
    }
}