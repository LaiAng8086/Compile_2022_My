package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.ConstDecl;

public class ConstDeclParser implements CommonParser {
    private ConstDecl constdecl;

    public ConstDeclParser() {
        constdecl = new ConstDecl();
    }

    public ConstDecl getResult() {
        return constdecl;
    }

    public void Analyzer() {
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
            nowparser.Analyzer();
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
            nowparser.Analyzer();
            constdecl.addConstDef(nowparser.getResult());
            fir = TokenOutput.getNowToken();
        }
        if (fir != null && fir.getType().equals(Token.SEMICN)) {    //';'
            constdecl.addSemicnId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        if (OutputHandler.debug) {
            System.out.println("ConstDeclParse Finished");
        }
    }
}
