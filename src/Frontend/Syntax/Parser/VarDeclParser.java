package Frontend.Syntax.Parser;

import ErrorProcess.MyErrorCollector;
import ErrorProcess.MyErrorProcessor;
import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.VarDecl;
import Frontend.Syntax.Storage.VarDef;
import SymbolTable.MyBasicType;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class VarDeclParser {
    private VarDecl vardecl;

    public VarDeclParser() {
        vardecl = new VarDecl();
    }

    public VarDecl getResult() {
        return vardecl;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        Token now = TokenOutput.getNowToken();
        if (now != null && Token.isBType(now.getType())) {  //BType
            vardecl.loadBtype(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null) {  //VarDef
            VarDefParser nowparser = new VarDefParser();
            nowparser.Analyzer(table, MyBasicType.INT);   //暂时先传int，之后可能有别的类型
            vardecl.loadFirVarDef(nowparser.getResult());
        }
        now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{',' VarDef}
            if (now == null || !now.getType().equals(Token.COMMA)) {
                break;
            }
            vardecl.addComma(TokenOutput.getIndex());
            TokenOutput.forward();
            VarDefParser nowparser = new VarDefParser();
            nowparser.Analyzer(table, MyBasicType.INT);
            vardecl.addVarDef(nowparser.getResult());
            now = TokenOutput.getNowToken();
        }
        if (now != null && now.getType().equals(Token.SEMICN)) {    //';'
            vardecl.loadSemicn(TokenOutput.getIndex());
            TokenOutput.forward();
        } else {
            //Error Process i
            MyErrorProcessor.dealLackOfSemicon();
            //Error Process End.
        }
        if (OutputHandler.debug) {
            System.out.println("VarDecl Finished");
        }
    }
}
