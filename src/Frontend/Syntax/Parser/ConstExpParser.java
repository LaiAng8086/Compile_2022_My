package Frontend.Syntax.Parser;

import Frontend.OutputHandler;
import Frontend.Syntax.Storage.ConstExp;
import SymbolTable.NonFuncTable;

import java.io.IOException;

public class ConstExpParser {
    private ConstExp constexp;

    public ConstExpParser() {
        constexp = new ConstExp();
    }

    public ConstExp getResult() {
        return constexp;
    }

    public void Analyzer(NonFuncTable table) throws IOException {    //AddExp
        AddExpParser addexpParser = new AddExpParser();
        addexpParser.Analyzer(table);
        constexp.loadAddExp(addexpParser.getResult());
        if (OutputHandler.debug) {
            System.out.println("ConstExp Finished");
        }
    }
}
