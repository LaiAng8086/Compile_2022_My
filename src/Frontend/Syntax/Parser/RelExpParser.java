package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.RelExp;

public class RelExpParser implements CommonParser {
    private RelExp relexp;

    public RelExpParser() {
        relexp = new RelExp();
    }

    public RelExp getResult() {
        return relexp;
    }

    public void Analyzer() {
        AddExpParser addexpParser = new AddExpParser();
        addexpParser.Analyzer();
        relexp.loadFirAddExp(addexpParser.getResult()); //AddExp
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{('<' | '>' | '<=' | '>=') AddExp}
            if (now == null || !(now.getType().equals(Token.LSS) || now.getType().equals(Token.GRE) ||
                    now.getType().equals(Token.LEQ) || now.getType().equals(Token.GEQ))) {
                break;
            }
            relexp.addOpera(TokenOutput.getIndex());
            TokenOutput.forward();
            AddExpParser addexpParser2 = new AddExpParser();
            addexpParser2.Analyzer();
            relexp.addAddExp(addexpParser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("RelExp Finished");
            System.out.println("Token=" + TokenOutput.getNowToken().getType());
        }
    }
}