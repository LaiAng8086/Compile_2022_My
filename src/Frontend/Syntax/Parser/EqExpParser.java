package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.EqExp;
import Frontend.Syntax.Storage.RelExp;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class EqExpParser {
    private EqExp eqexp;

    public EqExpParser() {
        eqexp = new EqExp();
    }

    public EqExp getResult() {
        return eqexp;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        RelExpParser relexpParser = new RelExpParser();
        relexpParser.Analyzer(table);
        eqexp.loadFirRelExp(relexpParser.getResult());  //RelExp
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{('=='|'!=') RelExp}
            if (now == null || !(now.getType().equals(Token.EQL) || now.getType().equals(Token.NEQ))) {
                break;
            }
            eqexp.addOpera(TokenOutput.getIndex());
            TokenOutput.forward();
            RelExpParser relexpParser2 = new RelExpParser();
            relexpParser2.Analyzer(table);
            eqexp.addRelExp(relexpParser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("EqExp Finished");
            System.out.println("Token=" + TokenOutput.getNowToken().getType());
        }
    }
}
