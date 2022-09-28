package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.ConstInitVal;

public class ConstInitValParser implements CommonParser {
    private ConstInitVal constinitval;

    public ConstInitValParser() {
        constinitval = new ConstInitVal();
    }

    public ConstInitVal getResult() {
        return constinitval;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null && !now.getType().equals(Token.LBRACE)) {   //ConstExp
            constinitval.setMode(ConstInitVal.CHOICE1);
            ConstExpParser nowparser = new ConstExpParser();
            nowparser.Analyzer();
            constinitval.loadConstExp(nowparser.getResult());
        } else if (now != null) {   //'{' [ ConstInitVal { ',' ConstInitVal } ] '}'
            constinitval.setMode(ConstInitVal.CHOICE2);
            constinitval.loadLbrace(TokenOutput.getIndex());    //'{'
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            if (now.getType().equals(Token.RBRACE)) {
                constinitval.loadRbrace(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                ConstInitValParser nowparser = new ConstInitValParser();
                nowparser.Analyzer();
                constinitval.loadfirConstInitVal(nowparser.getResult());
                now = TokenOutput.getNowToken();
                while (!TokenOutput.isEndOfTokens()) {  //{ ',' ConstInitVal }
                    if (now == null || !now.getType().equals(Token.COMMA)) {
                        break;
                    }
                    constinitval.addComma(TokenOutput.getIndex());
                    TokenOutput.forward();
                    ConstInitValParser nowparser2 = new ConstInitValParser();
                    nowparser2.Analyzer();
                    constinitval.addConstInitVal(nowparser2.getResult());
                    now = TokenOutput.getNowToken();
                }
                if (now != null && now.getType().equals(Token.RBRACE)) {
                    constinitval.loadRbrace(TokenOutput.getIndex());
                    TokenOutput.forward();
                }
            }
        }
        if (OutputHandler.debug) {
            System.out.println("ConstInitVal Finished");
        }
    }
}
