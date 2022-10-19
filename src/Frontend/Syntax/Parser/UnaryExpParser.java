package Frontend.Syntax.Parser;

import ErrorProcess.MyErrorCollector;
import ErrorProcess.MyErrorProcessor;
import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.UnaryExp;
import SymbolTable.FuncTableItem;
import SymbolTable.NonFuncTable;
import SymbolTable.adminTable;

import java.io.IOException;


public class UnaryExpParser {
    private UnaryExp unaryexp;

    public UnaryExpParser() {
        unaryexp = new UnaryExp();
    }

    public UnaryExp getResult() {
        return unaryexp;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        Token now = TokenOutput.getNowToken();
        if (now != null && (now.getType().equals(Token.PLUS)
                || now.getType().equals(Token.MINU) || now.getType().equals(Token.NOT))) {  //+-! -> UnaryOp
            unaryexp.setMode(UnaryExp.UNARY);
            UnaryOpParser unaryopParser = new UnaryOpParser();
            unaryopParser.Analyzer();
            unaryexp.loadUnaryOp(unaryopParser.getResult());
            UnaryExpParser unaryexpParser = new UnaryExpParser();
            unaryexpParser.Analyzer(table);
            unaryexp.loadUnaryExp(unaryexpParser.getResult());
        } else if (now != null && (now.getType().equals(Token.LPARENT) || now.getType().equals(Token.INTCON))) {
            unaryexp.setMode(UnaryExp.PRIMARY);
            PrimaryExpParser primaryexpParser = new PrimaryExpParser();
            primaryexpParser.Analyzer(table);
            unaryexp.loadPrimaryExp(primaryexpParser.getResult());
        } else if (now != null && now.getType().equals(Token.IDENFR))//partly primary partly ident
        {
            Token backup = now; //For Error Process c.
            TokenOutput.forward();  //predict the second
            Token sec = TokenOutput.getNowToken();
            if (sec != null && sec.getType().equals(Token.LPARENT)) { //'('
                unaryexp.setMode(UnaryExp.IDENT);
                //Error Process c
                FuncTableItem callee = adminTable.globalFunctable.getByName(backup.getContent());
                if (callee == null) {//such function not exists.
                    MyErrorCollector.getUndefinedName(backup.getLineNum());
                }
                //Error Process End.
                unaryexp.loadIdent(TokenOutput.getIndex() - 1);
                unaryexp.loadLParent(TokenOutput.getIndex());
                TokenOutput.forward();
                now = TokenOutput.getNowToken();
                int params = 0;
                FuncTableItem convert = null;
                if (now != null && !now.getType().equals(Token.RPARENT)) {  //[FuncRParams]
                    FuncRParamsParser funcrparamsParser = new FuncRParamsParser(table);
                    funcrparamsParser.Analyzer(table);
                    unaryexp.loadFuncRParams(funcrparamsParser.getResult());
                    convert = funcrparamsParser.getResult().convertToTableItem();
                }
                //Error Process d,e
                MyErrorProcessor.dealFuncCall(callee, convert, backup.getLineNum());
                //Error Process End.
                now = TokenOutput.getNowToken();
                if (now != null && now.getType().equals(Token.RPARENT)) { //')'
                    unaryexp.loadRParent(TokenOutput.getIndex());
                    TokenOutput.forward();
                } else {
                    //Error Process j
                    MyErrorProcessor.dealLackOfRParent();
                    //Error Process End
                }
            } else  //Lval case in PrimaryExp
            {
                unaryexp.setMode(UnaryExp.PRIMARY);
                TokenOutput.backward();
                PrimaryExpParser primaryexpParser = new PrimaryExpParser();
                primaryexpParser.Analyzer(table);
                unaryexp.loadPrimaryExp(primaryexpParser.getResult());
            }
        }
        if (OutputHandler.debug) {
            System.out.println("UnaryExp Finished");
            System.out.println("Token=" + TokenOutput.getNowToken().getType() + " " + TokenOutput.getIndex());
        }
    }
}
