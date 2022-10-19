package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.RelExp;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class RelExpParser {
    private RelExp relexp;

    public RelExpParser() {
        relexp = new RelExp();
    }

    public RelExp getResult() {
        return relexp;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        AddExpParser addexpParser = new AddExpParser();
        addexpParser.Analyzer(table);
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
            addexpParser2.Analyzer(table);
            relexp.addAddExp(addexpParser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("RelExp Finished");
            System.out.println("Token=" + TokenOutput.getNowToken().getType());
        }
    }
}
