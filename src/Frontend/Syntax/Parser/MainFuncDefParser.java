package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.Block;
import Frontend.Syntax.Storage.MainFuncDef;

public class MainFuncDefParser implements CommonParser {
    private MainFuncDef mainfuncdef;

    public MainFuncDefParser() {
        mainfuncdef = new MainFuncDef();
    }

    public MainFuncDef getResult() {
        return mainfuncdef;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.INTTK)) {
            mainfuncdef.loadInttkId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.MAINTK)) {
            mainfuncdef.loadMainId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.LPARENT)) {
            mainfuncdef.loadLparentId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.RPARENT)) {
            mainfuncdef.loadRparentId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        BlockParser nowparser = new BlockParser();
        nowparser.Analyzer();
        mainfuncdef.loadBlock(nowparser.getResult());
    }
}
