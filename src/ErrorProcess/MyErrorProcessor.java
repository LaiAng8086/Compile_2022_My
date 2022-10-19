package ErrorProcess;

import Frontend.Lexer.Token;
import Frontend.Lexer.TokenOutput;
import Frontend.Syntax.Storage.Block;
import Frontend.Syntax.Storage.BlockItem;
import Frontend.Syntax.Storage.LVal;
import Frontend.Syntax.Storage.Stmt;
import SymbolTable.*;

import java.io.IOException;

public class MyErrorProcessor {
    public static int judgeFormatString(String t) {  //-1 for illegal character
        int exps = 0;
        for (int i = 1; i < t.length()-1; i++) {  //忽略在最前和最后的引号
            char c1 = t.charAt(i);
            char c2 = 0;
            if (i + 1 < t.length()-1) {
                c2 = t.charAt(i + 1);
            }
            if (!(c1 == '%' || Integer.valueOf(c1) == 32 || Integer.valueOf(c1) == 33 ||
                    (40 <= Integer.valueOf(c1) && Integer.valueOf(c1) <= 126))) {
                return -1;  //非法字符
            } else if (c1 == '\\') {
                if ((i + 1 < t.length() && c2 != 'n') || (i == t.length() - 1)) {  //不得单独出现
                    return -1;
                }
            } else if (c1 == '%') {
                if (i + 1 < t.length() && c2 == 'd') {
                    exps++;
                } else {
                    return -1; //实际上%并不在NormalChar的ASCII范围中
                }
            }
        }
        return exps;
    }

    public static void checkPrintf(Stmt p) throws IOException {
        int jury = judgeFormatString(p.getFormatString().getContent());
        if (jury == -1) {
            MyErrorCollector.getIllegalSymbol(p.getFormatString().getLineNum());
        } else {
            int exps = p.getPrintfExps();
            if (exps != jury) {
                MyErrorCollector.getUnmatchedExpCountForPrintf(p.getPrintfWord().getLineNum());
            }
        }
    }

    public static void dealLackOfSemicon() throws IOException {
        int lastRight = TokenOutput.getIndex() - 1;
        MyErrorCollector.getLackOfSemicon(TokenOutput.getTokenById(lastRight).getLineNum());
    }

    public static void dealLackOfRBrack() throws IOException {
        int lastRight = TokenOutput.getIndex() - 1;
        MyErrorCollector.getLackOfRBrack(TokenOutput.getTokenById(lastRight).getLineNum());
    }

    public static boolean checkNameRedefinationNonFunc(NonFuncTable nowtable, String name) {
        if (nowtable.getLocalItem(name) != null) {
            return true;  //确实存在名字重定义。
        }
        return false;
    }

    public static boolean checkNameRedefinationFunc(String name) {
        if (adminTable.globalFunctable.getByName(name) != null) {
            return true;
        }
        return false;
    }

    public static void dealLackOfRParent() throws IOException {
        int lastRight = TokenOutput.getIndex() - 1;
        MyErrorCollector.getLackOfRParent(TokenOutput.getTokenById(lastRight).getLineNum());
    }

    public static boolean checkLastStmtReturn(int typeId, Block funcblock) {  //true for last sentence is return.
        if (TokenOutput.getTokenById(typeId).getType() == Token.VOIDTK) {
            return true;  // if the function is void ,then ignore.
        }
        BlockItem t = funcblock.getLastStmt();
        if (t == null) {
            return false;
        }
        if (!(t instanceof Stmt)) {
            return false;
        }
        Stmt tt = (Stmt) t;
        if (tt.getMode() != Stmt.RETURN) {
            return false;
        }
        return true;
    }

    public static boolean checkConstChange(NonFuncTable table, LVal tojudge) {
        String name = TokenOutput.getTokenById(tojudge.getIdentId()).getContent();
        NonFuncTableItem t = table.getItem(name);
        if (t != null && t.getIsConst()) {
            return true;  //Detect Const Change!
        }
        return false;
    }

    public static void dealFuncCall(FuncTableItem callee, FuncTableItem caller, int linenum) throws IOException {
        if (callee == null) { //Maybe the function doesn't exists!
            return;
        }
        if (caller == null) {
            if (callee.getParamsCount() != 0) {
                MyErrorCollector.getUnmatchedFuncParamsCount(linenum);
            }
        } else {
            if (callee.getParamsCount() != caller.getParamsCount()) {
                MyErrorCollector.getUnmatchedFuncParamsCount(linenum);
                return;  //不然后面可能会RE
            }
            if (!callee.isMatchedParamsType(caller)) {
                MyErrorCollector.getUnmatchedFuncParamsType(linenum);
            }
        }
    }

}
