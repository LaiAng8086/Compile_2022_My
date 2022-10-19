package Frontend.Syntax.Parser;

import ErrorProcess.MyErrorCollector;
import ErrorProcess.MyErrorProcessor;
import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.LVal;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class LValParser {
    private LVal lval;

    public LValParser() {
        lval = new LVal();
    }

    public LVal getResult() {
        return lval;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.IDENFR)) {    //Ident
            lval.loadIdent(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        //Error Process c
        if (table.getItem(now.getContent()) == null) {
            MyErrorCollector.getUndefinedName(now.getLineNum());
        }
        //Error Process End.
        now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{'[' Exp  ']'}
            if (now == null || !now.getType().equals(Token.LBRACK)) {
                break;
            }
            lval.addLBrack(TokenOutput.getIndex());
            TokenOutput.forward();
            ExpParser expParser = new ExpParser();
            expParser.Analyzer(table);
            lval.addExp(expParser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RBRACK)) {
                lval.addRBrack(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                //Error Process k
                MyErrorProcessor.dealLackOfRBrack();
                //Error Process End.
            }
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("LVal Finished");
        }
    }
}
