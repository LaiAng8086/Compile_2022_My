package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.CompUnit;

public class CompUnitParser implements CommonParser {
    private CompUnit compUnit;

    public CompUnitParser() {
        compUnit = new CompUnit();
    }

    public CompUnit getResult() {
        return compUnit;
    }

    public void Analyzer() {  //一旦失败，则尝试的都要放回。
        Token fir = TokenOutput.getNowToken();
        TokenOutput.forward();
        Token sec = TokenOutput.getNowToken();
        TokenOutput.forward();
        while (!TokenOutput.isEndOfTokens()) {
            if (fir.getType().equals(Token.CONSTTK) && sec.getType().equals(Token.INTTK)) {
                DeclParser nowDeclParser = new DeclParser();
                TokenOutput.backward();
                TokenOutput.backward();
                nowDeclParser.Analyzer();
                compUnit.addDecl(nowDeclParser.getResult());
            } else if (fir.getType().equals(Token.INTTK) && sec.getType().equals(Token.IDENFR)) {
                Token third = TokenOutput.getNowToken();
                TokenOutput.forward();
                if (!third.getType().equals(Token.LBRACK)) {
                    DeclParser nowDeclParser = new DeclParser();
                    TokenOutput.backward();
                    TokenOutput.backward();
                    TokenOutput.backward();
                    nowDeclParser.Analyzer();
                    compUnit.addDecl(nowDeclParser.getResult());
                } else {
                    TokenOutput.backward();
                    TokenOutput.backward();
                    TokenOutput.backward();
                    break; //may be func def.
                }
            } else {
                TokenOutput.backward();
                TokenOutput.backward();
                break;
            }
            fir = TokenOutput.getNowToken();
            TokenOutput.forward();
            sec = TokenOutput.getNowToken();
            TokenOutput.forward();
        }
        fir = TokenOutput.getNowToken();
        TokenOutput.forward();
        sec = TokenOutput.getNowToken();
        TokenOutput.forward();
        while (!TokenOutput.isEndOfTokens()) {
            if ((fir.getType().equals(Token.VOIDTK) || fir.getType().equals(Token.INTTK)) &&
                    sec.getType().equals(Token.IDENFR)) {
                FuncDefParser nowFuncDefParser = new FuncDefParser();
                TokenOutput.backward();
                TokenOutput.backward();
                nowFuncDefParser.Analyzer();
                compUnit.addFuncDef(nowFuncDefParser.getResult());
            } else {
                break;
            }
            fir = TokenOutput.getNowToken();
            TokenOutput.forward();
            sec = TokenOutput.getNowToken();
            TokenOutput.forward();
        }
        TokenOutput.backward();
        TokenOutput.backward();
        MainFuncDefParser mfdp = new MainFuncDefParser();
        mfdp.Analyzer();
        compUnit.loadMain(mfdp.getResult());
    }
}
