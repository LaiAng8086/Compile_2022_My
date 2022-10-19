package Frontend.Syntax.Parser;

import ErrorProcess.MyErrorProcessor;
import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.PrimaryExp;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class PrimaryExpParser {
    private PrimaryExp primaryexp;

    public PrimaryExpParser() {
        primaryexp = new PrimaryExp();
    }

    public PrimaryExp getResult() {
        return primaryexp;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.LPARENT)) {   //'('
            primaryexp.setMode(PrimaryExp.EXP);
            primaryexp.loadLParent(TokenOutput.getIndex());
            TokenOutput.forward();
            ExpParser expParser = new ExpParser();  //EXP
            expParser.Analyzer(table);
            primaryexp.loadExp(expParser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RPARENT)) {   //')'
                primaryexp.loadRParent(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                //Error Process j
                MyErrorProcessor.dealLackOfRParent();
                //Error Process End.
            }
        } else if (now != null && now.getType().equals(Token.INTCON)) { //Number
            primaryexp.setMode(PrimaryExp.NUMBER);
            NumberParser numberParser = new NumberParser();
            numberParser.Analyzer();
            primaryexp.loadNumber(numberParser.getResult());
        } else if (now != null) {   //LVal
            primaryexp.setMode(PrimaryExp.LVAL);
            LValParser lavalparser = new LValParser();
            lavalparser.Analyzer(table);
            primaryexp.loadLVal(lavalparser.getResult());
        }
        if (OutputHandler.debug) {
            System.out.println("PrimaryExp Finished");
        }
    }
}
