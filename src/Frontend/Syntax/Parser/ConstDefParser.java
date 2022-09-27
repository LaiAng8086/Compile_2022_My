package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.ConstDef;

public class ConstDefParser implements CommonParser {
    private ConstDef constdef;

    public ConstDefParser() {
        constdef = new ConstDef();
    }

    public ConstDef getResult() {
        return constdef;
    }

    public void Analyzer() {
        Token fir = TokenOutput.getNowToken();
        if (fir != null && fir.getType().equals("IDENFR")) {
            constdef.loadIdent(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        fir = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {
            if (fir == null || !fir.getType().equals("LBRACK")) {
                break;
            }
            constdef.addLbrack(TokenOutput.getIndex());
            TokenOutput.forward();
            ConstExpParser nowparser = new ConstExpParser();
            nowparser.Analyzer();
            constdef.addConstExp(nowparser.getResult());
            fir = TokenOutput.getNowToken();
            if (fir != null && fir.getType().equals("RBRACK")) {
                constdef.addRbrack(TokenOutput.getIndex());
                TokenOutput.forward();
            }
            fir = TokenOutput.getNowToken();
        }
        if (fir != null && fir.getType().equals("ASSIGN")) {
            constdef.loadAssign(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        ConstInitValParser nowparser = new ConstInitValParser();
        nowparser.Analyzer();
        constdef.loadConstInitVal(nowparser.getResult());
    }
}
