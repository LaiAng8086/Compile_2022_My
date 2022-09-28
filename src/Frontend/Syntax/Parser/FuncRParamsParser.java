package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.FuncRParams;

public class FuncRParamsParser implements CommonParser {
    private FuncRParams funcrparams;

    public FuncRParamsParser() {
        funcrparams = new FuncRParams();
    }

    public FuncRParams getResult() {
        return funcrparams;
    }

    public void Analyzer() {
        ExpParser expParser = new ExpParser();
        expParser.Analyzer();
        funcrparams.loadFirExp(expParser.getResult());  //Exp
        Token now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{',' Exp}
            if (now == null || !now.getType().equals(Token.COMMA)) {
                break;
            }
            funcrparams.addComma(TokenOutput.getIndex());
            TokenOutput.forward();
            ExpParser expParser2 = new ExpParser();
            expParser2.Analyzer();
            funcrparams.addExp(expParser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("FuncRParams Finished");
        }
    }
}
