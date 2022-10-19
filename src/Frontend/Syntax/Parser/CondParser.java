package Frontend.Syntax.Parser;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.Cond;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class CondParser {
    private Cond cond;

    public CondParser() {
        cond = new Cond();
    }

    public Cond getResult() {
        return cond;
    }

    public void Analyzer(NonFuncTable table) throws IOException {
        LOrExpParser lorexpParser = new LOrExpParser();
        lorexpParser.Analyzer(table);
        cond.loadLorExp(lorexpParser.getResult());
        if (OutputHandler.debug) {
            System.out.println("Cond Parser Finished");
            System.out.println("Token=" + TokenOutput.getNowToken());
        }
    }
}
