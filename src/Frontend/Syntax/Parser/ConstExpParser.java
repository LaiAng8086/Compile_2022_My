package Frontend.Syntax.Parser;

import Frontend.OutputHandler;
import Frontend.Syntax.Storage.ConstExp;

public class ConstExpParser implements CommonParser {
    private ConstExp constexp;

    public ConstExpParser() {
        constexp = new ConstExp();
    }

    public ConstExp getResult() {
        return constexp;
    }

    public void Analyzer() {    //AddExp
        AddExpParser addexpParser = new AddExpParser();
        addexpParser.Analyzer();
        constexp.loadAddExp(addexpParser.getResult());
        if(OutputHandler.debug) {
            System.out.println("ConstExp Finished");
        }
    }
}
