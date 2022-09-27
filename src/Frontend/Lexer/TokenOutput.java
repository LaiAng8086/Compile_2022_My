package Frontend.Lexer;

import Frontend.OutputHandler;

import java.io.IOException;
import java.util.ArrayList;

public class TokenOutput {
    public static ArrayList<Token> tokens = new ArrayList<>();
    public static int nowIndex = 0;

    public static void addToken(Token newn) {
        tokens.add(newn);
    }

    public static void outputById(int id) throws IOException {
        tokens.get(id).output();
    }

    public static boolean isEndOfTokens() {
        return nowIndex >= tokens.size();
    }

    public static int getIndex() {
        return nowIndex;
    }

    public static Token getNowToken() {
        if (isEndOfTokens()) {
            return null;
        }
        return tokens.get(nowIndex);
    }

    public static void forward() {
        nowIndex++;
    }

    public static void setIndex(int temp) {  //forced rollback
        nowIndex = temp;
    }

    public static void backward() {
        nowIndex--;
    }

    public static void output() throws IOException {
        for (Token t : tokens) {
            t.output();
        }
        OutputHandler.endOutput();
    }
}
