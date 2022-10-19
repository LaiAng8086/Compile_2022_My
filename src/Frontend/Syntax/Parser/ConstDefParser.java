package Frontend.Syntax.Parser;

import ErrorProcess.MyErrorCollector;
import ErrorProcess.MyErrorProcessor;
import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.ConstDef;
import SymbolTable.NonFuncTable;
import SymbolTable.NonFuncTableItem;

import java.io.IOException;

public class ConstDefParser {
    private ConstDef constdef;

    public ConstDefParser() {
        constdef = new ConstDef();
    }

    public ConstDef getResult() {
        return constdef;
    }

    public void Analyzer(NonFuncTable table, int vartype) throws IOException {
        Token fir = TokenOutput.getNowToken();
        String varName = "";
        if (fir != null && fir.getType().equals(Token.IDENFR)) {    //Ident
            //Error Process b
            boolean isDuplicate = MyErrorProcessor.checkNameRedefinationNonFunc(table, fir.getContent());
            if (isDuplicate) {
                MyErrorCollector.getNameRedefination(fir.getLineNum());
                //Error Process end.
            } else {
                varName = fir.getContent();
                constdef.loadIdent(TokenOutput.getIndex());
            }
            TokenOutput.forward();
        }
        fir = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{'[' ConstExp ']'}
            if (fir == null || !fir.getType().equals(Token.LBRACK)) {
                break;
            }
            constdef.addLbrack(TokenOutput.getIndex());
            TokenOutput.forward();
            ConstExpParser nowparser = new ConstExpParser();
            nowparser.Analyzer(table);
            constdef.addConstExp(nowparser.getResult());
            fir = TokenOutput.getNowToken();
            if (fir != null && fir.getType().equals(Token.RBRACK)) {
                constdef.addRbrack(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                //Error Process k
                MyErrorProcessor.dealLackOfRBrack();
                //Error Process end.
            }
            fir = TokenOutput.getNowToken();
        }
        //Insert symbol table
        NonFuncTableItem newn = new NonFuncTableItem(varName, vartype, true, constdef.getDimensions());
        table.insertItem(varName, newn);
        //Insert symbol table end.
        if (fir != null && fir.getType().equals(Token.ASSIGN)) {    //'='
            constdef.loadAssign(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        ConstInitValParser nowparser = new ConstInitValParser();    //ConstInitVal
        nowparser.Analyzer(table);
        constdef.loadConstInitVal(nowparser.getResult());
        if (OutputHandler.debug) {
            System.out.println("ConstDef Finished");
        }
    }
}
