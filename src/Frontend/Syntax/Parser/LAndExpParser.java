package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.EqExp;
import Frontend.Syntax.Storage.LAndExp;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class LAndExpParser {
    private LAndExp landexp;

    public LAndExpParser() {
        landexp = new LAndExp();
    }

    public LAndExp getResult() {
        return landexp;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        EqExpParser eqexpParser = new EqExpParser();
        eqexpParser.Analyzer(table);
        landexp.loadFirEqExp(eqexpParser.getResult());  //EqExp
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{'&&' EqExp}
            if (now == null || !(now.getType().equals(Token.AND))) {
                break;
            }
            landexp.addOpera(TokenOutput.getIndex());
            TokenOutput.forward();
            EqExpParser eqexpParser2 = new EqExpParser();
            eqexpParser2.Analyzer(table);
            landexp.addEqExp(eqexpParser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("LAndExp Finished");
            System.out.println("Token=" + TokenOutput.getNowToken().getType());
        }
    }
}
