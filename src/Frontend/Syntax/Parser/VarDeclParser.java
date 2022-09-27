package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.VarDecl;
import Frontend.Syntax.Storage.VarDef;

public class VarDeclParser implements CommonParser {
    private VarDecl vardecl;

    public VarDeclParser() {
        vardecl = new VarDecl();
    }

    public VarDecl getResult() {
        return vardecl;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.INTTK)) {
            vardecl.loadBtype(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null) {
            VarDefParser nowparser = new VarDefParser();
            nowparser.Analyzer();
            vardecl.loadFirVarDef(nowparser.getResult());
        }
        now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {
            if (now == null || !now.getType().equals(Token.COMMA)) {
                break;
            }
            vardecl.addComma(TokenOutput.getIndex());
            TokenOutput.forward();
            VarDefParser nowparser = new VarDefParser();
            nowparser.Analyzer();
            vardecl.addVarDef(nowparser.getResult());
            now = TokenOutput.getNowToken();
        }
        if (now != null && now.getType().equals(Token.SEMICN)) {
            vardecl.loadSemicn(TokenOutput.getIndex());
            TokenOutput.forward();
        }
    }
}
