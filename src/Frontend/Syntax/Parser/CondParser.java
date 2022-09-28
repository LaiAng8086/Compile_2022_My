package Frontend.Syntax.Parser;

import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.Cond;

public class CondParser implements CommonParser {
    private Cond cond;

    public CondParser() {
        cond = new Cond();
    }

    public Cond getResult() {
        return cond;
    }

    public void Analyzer() {
        LOrExpParser lorexpParser = new LOrExpParser();
        lorexpParser.Analyzer();
        cond.loadLorExp(lorexpParser.getResult());
        if(OutputHandler.debug) {
            System.out.println("Cond Parser Finished");
            System.out.println("Token=" + TokenOutput.getNowToken());
        }
    }
}
