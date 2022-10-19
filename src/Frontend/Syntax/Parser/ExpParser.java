package Frontend.Syntax.Parser;

import Frontend.OutputHandler;
import Frontend.Syntax.Storage.AddExp;
import Frontend.Syntax.Storage.Exp;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class ExpParser {
    private Exp exp;

    public ExpParser() {
        exp = new Exp();
    }

    public Exp getResult() {
        return exp;
    }

    public void Analyzer(NonFuncTable table) throws IOException {    //AddExp
        AddExpParser addExpParser = new AddExpParser();
        addExpParser.Analyzer(table);
        exp.loadAddexp(addExpParser.getResult());
        if (OutputHandler.debug) {
            System.out.println("Exp Finished");
        }
    }
}
