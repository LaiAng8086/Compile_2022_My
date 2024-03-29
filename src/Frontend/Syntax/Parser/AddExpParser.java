package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.AddExp;
import Frontend.Syntax.Storage.MulExp;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class AddExpParser {
    private AddExp addexp;

    public AddExpParser() {
        addexp = new AddExp();
    }

    public AddExp getResult() {
        return addexp;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        MulExpParser mulExpParser = new MulExpParser();
        mulExpParser.Analyzer(table);
        addexp.loadFirMulExp(mulExpParser.getResult());  //MulExp
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{('+'/'-') MulExp }
            if (now == null || !(now.getType().equals(Token.PLUS) || now.getType().equals(Token.MINU))) {
                break;
            }
            addexp.addOpera(TokenOutput.getIndex());
            TokenOutput.forward();
            MulExpParser mulexpParser2 = new MulExpParser();
            mulexpParser2.Analyzer(table);
            addexp.addMulExp(mulexpParser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("AddExpParser Finished");
            System.out.println("Token=" + TokenOutput.getNowToken().getType());
        }
    }
}
