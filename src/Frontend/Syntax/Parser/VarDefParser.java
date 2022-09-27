package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.VarDef;

public class VarDefParser implements CommonParser {
    private VarDef vardef;

    public VarDefParser() {
        vardef = new VarDef();
    }

    public VarDef getResult() {
        return vardef;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.IDENFR)) {
            vardef.loadIdentId(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {
            if (now == null || !now.getType().equals(Token.LBRACK)) {
                break;
            }
            vardef.addLbrack(TokenOutput.getIndex());
            ConstExpParser constexpParser = new ConstExpParser();
            constexpParser.Analyzer();
            vardef.addConstExp(constexpParser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RBRACK)) {
                vardef.addRbrack(TokenOutput.getIndex());
                TokenOutput.forward();
            }
            now = TokenOutput.getNowToken();
        }
        if (now != null && now.getType().equals(Token.ASSIGN)) {
            vardef.loadAssignId(TokenOutput.getIndex());
            TokenOutput.forward();
            InitValParser initvalParser = new InitValParser();
            initvalParser.Analyzer();
            vardef.loadInitVal(initvalParser.getResult());
        }
    }
}
