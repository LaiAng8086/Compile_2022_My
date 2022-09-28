package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.MulExp;

public class MulExpParser implements CommonParser {
    private MulExp mulexp;

    public MulExpParser() {
        mulexp = new MulExp();
    }

    public MulExp getResult() {
        return mulexp;
    }

    public void Analyzer() {
        UnaryExpParser unaryexpParser = new UnaryExpParser();
        unaryexpParser.Analyzer();
        mulexp.loadFirUnaryExp(unaryexpParser.getResult()); //MulExp
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{('*'|'/'|'%') MulExp}
            if (now == null || !(now.getType().equals(Token.MULT) || now.getType().equals(Token.DIV)
                    || now.getType().equals(Token.MOD))) {
                break;
            }
            mulexp.addOpera(TokenOutput.getIndex());
            TokenOutput.forward();
            UnaryExpParser unaryexpParser2 = new UnaryExpParser();
            unaryexpParser2.Analyzer();
            mulexp.addUnaryExp(unaryexpParser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("MulExp Finished");
        }
    }
}
