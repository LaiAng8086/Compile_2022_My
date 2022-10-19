package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.FuncRParams;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class FuncRParamsParser {
    private FuncRParams funcrparams;

    public FuncRParamsParser(NonFuncTable table) {
        funcrparams = new FuncRParams(table);
    }

    public FuncRParams getResult() {
        return funcrparams;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        ExpParser expParser = new ExpParser();
        expParser.Analyzer(table);
        funcrparams.loadFirExp(expParser.getResult());  //Exp
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{',' Exp}
            if (now == null || !now.getType().equals(Token.COMMA)) {
                break;
            }
            funcrparams.addComma(TokenOutput.getIndex());
            TokenOutput.forward();
            ExpParser expParser2 = new ExpParser();
            expParser2.Analyzer(table);
            funcrparams.addExp(expParser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("FuncRParams Finished");
        }
    }
}
