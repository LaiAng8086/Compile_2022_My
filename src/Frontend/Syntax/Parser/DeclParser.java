package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.Decl;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class DeclParser {
    private Decl decl;

    public DeclParser() {
        decl = new Decl();
    }

    public Decl getResult() {
        return decl;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        Token fir = TokenOutput.getNowToken();
        if (fir != null && fir.getType().equals(Token.CONSTTK)) {   //ConstDecl
            ConstDeclParser nowparser = new ConstDeclParser();
            nowparser.Analyzer(table);
            decl.loadConst(nowparser.getResult());
        } else if (fir != null && Token.isBType(fir.getType())) {   //VarDecl
            VarDeclParser nowparser = new VarDeclParser();
            nowparser.Analyzer(table);
            decl.loadVar(nowparser.getResult());
        }
        if (OutputHandler.debug) {
            System.out.println("Decl Finished");
        }
    }
}
