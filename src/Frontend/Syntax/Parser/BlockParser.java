package Frontend.Syntax.Parser;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.Block;

public class BlockParser implements CommonParser {
    private Block block;

    public BlockParser() {
        block = new Block();
    }

    public Block getResult() {
        return block;
    }

    public void Analyzer() {
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
                declparser.Analyzer();
                block.addBlockItem(declparser.getResult());
            } else {
                StmtParser stmtparser = new StmtParser();
                stmtparser.Analyzer();
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
