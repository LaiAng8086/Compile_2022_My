package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
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
        if (now != null && now.getType().equals(Token.IDENFR)) {    //Ident
            vardef.loadIdentId(TokenOutput.getIndex());
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
            constexpParser.Analyzer();
            vardef.addConstExp(constexpParser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RBRACK)) {
                vardef.addRbrack(TokenOutput.getIndex());
                TokenOutput.forward();
            }
            now = TokenOutput.getNowToken();
        }
        if (now != null && now.getType().equals(Token.ASSIGN)) {    //['=' InitVal]
            vardef.loadAssignId(TokenOutput.getIndex());
            TokenOutput.forward();
            InitValParser initvalParser = new InitValParser();
            initvalParser.Analyzer();
            vardef.loadInitVal(initvalParser.getResult());
        }
        if (OutputHandler.debug) {
            System.out.println("VarDef Finished");
        }
    }
}
