package Frontend.Syntax.Parser;

import ErrorProcess.MyErrorProcessor;
import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.ConstDecl;
import SymbolTable.MyBasicType;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class ConstDeclParser {
    private ConstDecl constdecl;

    public ConstDeclParser() {
        constdecl = new ConstDecl();
    }

    public ConstDecl getResult() {
        return constdecl;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        Token fir = TokenOutput.getNowToken();
        if (fir != null && fir.getType().equals(Token.CONSTTK)) {   //'const'
            constdecl.addConId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        fir = TokenOutput.getNowToken();
        if (fir != null && Token.isBType(fir.getType())) {  //BType
            constdecl.addBtypeId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        fir = TokenOutput.getNowToken();
        if (fir != null) {
            ConstDefParser nowparser = new ConstDefParser();    //ConstDef
            nowparser.Analyzer(table, MyBasicType.INT);  //注意：目前均传int，之后可能有别的类型
            constdecl.loadFirConstDef(nowparser.getResult());
        }
        fir = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{',' ConstDef}
            if (fir == null || !fir.getType().equals(Token.COMMA)) {
                break;
            }
            constdecl.addComma(TokenOutput.getIndex());
            TokenOutput.forward();
            ConstDefParser nowparser = new ConstDefParser();
            nowparser.Analyzer(table, MyBasicType.INT);
            constdecl.addConstDef(nowparser.getResult());
            fir = TokenOutput.getNowToken();
        }
        if (fir != null && fir.getType().equals(Token.SEMICN)) {    //';'
            constdecl.addSemicnId(TokenOutput.getIndex());
            TokenOutput.forward();
        } else {
            //Error Process begin
            MyErrorProcessor.dealLackOfSemicon();
            //Error Process end
        }
        if (OutputHandler.debug) {
            System.out.println("ConstDeclParse Finished");
        }
    }
}
