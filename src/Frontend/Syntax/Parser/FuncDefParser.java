package Frontend.Syntax.Parser;

import ErrorProcess.MyErrorCollector;
import ErrorProcess.MyErrorProcessor;
import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.FuncDef;
import SymbolTable.FuncTableItem;
import SymbolTable.MyBasicType;
import SymbolTable.adminTable;

import java.io.IOException;

public class FuncDefParser {
    private FuncDef funcdef;
    private String funcName;

    public FuncDefParser() {
        funcdef = new FuncDef(adminTable.globalNonFunctable);
    }

    public FuncDef getResult() {
        return funcdef;
    }

    public void Analyzer() throws IOException {
        Token now = TokenOutput.getNowToken();
        boolean isVoid = false;
        if (now != null) {  //FuncType
            FuncTypeParser nowparser = new FuncTypeParser();
            nowparser.Analyzer();
            funcdef.loadFuncType(nowparser.getResult());
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.IDENFR)) {    //Ident
            //Error Process b
            boolean isDuplicate = MyErrorProcessor.checkNameRedefinationFunc(now.getContent())
                    | MyErrorProcessor.checkNameRedefinationNonFunc(adminTable.globalNonFunctable, now.getContent());
            if (isDuplicate) {
                MyErrorCollector.getNameRedefination(now.getLineNum());
                //Error Process End
            } else {
                int type = -1;
                if (TokenOutput.getTokenById(funcdef.getFuncTypeId()).getType() == Token.VOIDTK) {
                    type = MyBasicType.VOID;
                    isVoid = true;
                } else if (TokenOutput.getTokenById(funcdef.getFuncTypeId()).getType() == Token.INTTK) {
                    type = MyBasicType.INT;
                }
                FuncTableItem newn = new FuncTableItem(type);
                adminTable.globalFunctable.insertItem(now.getContent(), newn);
                funcdef.loadIdentId(TokenOutput.getIndex());
                funcName = now.getContent();
            }
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.LPARENT)) {   //'('
            funcdef.loadLParentId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && Token.isBType(now.getType())) {
            FuncFParamsParser nowparser = new FuncFParamsParser();  //[FuncFParams]
            nowparser.Analyzer(funcName, funcdef.getTable());
            funcdef.loadFuncFParams(nowparser.getResult());
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.RPARENT)) {   //')'
            funcdef.loadRParentId(TokenOutput.getIndex());
            TokenOutput.forward();
        } else {
            //Error Process j
            MyErrorProcessor.dealLackOfRParent();
            //Error Process End
        }
        BlockParser nowparser = new BlockParser(true, funcdef.getTable(), isVoid, false);  //Block
        nowparser.Analyzer();
        funcdef.loadBlock(nowparser.getResult());
        //Error Process g
        if (!MyErrorProcessor.checkLastStmtReturn(funcdef.getFuncTypeId(), funcdef.getBlock())) {
            MyErrorCollector.getLackOfReturnForNonVoidFunc(TokenOutput.getTokenById(
                    funcdef.getBlock().getRbraceId())
                    .getLineNum());
        }
        //Error Process End
        if (OutputHandler.debug) {
            System.out.println("FuncDef Finished");
        }
    }
}
