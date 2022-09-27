package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.Decl;

public class DeclParser implements CommonParser {
    private Decl decl;

    public DeclParser() {
        decl = new Decl();
    }

    public Decl getResult() {
        return decl;
    }

    public void Analyzer() {
        Token fir = TokenOutput.getNowToken();
        if (fir != null && fir.getType().equals(Token.CONSTTK)) {
            ConstDeclParser nowparser = new ConstDeclParser();
            nowparser.Analyzer();
            decl.loadConst(nowparser.getResult());
        } else if (fir != null && fir.getType().equals(Token.INTTK)) {
            VarDeclParser nowparser = new VarDeclParser();
            nowparser.Analyzer();
            decl.loadVar(nowparser.getResult());
        }
    }
}
