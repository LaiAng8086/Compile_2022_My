package Frontend.Lexer;

import Frontend.OutputHandler;

import java.io.IOException;
import java.util.HashMap;

public class Token {
    private String type;
    private int loc;
    private String cont;
    public static final HashMap<String, String> RESERVED = new HashMap<>();
    public static final HashMap<String, String> DOUBLEOP = new HashMap<>();
    public static final HashMap<String, String> SINGLEOP = new HashMap<>();
    public static final HashMap<String, String> OTHER = new HashMap<>();

    static {
        RESERVED.put("MAINTK", "main");
        RESERVED.put("CONSTTK", "const");
        RESERVED.put("INTTK", "int");
        RESERVED.put("BREAKTK", "break");
        RESERVED.put("CONTINUETK", "continue");
        RESERVED.put("IFTK", "if");
        RESERVED.put("ELSETK", "else");
        RESERVED.put("WHILETK", "while");
        RESERVED.put("GETINTTK", "getint");
        RESERVED.put("PRINTFTK", "printf");
        RESERVED.put("RETURNTK", "return");
        RESERVED.put("VOIDTK", "void");

        DOUBLEOP.put("AND", "&&");
        DOUBLEOP.put("OR", "||");
        DOUBLEOP.put("LEQ", "<=");
        DOUBLEOP.put("GEQ", ">=");
        DOUBLEOP.put("EQL", "==");
        DOUBLEOP.put("NEQ", "!=");

        SINGLEOP.put("NOT", "!");
        SINGLEOP.put("PLUS", "+");
        SINGLEOP.put("MINU", "-");
        SINGLEOP.put("MULT", "*");
        SINGLEOP.put("DIV", "/");
        SINGLEOP.put("MOD", "%");
        SINGLEOP.put("LSS", "<");
        SINGLEOP.put("GRE", ">");
        SINGLEOP.put("ASSIGN", "=");

        OTHER.put("SEMICN", ";");
        OTHER.put("COMMA", ",");
        OTHER.put("LPARENT", "(");
        OTHER.put("RPARENT", ")");
        OTHER.put("LBRACK", "[");
        OTHER.put("RBRACK", "]");
        OTHER.put("LBRACE", "{");
        OTHER.put("RBRACE", "}");
    }

    public Token(String type, int loc, String cont) {
        this.type = type;
        this.loc = loc;
        this.cont = cont;
    }

    public void output() throws IOException {
        // System.out.println(type + " " + cont + " " + loc);
        OutputHandler.outALine(type + " " + cont + "\n");
    }

}
