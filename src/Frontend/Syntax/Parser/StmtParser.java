package Frontend.Syntax.Parser;

import ErrorProcess.MyErrorCollector;
import ErrorProcess.MyErrorProcessor;
import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.LVal;
import Frontend.Syntax.Storage.Stmt;
import SymbolTable.NonFuncTable;

import java.io.IOException;


public class StmtParser {
    private Stmt stmt;
    private boolean isInLoop;
    private boolean isInVoid;

    public StmtParser(boolean loop, boolean isvo) {
        stmt = new Stmt();
        isInLoop = loop;
        isInVoid = isvo;
    }

    public Stmt getResult() {
        return stmt;
    }

    private boolean isExpBegin(String type) {
        if (type.equals(Token.LPARENT)) return true;
        if (type.equals(Token.PLUS)) return true;
        if (type.equals(Token.MINU)) return true;
        if (type.equals(Token.NOT)) return true;
        if (type.equals(Token.IDENFR)) return true;
        if (type.equals(Token.INTCON)) return true;
        return false;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
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
            condparser.Analyzer(table);
            stmt.loadCond(condparser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RPARENT)) {
                stmt.loadRParentId(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                //Error Process j
                MyErrorProcessor.dealLackOfRParent();
                //Error Process End
            }
            StmtParser ifStmtparser = new StmtParser(isInLoop, isInVoid);
            ifStmtparser.Analyzer(table);
            stmt.loadStmt(ifStmtparser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.ELSETK)) {
                stmt.loadElseId(TokenOutput.getIndex());
                TokenOutput.forward();
                StmtParser elseparser = new StmtParser(isInLoop, isInVoid);
                elseparser.Analyzer(table);
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
            nowparser.Analyzer(table);
            stmt.loadCond(nowparser.getResult());
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RPARENT)) {
                stmt.loadRParentId(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                //Error Process j
                MyErrorProcessor.dealLackOfRParent();
                //Error Process End
            }
            StmtParser whileStmtparser = new StmtParser(true, isInVoid);
            whileStmtparser.Analyzer(table);
            stmt.loadStmt(whileStmtparser.getResult());
        } else if (now.getType().equals(Token.BREAKTK)) {   //'break' ';'
            stmt.setMode(Stmt.BREAK);
            stmt.loadBreakId(TokenOutput.getIndex());
            TokenOutput.forward();
            //Error Process m
            if (!isInLoop) {
                MyErrorCollector.getMisuseOfBreakAndContinue(
                        TokenOutput.getTokenById(stmt.getBreakId()).getLineNum());
            }
            //Error Process End
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.SEMICN)) {
                stmt.loadSemicnId(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                //Error Process i
                MyErrorProcessor.dealLackOfSemicon();
                //Error Process End
            }
        } else if (now.getType().equals(Token.CONTINUETK)) {    //'continue' ';'
            stmt.setMode(Stmt.CONTINUE);
            stmt.loadContinueId(TokenOutput.getIndex());
            TokenOutput.forward();
            //Error Process m
            if (!isInLoop) {
                MyErrorCollector.getMisuseOfBreakAndContinue(
                        TokenOutput.getTokenById(stmt.getContinueId()).getLineNum()
                );
            }
            //Error Process End
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.SEMICN)) {
                stmt.loadSemicnId(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                //ErrorProcess i
                MyErrorProcessor.dealLackOfSemicon();
                //ErrorProcess End
            }
        } else if (now.getType().equals(Token.RETURNTK)) {  //'return' [Exp] ';'
            stmt.setMode(Stmt.RETURN);
            stmt.loadReturnId(TokenOutput.getIndex());
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            if (!isInVoid) { // 方便于错误处理而分类
                if (now != null && !now.getType().equals(Token.SEMICN)) {
                    ExpParser expParser = new ExpParser();
                    expParser.Analyzer(table);
                    stmt.loadExp(expParser.getResult());
                }
                now = TokenOutput.getNowToken();
                if (now != null && now.getType().equals(Token.SEMICN)) {
                    stmt.loadSemicnId(TokenOutput.getIndex());
                    TokenOutput.forward();
                } else {
                    //Error Process i
                    MyErrorProcessor.dealLackOfSemicon();
                    //Error Process End.
                }
            } else {
                if (now != null && now.getType().equals(Token.SEMICN)) //正常情况
                {
                    stmt.loadSemicnId(TokenOutput.getIndex());
                    TokenOutput.forward();
                } else {
                    if (!isExpBegin(now.getType())) {  //不可能是exp，缺分号
                        //Error Process i
                        MyErrorProcessor.dealLackOfSemicon();
                        //Error Process End
                    } else {
                        int nowIndex = TokenOutput.getIndex();
                        ExpParser expParser = new ExpParser();
                        expParser.Analyzer(table);
                        now = TokenOutput.getNowToken();
                        if (now != null && now.getType().equals(Token.SEMICN))  //return exp ;
                        {
                            //Error Process f
                            MyErrorCollector.getUnmatchedReturnForVoidFunc(
                                    TokenOutput.getTokenById(nowIndex - 1).getLineNum());
                            //Error Process End
                            stmt.loadExp(expParser.getResult());
                            TokenOutput.forward();
                        } else  //回溯，这里就是缺分号，预读的是下一句的东西。
                        {
                            TokenOutput.setIndex(nowIndex);  //set back
                            //Error Process i
                            MyErrorProcessor.dealLackOfSemicon();
                            //Error Process End.
                        }

                    }
                }

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
                expParser.Analyzer(table);
                stmt.addExp(expParser.getResult());
                now = TokenOutput.getNowToken();
            }
            // Error Process l
            MyErrorProcessor.checkPrintf(stmt);
            // Error Process End
            if (now != null && now.getType().equals(Token.RPARENT)) {
                stmt.loadRParentId(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                //Error Process j
                MyErrorProcessor.dealLackOfRParent();
                //Error Process End
            }
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.SEMICN)) {
                stmt.loadSemicnId(TokenOutput.getIndex());
                TokenOutput.forward();
            } else {
                //Error Process i
                MyErrorProcessor.dealLackOfSemicon();
                //Error Process End
            }
        } else if (now.getType().equals(Token.LBRACE)) {   //'{' Block
            stmt.setMode(Stmt.BLOCK);
            BlockParser blockparser = new BlockParser(false, table, isInVoid, isInLoop);
            blockparser.Analyzer();
            stmt.loadBlock(blockparser.getResult());
        } else { //Lval=,Lval=getint,[exp];
            if (now != null && now.getType().equals(Token.IDENFR)) {
                TokenOutput.forward();  //temp to see the second token to judge '('
                Token sec = TokenOutput.getNowToken();
                if (sec != null && sec.getType().equals(Token.LPARENT)) {  //Still [exp];
                    TokenOutput.backward();
                    stmt.setMode(Stmt.EXP); //!
                    ExpParser expParser = new ExpParser();
                    expParser.Analyzer(table);
                    stmt.loadExp(expParser.getResult());
                    now = TokenOutput.getNowToken();
                    if (now != null && now.getType().equals(Token.SEMICN)) {
                        stmt.loadSemicnId(TokenOutput.getIndex());
                        TokenOutput.forward();
                    } else {
                        //Error Process i
                        MyErrorProcessor.dealLackOfSemicon();
                        //Error Process End
                    }
                } else  //have to read the LVal and judge the next.but we can uniformly deal it with ExpParser first
                {
                    TokenOutput.backward();
                    ExpParser expParser = new ExpParser();
                    expParser.Analyzer(table);
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
                        //Error Process h
                        if (MyErrorProcessor.checkConstChange(table, lval)) {
                            MyErrorCollector.getCannotChangeConst(TokenOutput.getTokenById(
                                    lval.getIdentId()).getLineNum());
                        }
                        //Error Process End
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
                            } else {
                                //Error Process j
                                MyErrorProcessor.dealLackOfRParent();
                                //Error Process End
                            }
                            now = TokenOutput.getNowToken();
                            if (now != null && now.getType().equals(Token.SEMICN)) {
                                stmt.loadSemicnId(TokenOutput.getIndex());
                                TokenOutput.forward();
                            } else {
                                //Error Process i
                                MyErrorProcessor.dealLackOfSemicon();
                                //Error Process End
                            }
                        } else {  //Lval = Exp ;
                            stmt.setMode(Stmt.ASSIGN);
                            ExpParser expParser2 = new ExpParser();
                            expParser2.Analyzer(table);
                            stmt.loadExp(expParser2.getResult());
                            now = TokenOutput.getNowToken();
                            if (now != null && now.getType().equals(Token.SEMICN)) {
                                stmt.loadSemicnId(TokenOutput.getIndex());
                                TokenOutput.forward();
                            } else {
                                //Error Process i
                                MyErrorProcessor.dealLackOfSemicon();
                                //Error Process End
                            }
                        }
                    } else  //既不是;也不是=,则说明应该缺分号
                    {
                        //Error Process i
                        MyErrorProcessor.dealLackOfSemicon();
                        //Error Process End
                    }
                }
            } else if (now != null)  //must be [exp]; 可能缺分号，但不可能空行(既没有exp又没有;)
            {
                stmt.setMode(Stmt.EXP);
                if (!now.getType().equals(Token.SEMICN)) {  //存在Exp待读取
                    ExpParser expParser = new ExpParser();
                    expParser.Analyzer(table);
                    stmt.loadExp(expParser.getResult());
                }
                now = TokenOutput.getNowToken();
                if (now != null && now.getType().equals(Token.SEMICN)) {
                    stmt.loadSemicnId(TokenOutput.getIndex());
                    TokenOutput.forward();
                } else //完整阅读了exp，然后缺分号
                {
                    //Error Process i
                    MyErrorProcessor.dealLackOfSemicon();
                    //Error Process End
                }
            }
        }
        if (OutputHandler.debug) {
            System.out.println("Stmt Finished");
            System.out.println("Token=" + TokenOutput.getNowToken().getType() + " " + TokenOutput.getIndex());
        }
    }
}
