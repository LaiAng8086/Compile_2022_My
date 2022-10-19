package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.FuncFParams;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class FuncFParamsParser {
    private FuncFParams funcfparams;

    public FuncFParamsParser() {
        funcfparams = new FuncFParams();
    }

    public FuncFParams getResult() {
        return funcfparams;
    }

    public void Analyzer(String funcName, NonFuncTable table) throws IOException {
        Token now = TokenOutput.getNowToken();
        FuncFParamParser nowparser = new FuncFParamParser();    //FuncFParam
        nowparser.Analyzer(funcName, table);
        funcfparams.loadFirFuncFParam(nowparser.getResult());
        now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{',' FuncFParam}
            if (now == null || !now.getType().equals(Token.COMMA)) {
                break;
            }
            funcfparams.addComma(TokenOutput.getIndex());
            TokenOutput.forward();
            FuncFParamParser nowparser2 = new FuncFParamParser();
            nowparser2.Analyzer(funcName, table);
            funcfparams.addFuncFParam(nowparser2.getResult());
            now = TokenOutput.getNowToken();
        }
        if (OutputHandler.debug) {
            System.out.println("FuncFParams Finished");
        }
    }
}
