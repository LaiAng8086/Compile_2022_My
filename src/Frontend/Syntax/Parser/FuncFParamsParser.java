package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.FuncFParams;

public class FuncFParamsParser implements CommonParser {
    private FuncFParams funcfparams;

    public FuncFParamsParser() {
        funcfparams = new FuncFParams();
    }

    public FuncFParams getResult() {
        return funcfparams;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        FuncFParamParser nowparser = new FuncFParamParser();    //FuncFParam
        nowparser.Analyzer();
        funcfparams.loadFirFuncFParam(nowparser.getResult());
        now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{',' FuncFParam}
            if (now == null || !now.getType().equals(Token.COMMA)) {
                break;
            }
            funcfparams.addComma(TokenOutput.getIndex());
            TokenOutput.forward();
            FuncFParamParser nowparser2 = new FuncFParamParser();
            nowparser2.Analyzer();
            funcfparams.addFuncFParam(nowparser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("FuncFParams Finished");
        }
    }
}
