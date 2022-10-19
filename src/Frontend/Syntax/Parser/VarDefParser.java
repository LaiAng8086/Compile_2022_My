package Frontend.Syntax.Parser;

import ErrorProcess.MyErrorCollector;
import ErrorProcess.MyErrorProcessor;
import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.VarDef;
import SymbolTable.NonFuncTable;
import SymbolTable.NonFuncTableItem;

import java.io.IOException;

public class VarDefParser {
    private VarDef vardef;

    public VarDefParser() {
        vardef = new VarDef();
    }

    public VarDef getResult() {
        return vardef;
    }

    public void Analyzer(NonFuncTable table, int vartype) throws IOException {
        Token now = TokenOutput.getNowToken();
        String varName = "";
        if (now != null && now.getType().equals(Token.IDENFR)) {    //Ident
            boolean isDuplicate = MyErrorProcessor.checkNameRedefinationNonFunc(table, now.getContent());
            if (isDuplicate) {
                //Error Process b
                MyErrorCollector.getNameRedefination(now.getLineNum());
                //Error Process End.
            } else {
                vardef.loadIdentId(TokenOutput.getIndex());
                varName = now.getContent();

            }
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {
            if (now == null || !now.getType().equals(Token.LBRACK)) {  //{'[' ConstExp ']'}
                break;
            }
            vardef.addLbrack(TokenOutput.getIndex());
            TokenOutput.forward();
            ConstExpParser constexpParser = new ConstExpParser();
            constexpParser.Analyzer(table);
            vardef.addConstExp(constexpParser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RBRACK)) {
                vardef.addRbrack(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                //Error Process k
                MyErrorProcessor.dealLackOfRBrack();
                //Error Process End
            }
            now = TokenOutput.getNowToken();
        }
        //Insert Symbol Table
        NonFuncTableItem newn = new NonFuncTableItem(varName, vartype, false, vardef.getDimensions());
        table.insertItem(varName, newn);
        //Insert Symbol Table End.
        if (now != null && now.getType().equals(Token.ASSIGN)) {    //['=' InitVal]
            vardef.loadAssignId(TokenOutput.getIndex());
            TokenOutput.forward();
            InitValParser initvalParser = new InitValParser();
            initvalParser.Analyzer(table);
            vardef.loadInitVal(initvalParser.getResult());
        }
        if (OutputHandler.debug) {
            System.out.println("VarDef Finished");
        }
    }
}
