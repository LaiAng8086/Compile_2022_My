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
    public static final String IDENFR = "IDENFR";
    public static final String INTCON = "INTCON";
    public static final String STRCON = "STRCON";
    public static final String MAINTK = "MAINTK";
    public static final String CONSTTK = "CONSTTK";
    public static final String INTTK = "INTTK";
    public static final String BREAKTK = "BREAKTK";
    public static final String CONTINUETK = "CONTINUETK";
    public static final String IFTK = "IFTK";
    public static final String ELSETK = "ELSETK";
    public static final String NOT = "NOT";
    public static final String AND = "AND";
    public static final String OR = "OR";
    public static final String WHILETK = "WHILETK";
    public static final String GETINTTK = "GETINTTK";
    public static final String PRINTFTK = "PRINTFTK";
    public static final String RETURNTK = "RETURNTK";
    public static final String PLUS = "PLUS";
    public static final String MINU = "MINU";
    public static final String VOIDTK = "VOIDTK";
    public static final String MULT = "MULT";
    public static final String DIV = "DIV";
    public static final String MOD = "MOD";
    public static final String LSS = "LSS";
    public static final String LEQ = "LEQ";
    public static final String GRE = "GRE";
    public static final String GEQ = "GEQ";
    public static final String EQL = "EQL";
    public static final String NEQ = "NEQ";
    public static final String ASSIGN = "ASSIGN";
    public static final String SEMICN = "SEMICN";
    public static final String COMMA = "COMMA";
    public static final String LPARENT = "LPARENT";
    public static final String RPARENT = "RPARENT";
    public static final String LBRACK = "LBRACK";
    public static final String RBRACK = "RBRACK";
    public static final String LBRACE = "LBRACE";
    public static final String RBRACE = "RBRACE";

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

    public static boolean isBType(String jury) {
        return jury.equals(INTTK);
    }

    public Token(String type, int loc, String cont) {
        this.type = type;
        this.loc = loc;
        this.cont = cont;
    }

    public String getType() {
        return type;
    }

    public void output() throws IOException {
        // System.out.println(type + " " + cont + " " + loc);
        OutputHandler.outALine(type + " " + cont + "\n");
    }

}
