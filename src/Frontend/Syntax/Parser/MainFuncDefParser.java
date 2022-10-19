package Frontend.Syntax.Parser;

import ErrorProcess.MyErrorCollector;
import ErrorProcess.MyErrorProcessor;
import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.MainFuncDef;
import SymbolTable.FuncTableItem;
import SymbolTable.MyBasicType;
import SymbolTable.adminTable;

import java.io.IOException;

public class MainFuncDefParser {
    private MainFuncDef mainfuncdef;

    public MainFuncDefParser() {
        mainfuncdef = new MainFuncDef();
    }

    public MainFuncDef getResult() {
        return mainfuncdef;
    }

    public void Analyzer() throws IOException {
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.INTTK)) { //'int'
            mainfuncdef.loadInttkId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.MAINTK)) {    //'main'
            //Error Process b
            boolean isDuplicate = MyErrorProcessor.checkNameRedefinationFunc("main");
            if (isDuplicate) {
                MyErrorCollector.getNameRedefination(now.getLineNum());
            } else {
                //Insert Symbol Table
                FuncTableItem newn = new FuncTableItem(MyBasicType.INT);
                adminTable.globalFunctable.insertItem("main", newn);
                //Insert Symbol Table End.
                mainfuncdef.loadMainId(TokenOutput.getIndex());
            }
            //Error Process End.
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.LPARENT)) {   //'('
            mainfuncdef.loadLparentId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.RPARENT)) {   //')'
            mainfuncdef.loadRparentId(TokenOutput.getIndex());
            TokenOutput.forward();
        } else {
            //Error Process j
            MyErrorProcessor.dealLackOfRParent();
            //Error Process End
        }
        BlockParser nowparser = new BlockParser(true, mainfuncdef.getTable(), false, false);  //Block
        nowparser.Analyzer();
        mainfuncdef.loadBlock(nowparser.getResult());
        //Error Process g
        if (!MyErrorProcessor.checkLastStmtReturn(mainfuncdef.getInttkId(), mainfuncdef.getBlock())) {
            MyErrorCollector.getLackOfReturnForNonVoidFunc(
                    TokenOutput.getTokenById(mainfuncdef.getBlock().getRbraceId()).getLineNum()
            );
        }
        //Error Process End
        if (OutputHandler.debug) {
            System.out.println("MainFuncDef Finished");
        }
    }
}
