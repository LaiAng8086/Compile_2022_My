package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.Exp;
import Frontend.Syntax.Storage.LVal;
import Frontend.Syntax.Storage.Stmt;

import java.util.Locale;

public class StmtParser implements CommonParser {
    private Stmt stmt;

    public StmtParser() {
        stmt = new Stmt();
    }

    public Stmt getResult() {
        return stmt;
    }

    public void Analyzer() {
        Token now = TokenOutput.getNowToken();
        if (now.getType().equals(Token.IFTK)) { //'if' '(' Cond ')' Stmt ['else' Stmt]
            stmt.setMode(Stmt.IF);
            stmt.loadIfId(TokenOutput.getIndex());
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.LPARENT)) {
                stmt.loadLParentId(TokenOutput.getIndex());
                TokenOutput.forward();
            }
            CondParser condparser = new CondParser();
            condparser.Analyzer();
            stmt.loadCond(condparser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RPARENT)) {
                stmt.loadRParentId(TokenOutput.getIndex());
                TokenOutput.forward();
            }
            StmtParser ifStmtparser = new StmtParser();
            ifStmtparser.Analyzer();
            stmt.loadStmt(ifStmtparser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.ELSETK)) {
                stmt.loadElseId(TokenOutput.getIndex());
                TokenOutput.forward();
                StmtParser elseparser = new StmtParser();
                elseparser.Analyzer();
                stmt.loadElseStmt(elseparser.getResult());
            }
        } else if (now.getType().equals(Token.WHILETK)) {   //'while' '(' Cond ')' Stmt
            stmt.setMode(Stmt.WHILE);
            stmt.loadWhileId(TokenOutput.getIndex());
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.LPARENT)) {
                stmt.loadLParentId(TokenOutput.getIndex());
                TokenOutput.forward();
            }
            CondParser nowparser = new CondParser();
            nowparser.Analyzer();
            stmt.loadCond(nowparser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RPARENT)) {
                stmt.loadRParentId(TokenOutput.getIndex());
                TokenOutput.forward();
            }
            StmtParser whileStmtparser = new StmtParser();
            whileStmtparser.Analyzer();
            stmt.loadStmt(whileStmtparser.getResult());
        } else if (now.getType().equals(Token.BREAKTK)) {   //'break' ';'
            stmt.setMode(Stmt.BREAK);
            stmt.loadBreakId(TokenOutput.getIndex());
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.SEMICN)) {
                stmt.loadSemicnId(TokenOutput.getIndex());
                TokenOutput.forward();
            }
        } else if (now.getType().equals(Token.CONTINUETK)) {    //'continue' ';'
            stmt.setMode(Stmt.CONTINUE);
            stmt.loadContinueId(TokenOutput.getIndex());
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.SEMICN)) {
                stmt.loadSemicnId(TokenOutput.getIndex());
                TokenOutput.forward();
            }
        } else if (now.getType().equals(Token.RETURNTK)) {  //'return' [Exp] ';'
            stmt.setMode(Stmt.RETURN);
            stmt.loadReturnId(TokenOutput.getIndex());
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            if (now != null && !now.getType().equals(Token.SEMICN)) {
                ExpParser expParser = new ExpParser();
                expParser.Analyzer();
                stmt.loadExp(expParser.getResult());
            }
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.SEMICN)) {
                stmt.loadSemicnId(TokenOutput.getIndex());
                TokenOutput.forward();
            }
        } else if (now.getType().equals(Token.PRINTFTK)) {  //'printf' '(' FormatString {',' Exp}
            stmt.setMode(Stmt.OUTPUT);
            stmt.loadPrintfId(TokenOutput.getIndex());
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.LPARENT)) {
                stmt.loadLParentId(TokenOutput.getIndex());
                TokenOutput.forward();
            }
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.STRCON)) {
                stmt.loadStrconId(TokenOutput.getIndex());
                TokenOutput.forward();
            }
            now = TokenOutput.getNowToken();
            while (!TokenOutput.isEndOfTokens()) {
                if (now == null || !now.getType().equals(Token.COMMA)) {
                    break;
                }
                stmt.addComma(TokenOutput.getIndex());
                TokenOutput.forward();
                ExpParser expParser = new ExpParser();
                expParser.Analyzer();
                stmt.addExp(expParser.getResult());
                now = TokenOutput.getNowToken();
            }
            if (now != null && now.getType().equals(Token.RPARENT)) {
                stmt.loadRParentId(TokenOutput.getIndex());
                TokenOutput.forward();
            }
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.SEMICN)) {
                stmt.loadSemicnId(TokenOutput.getIndex());
                TokenOutput.forward();
            }
        } else if (now.getType().equals(Token.LBRACE)) {   //'(' Block
            stmt.setMode(Stmt.BLOCK);
            BlockParser blockparser = new BlockParser();
            blockparser.Analyzer();
            stmt.loadBlock(blockparser.getResult());
        } else { //Lval=,Lval=getint,[exp];
            if (now != null && now.getType().equals(Token.IDENFR)) {
                TokenOutput.forward();  //temp to see the second token to judge '('
                Token sec = TokenOutput.getNowToken();
                if (sec != null && sec.getType().equals(Token.LPARENT)) {
                    TokenOutput.backward();
                    stmt.setMode(Stmt.EXP); //!
                    ExpParser expParser = new ExpParser();
                    expParser.Analyzer();
                    stmt.loadExp(expParser.getResult());
                    now = TokenOutput.getNowToken();
                    if (now != null && now.getType().equals(Token.SEMICN)) {
                        stmt.loadSemicnId(TokenOutput.getIndex());
                        TokenOutput.forward();
                    }
                } else  //have to read the LVal and judge the next.but we can uniformly deal it with ExpParser first
                {
                    TokenOutput.backward();
                    ExpParser expParser = new ExpParser();
                    expParser.Analyzer();
                    now = TokenOutput.getNowToken();
                    if (now != null && now.getType().equals(Token.SEMICN)) {
                        stmt.setMode(Stmt.EXP);
                        stmt.loadExp(expParser.getResult());
                        stmt.loadSemicnId(TokenOutput.getIndex());
                        TokenOutput.forward();
                    } else if (now.getType().equals(Token.ASSIGN)) {
                        LVal lval = expParser.getResult().getAddexp().getFirmulexp().
                                getFirunaryexp().getPrimaryexp().getLVal();  //extract lval from exp
                        stmt.loadLVal(lval);
                        stmt.loadAssignId(TokenOutput.getIndex());
                        TokenOutput.forward();  //presee the second
                        Token guessGetint = TokenOutput.getNowToken();
                        if (guessGetint.getType().equals(Token.GETINTTK)) {  //Lval = getint();
                            stmt.setMode(Stmt.INPUT);
                            stmt.loadGetintId(TokenOutput.getIndex());
                            TokenOutput.forward();
                            now = TokenOutput.getNowToken();
                            if (now != null && now.getType().equals(Token.LPARENT)) {
                                stmt.loadLParentId(TokenOutput.getIndex());
                                TokenOutput.forward();
                            }
                            now = TokenOutput.getNowToken();
                            if (now != null && now.getType().equals(Token.RPARENT)) {
                                stmt.loadRParentId(TokenOutput.getIndex());
                                TokenOutput.forward();
                            }
                            now = TokenOutput.getNowToken();
                            if (now != null && now.getType().equals(Token.SEMICN)) {
                                stmt.loadSemicnId(TokenOutput.getIndex());
                                TokenOutput.forward();
                            }
                        } else {  //Lval = Exp ;
                            stmt.setMode(Stmt.ASSIGN);
                            ExpParser expParser2 = new ExpParser();
                            expParser2.Analyzer();
                            stmt.loadExp(expParser2.getResult());
                            now = TokenOutput.getNowToken();
                            if (now != null && now.getType().equals(Token.SEMICN)) {
                                stmt.loadSemicnId(TokenOutput.getIndex());
                                TokenOutput.forward();
                            }
                        }
                    }
                }
            } else if (now != null)  //must be [exp];
            {
                stmt.setMode(Stmt.EXP);
                if (!now.getType().equals(Token.SEMICN)) {
                    ExpParser expParser = new ExpParser();
                    expParser.Analyzer();
                    stmt.loadExp(expParser.getResult());
                }
                now = TokenOutput.getNowToken();
                if (now != null && now.getType().equals(Token.SEMICN)) {
                    stmt.loadSemicnId(TokenOutput.getIndex());
                    TokenOutput.forward();
                }
            }
        }
        if(OutputHandler.debug) {
            System.out.println("Stmt Finished");
            System.out.println("Token=" + TokenOutput.getNowToken().getType() + " " + TokenOutput.getIndex());
        }
    }
}
