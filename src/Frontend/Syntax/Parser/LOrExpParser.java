package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.LOrExp;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class LOrExpParser {
    private LOrExp lorexp;

    public LOrExpParser() {
        lorexp = new LOrExp();
    }

    public LOrExp getResult() {
        return lorexp;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        LAndExpParser landexpParser = new LAndExpParser();
        landexpParser.Analyzer(table);
        lorexp.loadFirLAndExp(landexpParser.getResult());   //LAndExp
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{'||' LAndExp}
            if (now == null || !now.getType().equals(Token.OR)) {
                break;
            }
            lorexp.addOpera(TokenOutput.getIndex());
            TokenOutput.forward();
            LAndExpParser landexpParser2 = new LAndExpParser();
            landexpParser2.Analyzer(table);
            lorexp.addLAndExp(landexpParser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("LOrExp Finished");
            System.out.println("Token=" + TokenOutput.getNowToken().getType());
        }
    }
}
