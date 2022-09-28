package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.PrimaryExp;

public class PrimaryExpParser implements CommonParser {
    private PrimaryExp primaryexp;

    public PrimaryExpParser() {
        primaryexp = new PrimaryExp();
    }

    public PrimaryExp getResult() {
        return primaryexp;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.LPARENT)) {   //'('
            primaryexp.setMode(PrimaryExp.EXP);
            primaryexp.loadLParent(TokenOutput.getIndex());
            TokenOutput.forward();
            ExpParser expParser = new ExpParser();  //EXP
            expParser.Analyzer();
            primaryexp.loadExp(expParser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RPARENT)) {   //')'
                primaryexp.loadRParent(TokenOutput.getIndex());
                TokenOutput.forward();
            }
        } else if (now != null && now.getType().equals(Token.INTCON)) { //Number
            primaryexp.setMode(PrimaryExp.NUMBER);
            NumberParser numberParser = new NumberParser();
            numberParser.Analyzer();
            primaryexp.loadNumber(numberParser.getResult());
        } else if (now != null) {   //LVal
            primaryexp.setMode(PrimaryExp.LVAL);
            LValParser lavalparser = new LValParser();
            lavalparser.Analyzer();
            primaryexp.loadLVal(lavalparser.getResult());
        }
        if (OutputHandler.debug) {
            System.out.println("PrimaryExp Finished");
        }
    }
}
