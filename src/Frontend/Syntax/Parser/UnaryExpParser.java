package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.UnaryExp;


public class UnaryExpParser implements CommonParser {
    private UnaryExp unaryexp;

    public UnaryExpParser() {
        unaryexp = new UnaryExp();
    }

    public UnaryExp getResult() {
        return unaryexp;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now != null && (now.getType().equals(Token.PLUS)
                || now.getType().equals(Token.MINU) || now.getType().equals(Token.NOT))) {  //+-! -> UnaryOp
            unaryexp.setMode(UnaryExp.UNARY);
            UnaryOpParser unaryopParser = new UnaryOpParser();
            unaryopParser.Analyzer();
            unaryexp.loadUnaryOp(unaryopParser.getResult());
            UnaryExpParser unaryexpParser = new UnaryExpParser();
            unaryexpParser.Analyzer();
            unaryexp.loadUnaryExp(unaryexpParser.getResult());
        } else if (now != null && (now.getType().equals(Token.LPARENT) || now.getType().equals(Token.INTCON))) {
            unaryexp.setMode(UnaryExp.PRIMARY);
            PrimaryExpParser primaryexpParser = new PrimaryExpParser();
            primaryexpParser.Analyzer();
            unaryexp.loadPrimaryExp(primaryexpParser.getResult());
        } else if (now != null && now.getType().equals(Token.IDENFR))//partly primary partly ident
        {
            TokenOutput.forward();  //predict the second
            Token sec = TokenOutput.getNowToken();
            if (sec != null && sec.getType().equals(Token.LPARENT)) { //'('
                unaryexp.setMode(UnaryExp.IDENT);
                unaryexp.loadIdent(TokenOutput.getIndex() - 1);
                unaryexp.loadLParent(TokenOutput.getIndex());
                TokenOutput.forward();
                now = TokenOutput.getNowToken();
                if (now != null && !now.getType().equals(Token.RPARENT)) {  //[FuncRParams]
                    FuncRParamsParser funcrparamsParser = new FuncRParamsParser();
                    funcrparamsParser.Analyzer();
                    unaryexp.loadFuncRParams(funcrparamsParser.getResult());
                }
                now = TokenOutput.getNowToken();
                if (now != null && now.getType().equals(Token.RPARENT)) { //')'
                    unaryexp.loadRParent(TokenOutput.getIndex());
                    TokenOutput.forward();
                }
            } else  //Lval case in PrimaryExp
            {
                unaryexp.setMode(UnaryExp.PRIMARY);
                TokenOutput.backward();
                PrimaryExpParser primaryexpParser = new PrimaryExpParser();
                primaryexpParser.Analyzer();
                unaryexp.loadPrimaryExp(primaryexpParser.getResult());
            }
        }
        if(OutputHandler.debug) {
            System.out.println("UnaryExp Finished");
            System.out.println("Token=" + TokenOutput.getNowToken().getType() + " " + TokenOutput.getIndex());
        }
    }
}
