package Frontend.Syntax.Parser;

import ErrorProcess.MyErrorCollector;
import ErrorProcess.MyErrorProcessor;
import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.Block;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class BlockParser {
    private Block block;
    private boolean isVoid;
    private boolean isInLoop;

    public BlockParser(boolean isFuncBlock, NonFuncTable funcOrFaTable, boolean isvoid, boolean isinloop) {
        //如果是某个函数最外层的Block，则和函数形参共用符号表，否则新建本Block的符号表，传入的两种可能都有。
        block = new Block(isFuncBlock, funcOrFaTable);
        isVoid = isvoid;
        isInLoop = isinloop;
    }

    public Block getResult() {
        return block;
    }

    public void Analyzer() throws IOException {
        Token now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.LBRACE)) {    //'{'
            block.loadLBrace(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        while (!TokenOutput.isEndOfTokens()) {  //{BlockItem}
            if (now == null || now.getType().equals(Token.RBRACE)) {
                break;
            }
            if (now != null && (now.getType().equals(Token.CONSTTK) || Token.isBType(now.getType()))) {
                DeclParser declparser = new DeclParser();
                declparser.Analyzer(block.getTable());
                block.addBlockItem(declparser.getResult());
            } else {
                StmtParser stmtparser = new StmtParser(isInLoop, isVoid);
                stmtparser.Analyzer(block.getTable());
                block.addBlockItem(stmtparser.getResult());
            }
            now = TokenOutput.getNowToken();
            // System.out.println(now.getType());
        }
        if (now != null && now.getType().equals(Token.RBRACE)) {    //'}'
            block.loadRBrace(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        if (OutputHandler.debug) {
            System.out.println("BlockParser Completed");
        }
    }

}
