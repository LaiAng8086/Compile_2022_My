package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.ConstExp;
import Frontend.Syntax.Storage.FuncFParam;

public class FuncFParamParser implements CommonParser {
    private FuncFParam funcfparam;

    public FuncFParamParser() {
        funcfparam = new FuncFParam();
    }

    public FuncFParam getResult() {
        return funcfparam;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null && Token.isBType(Token.INTTK)) {    //BType
            funcfparam.loadBType(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.IDENFR)) {    //Ident
            funcfparam.loadIdent(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.LBRACK)) {    //[ '['']' { '[' ConstExp ']'} ]
            funcfparam.loadLBrack(TokenOutput.getIndex());
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RBRACK)) {
                funcfparam.loadRBrack(TokenOutput.getIndex());
                TokenOutput.forward();
                now = TokenOutput.getNowToken();
                while (!TokenOutput.isEndOfTokens()) {
                    if (now == null || !now.getType().equals(Token.LBRACK)) {
                        break;
                    }
                    funcfparam.addLBrack(TokenOutput.getIndex());
                    TokenOutput.forward();
                    ConstExpParser nowparser = new ConstExpParser();
                    nowparser.Analyzer();
                    funcfparam.addConstExp(nowparser.getResult());
                    now = TokenOutput.getNowToken();
                    if (now != null && now.getType().equals(Token.RBRACK)) {
                        funcfparam.addRBrack(TokenOutput.getIndex());
                        TokenOutput.forward();
                    }
                    now = TokenOutput.getNowToken();
                }
            }
        }
        if (OutputHandler.debug) {
            System.out.println("FuncFParam Finished");
        }
    }
}
