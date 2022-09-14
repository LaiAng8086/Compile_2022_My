package Frontend.Lexer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

public class SrcReader {
    private ArrayList<String> contents;
    private TokenOutput tokenTo;
    private int curLine;
    private int curColumn;
    private int status;
    private int dfa_status;
    private final int NORMAL = 0;
    private final int SINGLECOMMENT = 1;
    private final int MULTICOMMENT = 2;
    private final int DFA_INIT = 0;
    private final int DFA_IDENT = 1;
    private final int DFA_INTCONST = 2;
    private final int DFA_FORMATSTRING = 3;
    private String nowFormatString;
    private String nowIntConst;
    private String nowIdent;

    public SrcReader() {
        contents = new ArrayList<>();
        tokenTo = new TokenOutput();
        curLine = 0;
        curColumn = 0;
        status = NORMAL;
        dfa_status = DFA_INIT;
        nowFormatString = "";
        nowIntConst = "";
        nowIdent = "";
    }

    public void addNewLine(String newn) {
        contents.add(newn);
    }

    public boolean isEndOfFile() {
        return curLine >= contents.size();
    }

    public void detectLine() {
        while (!isEndOfFile() && curColumn >= contents.get(curLine).length()) {
            curLine++;
            curColumn = 0;
            if (status == SINGLECOMMENT) {
                status = NORMAL;
                dfa_status = DFA_INIT;
            }
        }
    }

    public void moveCol() {
        curColumn++;
        detectLine();
    }

    public char tempNext() {
        if (curColumn + 1 < contents.get(curLine).length()) {
            return contents.get(curLine).charAt(curColumn + 1);
        }
        return ' ';
    }

    public void skipMultiComments() {

    }

    public void skipUseless() {
        if (isEndOfFile()) {
            return;
        }
        char now = contents.get(curLine).charAt(curColumn);
        while (Character.isWhitespace(now)) {
            moveCol();
            if (isEndOfFile()) {
                break;
            }
            now = contents.get(curLine).charAt(curColumn);
        }
    }


    public void analysis() {
        char now;
        while (!isEndOfFile()) {
            detectLine();
            now = contents.get(curLine).charAt(curColumn);
            // System.out.println(now + " " + status + " " + dfa_status);
            if (status == SINGLECOMMENT) {
                curLine++;
                curColumn = 0;
                status = NORMAL;
                dfa_status = DFA_INIT;
            } else if (status == MULTICOMMENT) {
                if (now == '*' && tempNext() == '/') {
                    moveCol();
                    moveCol();
                    status = NORMAL;
                    dfa_status = DFA_INIT;
                } else {
                    moveCol();
                }
            } else {
                if (dfa_status != DFA_FORMATSTRING && now == '/' && tempNext() == '*') {
                    moveCol();
                    moveCol();
                    status = MULTICOMMENT;
                } else if (dfa_status != DFA_FORMATSTRING && now == '/' && tempNext() == '/') {
                    moveCol();
                    moveCol();
                    status = SINGLECOMMENT;
                } else {
                    switch (dfa_status) {
                        case DFA_INIT:
                            if (now == '_' || (now >= 'a' && now <= 'z') || (now >= 'A' && now <= 'Z')) {
                                nowIdent = String.valueOf(now);
                                dfa_status = DFA_IDENT;
                                moveCol();
                            } else if (now >= '0' && now <= '9') {
                                nowIntConst = String.valueOf(now);
                                dfa_status = DFA_INTCONST;
                                moveCol();
                            } else if (now == '\"') {
                                nowFormatString = String.valueOf(now);
                                dfa_status = DFA_FORMATSTRING;
                                moveCol();
                            } else {
                                if (now == '!' || now == '&' || now == '|' || now == '<' || now == '>' || now == '=') {
                                    char tryNext = tempNext();
                                    boolean ismatch = false;
                                    if (tryNext != ' ') {
                                        String tempTwo = now + String.valueOf(tryNext);
                                        for (Map.Entry<String, String> t : Token.DOUBLEOP.entrySet()) {
                                            if (tempTwo.equals(t.getValue())) {
                                                tokenTo.addToken(new Token(t.getKey(), curLine, tempTwo));
                                                moveCol();
                                                moveCol();
                                                ismatch = true;
                                                break;
                                            }
                                        }
                                    }
                                    if (!ismatch) {
                                        String tempOne = String.valueOf(now);
                                        for (Map.Entry<String, String> t : Token.SINGLEOP.entrySet()) {
                                            if (tempOne.equals(t.getValue())) {
                                                tokenTo.addToken(new Token(t.getKey(), curLine, tempOne));
                                                moveCol();
                                                break;
                                            }
                                        }
                                    }
                                } else {
                                    String tempOne = String.valueOf(now);
                                    boolean ismatch = false;
                                    for (Map.Entry<String, String> t : Token.SINGLEOP.entrySet()) {
                                        if (tempOne.equals(t.getValue())) {
                                            tokenTo.addToken(new Token(t.getKey(), curLine, tempOne));
                                            moveCol();
                                            ismatch = true;
                                            break;
                                        }
                                    }
                                    if (!ismatch) {
                                        for (Map.Entry<String, String> t : Token.OTHER.entrySet()) {
                                            if (tempOne.equals(t.getValue())) {
                                                // System.out.print("Matched!");
                                                tokenTo.addToken(new Token(t.getKey(), curLine, tempOne));
                                                moveCol();
                                                // System.out.println(curLine + " " + curColumn);
                                                break;
                                            }
                                        }
                                    }
                                    skipUseless();
                                }
                            }
                            break;
                        case DFA_IDENT:
                            if (now == '_' || (now >= 'a' && now <= 'z') || (now >= 'A' && now <= 'Z') || (now >= '0' && now <= '9')) {
                                nowIdent = nowIdent + String.valueOf(now);
                                moveCol();
                            } else { // No move!
                                boolean isreserved = false;
                                for (Map.Entry<String, String> t : Token.RESERVED.entrySet()) {
                                    if (nowIdent.equals(t.getValue())) {
                                        tokenTo.addToken(new Token(t.getKey(), curLine, nowIdent));
                                        isreserved = true;
                                        break;
                                    }
                                }
                                if (!isreserved) {
                                    tokenTo.addToken(new Token("IDENFR", curLine, nowIdent));
                                }
                                nowIdent = null;
                                dfa_status = DFA_INIT;
                                skipUseless();
                            }
                            break;
                        case DFA_INTCONST:
                            if (now >= '0' && now <= '9') {
                                nowIntConst = nowIntConst + String.valueOf(now);
                                moveCol();
                            } else { //No move!
                                tokenTo.addToken(new Token("INTCON", curLine, nowIntConst));
                                nowIntConst = null;
                                dfa_status = DFA_INIT;
                                skipUseless();
                            }
                            break;
                        case DFA_FORMATSTRING:
                            if (now != '\"') {
                                nowFormatString = nowFormatString + String.valueOf(now);
                                moveCol();
                            } else {
                                nowFormatString = nowFormatString + String.valueOf(now);
                                tokenTo.addToken(new Token("STRCON", curLine, nowFormatString));
                                nowFormatString = null;
                                dfa_status = DFA_INIT;
                                moveCol();
                            }
                            break;
                        default:
                    }
                }
            }
        }
    }


    public void output() throws IOException {
        tokenTo.output();
    }
}
