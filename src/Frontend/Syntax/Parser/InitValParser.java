package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.InitVal;

public class InitValParser implements CommonParser {
    private InitVal initval;

    public InitValParser() {
        initval = new InitVal();
    }

    public InitVal getResult() {
        return initval;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.LBRACE)) {    //'{'
            initval.setMode(InitVal.CHOICE2);
            initval.loadLbrace(TokenOutput.getIndex());
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RBRACE)) {
                initval.loadRbrace(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                InitValParser nowparser = new InitValParser();  //InitVal
                nowparser.Analyzer();
                initval.loadFirInitVal(nowparser.getResult());
                now = TokenOutput.getNowToken();
                while (!TokenOutput.isEndOfTokens()) {  //{',' InitVal}
                    if (now == null || !now.getType().equals(Token.COMMA)) {
                        break;
                    }
                    initval.addComma(TokenOutput.getIndex());
                    TokenOutput.forward();
                    InitValParser nowparser2 = new InitValParser();
                    nowparser2.Analyzer();
                    initval.addInitVal(nowparser2.getResult());
                    now = TokenOutput.getNowToken();
                }
                if (now != null && now.getType().equals(Token.RBRACE)) {    //'}'
                    initval.loadRbrace(TokenOutput.getIndex());
                    TokenOutput.forward();
                }
            }
        } else if (now != null) {   //Exp
            initval.setMode(InitVal.CHOICE1);
            ExpParser nowparser = new ExpParser();
            nowparser.Analyzer();
            initval.loadExp(nowparser.getResult());
        }
        if (OutputHandler.debug) {
            System.out.println("InitVal Finished");
        }
    }

}
