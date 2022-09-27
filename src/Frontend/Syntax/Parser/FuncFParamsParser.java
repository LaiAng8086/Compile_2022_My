package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
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
        FuncFParamParser nowparser = new FuncFParamParser();
        nowparser.Analyzer();
        funcfparams.loadFirFuncFParam(nowparser.getResult());
        now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {
            if (now == null || !now.getType().equals(Token.COMMA)) {
                break;
            }
            funcfparams.addComma(TokenOutput.getIndex());
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            FuncFParamParser nowparser2 = new FuncFParamParser();
            nowparser2.Analyzer();
            funcfparams.addFuncFParam(nowparser2.getResult());
            now = TokenOutput.getNowToken();
        }
    }
}
