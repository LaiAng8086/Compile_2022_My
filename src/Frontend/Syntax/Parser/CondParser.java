package Frontend.Syntax.Parser;

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
    }
}
