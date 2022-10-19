package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.MulExp;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class MulExpParser {
    private MulExp mulexp;

    public MulExpParser() {
        mulexp = new MulExp();
    }

    public MulExp getResult() {
        return mulexp;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        UnaryExpParser unaryexpParser = new UnaryExpParser();
        unaryexpParser.Analyzer(table);
        mulexp.loadFirUnaryExp(unaryexpParser.getResult()); //MulExp
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{('*'|'/'|'%') MulExp}
            if (now == null || !(now.getType().equals(Token.MULT) || now.getType().equals(Token.DIV)
                    || now.getType().equals(Token.MOD))) {
                break;
            }
            mulexp.addOpera(TokenOutput.getIndex());
            TokenOutput.forward();
            UnaryExpParser unaryexpParser2 = new UnaryExpParser();
            unaryexpParser2.Analyzer(table);
            mulexp.addUnaryExp(unaryexpParser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("MulExp Finished");
        }
    }
}
