package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.LVal;

public class LValParser implements CommonParser {
    private LVal lval;

    public LValParser() {
        lval = new LVal();
    }

    public LVal getResult() {
        return lval;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.IDENFR)) {    //Ident
            lval.loadIdent(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{'[' Exp  ']'}
            if (now == null || !now.getType().equals(Token.LBRACK)) {
                break;
            }
            lval.addLBrack(TokenOutput.getIndex());
            TokenOutput.forward();
            ExpParser expParser = new ExpParser();
            expParser.Analyzer();
            lval.addExp(expParser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RBRACK)) {
                lval.addRBrack(TokenOutput.getIndex());
                TokenOutput.forward();
            }
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("LVal Finished");
        }
    }
}
