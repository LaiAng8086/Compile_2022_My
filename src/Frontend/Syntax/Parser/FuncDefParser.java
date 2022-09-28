package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.FuncDef;

public class FuncDefParser implements CommonParser {
    private FuncDef funcdef;

    public FuncDefParser() {
        funcdef = new FuncDef();
    }

    public FuncDef getResult() {
        return funcdef;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null) {  //FuncType
            FuncTypeParser nowparser = new FuncTypeParser();
            nowparser.Analyzer();
            funcdef.loadFuncType(nowparser.getResult());
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.IDENFR)) {    //Ident
            funcdef.loadIdentId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.LPARENT)) {   //'('
            funcdef.loadLParentId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && !now.getType().equals(Token.RPARENT)) {
            FuncFParamsParser nowparser = new FuncFParamsParser();  //[FuncFParams]
            nowparser.Analyzer();
            funcdef.loadFuncFParams(nowparser.getResult());
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.RPARENT)) {   //')'
            funcdef.loadRParentId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        BlockParser nowparser = new BlockParser();  //Block
        nowparser.Analyzer();
        funcdef.loadBlock(nowparser.getResult());
        if (OutputHandler.debug) {
            System.out.println("FuncDef Finished");
        }
    }
}
