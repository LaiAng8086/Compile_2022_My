package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.CompUnit;
import SymbolTable.adminTable;

import java.io.IOException;

public class CompUnitParser {
    private CompUnit compUnit;

    public CompUnitParser() {
        compUnit = new CompUnit();
    }

    public CompUnit getResult() {
        return compUnit;
    }

    public void Analyzer() throws IOException {  //一旦失败，则尝试的都要放回。
        Token fir = TokenOutput.getNowToken();
        TokenOutput.forward();
        Token sec = TokenOutput.getNowToken();
        TokenOutput.forward();
        while (!TokenOutput.isEndOfTokens()) {
            if (fir.getType().equals(Token.CONSTTK) && Token.isBType(sec.getType())) {  //ConstDecl
                DeclParser nowDeclParser = new DeclParser();
                TokenOutput.backward();
                TokenOutput.backward();
                nowDeclParser.Analyzer(adminTable.globalNonFunctable);  //Error Process.
                compUnit.addDecl(nowDeclParser.getResult());
            } else if (Token.isBType(fir.getType()) && sec.getType().equals(Token.IDENFR)) {    //VarDecl?
                Token third = TokenOutput.getNowToken();
                TokenOutput.forward();
                if (!third.getType().equals(Token.LPARENT)) {
                    DeclParser nowDeclParser = new DeclParser();
                    TokenOutput.backward();
                    TokenOutput.backward();
                    TokenOutput.backward();
                    nowDeclParser.Analyzer(adminTable.globalNonFunctable);  //Error Process.
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
        while (!TokenOutput.isEndOfTokens()) {  //{FuncDef}
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
        MainFuncDefParser mfdp = new MainFuncDefParser();   //MainFuncDef
        mfdp.Analyzer();
        compUnit.loadMain(mfdp.getResult());
    }
}
