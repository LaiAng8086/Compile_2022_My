package Frontend.Syntax.Parser;

import ErrorProcess.MyErrorCollector;
import ErrorProcess.MyErrorProcessor;
import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Storage.ConstExp;
import Frontend.Syntax.Storage.FuncFParam;
import SymbolTable.*;

import java.io.IOException;

public class FuncFParamParser {
    private FuncFParam funcfparam;

    public FuncFParamParser() {
        funcfparam = new FuncFParam();
    }

    public FuncFParam getResult() {
        return funcfparam;
    }

    public void Analyzer(String funcName, NonFuncTable table) throws IOException {
        Token now = TokenOutput.getNowToken();
        String varName = "";
        if (now != null && Token.isBType(Token.INTTK)) {    //BType?
            funcfparam.loadBType(TokenOutput.getIndex());
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        if (now != null && now.getType().equals(Token.IDENFR)) {    //Ident
            //ErrorProcess b
            if (MyErrorProcessor.checkNameRedefinationNonFunc(table, now.getContent())) {
                MyErrorCollector.getNameRedefination(now.getLineNum());
                //ErrorProcess End.
            } else {
                varName = now.getContent();
                funcfparam.loadIdent(TokenOutput.getIndex());
            }
            TokenOutput.forward();
        }
        now = TokenOutput.getNowToken();
        int dimensions = 0; // For Func Table Item
        if (now != null && now.getType().equals(Token.LBRACK)) {    //[ '['']' { '[' ConstExp ']'} ]
            funcfparam.loadLBrack(TokenOutput.getIndex());
            dimensions++;
            TokenOutput.forward();
            now = TokenOutput.getNowToken();
            if (now != null && now.getType().equals(Token.RBRACK)) {
                funcfparam.loadRBrack(TokenOutput.getIndex());
                TokenOutput.forward();
                now = TokenOutput.getNowToken();
                while (!TokenOutput.isEndOfTokens()) {
                    if (now == null || !now.getType().equals(Token.LBRACK)) {
                        break;
                    }
                    dimensions++;
                    funcfparam.addLBrack(TokenOutput.getIndex());
                    TokenOutput.forward();
                    ConstExpParser nowparser = new ConstExpParser();
                    nowparser.Analyzer(table);
                    funcfparam.addConstExp(nowparser.getResult());
                    now = TokenOutput.getNowToken();
                    if (now != null && now.getType().equals(Token.RBRACK)) {
                        funcfparam.addRBrack(TokenOutput.getIndex());
                        TokenOutput.forward();
                    } else {
                        //Error Process k
                        MyErrorProcessor.dealLackOfRBrack();
                        //Error Process k End
                    }
                    now = TokenOutput.getNowToken();
                }
            } else {
                //Error Process k
                MyErrorProcessor.dealLackOfRBrack();
                //Error Process End
            }
        }
        //Insert Func Table Item
        FuncTableItem nowFuncItem = adminTable.globalFunctable.getByName(funcName);
        nowFuncItem.addParamType(MyBasicType.INT);  //目前仅有此类型，之后可能有扩展
        nowFuncItem.addParamDimensions(dimensions);
        //Insert Func Table Item End
        //Insert Var Table
        NonFuncTableItem newn = new NonFuncTableItem(varName, MyBasicType.INT, false, dimensions);//Ignore the dims there.
        table.insertItem(varName, newn);
        //Insert Var End.
        if (OutputHandler.debug) {
            System.out.println("FuncFParam Finished");
        }
    }
}
