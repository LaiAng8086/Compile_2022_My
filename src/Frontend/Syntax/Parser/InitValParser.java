package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.InitVal;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class InitValParser {
    private InitVal initval;

    public InitValParser() {
        initval = new InitVal();
    }

    public InitVal getResult() {
        return initval;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.LBRACE)) {    //'{'
            initval.setMode(InitVal.CHOICE2);
            initval.loadLbrace(TokenOutput.getIndex());
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RBRACE)) {
                initval.loadRbrace(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                InitValParser nowparser = new InitValParser();  //InitVal
                nowparser.Analyzer(table);
                initval.loadFirInitVal(nowparser.getResult());
                now = TokenOutput.getNowToken();
                while (!TokenOutput.isEndOfTokens()) {  //{',' InitVal}
                    if (now == null || !now.getType().equals(Token.COMMA)) {
                        break;
                    }
                    initval.addComma(TokenOutput.getIndex());
                    TokenOutput.forward();
                    InitValParser nowparser2 = new InitValParser();
                    nowparser2.Analyzer(table);
                    initval.addInitVal(nowparser2.getResult());
                    now = TokenOutput.getNowToken();
                }
                if (now != null && now.getType().equals(Token.RBRACE)) {    //'}'
                    initval.loadRbrace(TokenOutput.getIndex());
                    TokenOutput.forward();
                }
            }
        } else if (now != null) {   //Exp
            initval.setMode(InitVal.CHOICE1);
            ExpParser nowparser = new ExpParser();
            nowparser.Analyzer(table);
            initval.loadExp(nowparser.getResult());
        }
        if (OutputHandler.debug) {
            System.out.println("InitVal Finished");
        }
    }

}
