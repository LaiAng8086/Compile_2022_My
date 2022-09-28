package Frontend.Syntax.Parser;

import Frontend.OutputHandler;
import Frontend.Syntax.Storage.AddExp;
import Frontend.Syntax.Storage.Exp;

public class ExpParser implements CommonParser {
    private Exp exp;

    public ExpParser() {
        exp = new Exp();
    }

    public Exp getResult() {
        return exp;
    }

    public void Analyzer() {    //AddExp
        AddExpParser addExpParser = new AddExpParser();
        addExpParser.Analyzer();
        exp.loadAddexp(addExpParser.getResult());
        if(OutputHandler.debug) {
            System.out.println("Exp Finished");
        }
    }
}
