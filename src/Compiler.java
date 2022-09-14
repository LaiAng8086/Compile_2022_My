import Frontend.InputHandler;
import Frontend.Lexer.SrcReader;

import java.io.File;
import java.io.IOException;

public class Compiler {
    public static boolean self_test = false;
    public static String fileName = "testfile2.txt";

    public static void main(String[] args) throws IOException {
        File testfile;
        if (!self_test) {
            testfile = new File("testfile.txt");
        } else {
            testfile = new File(fileName);
        }
        SrcReader sr = new SrcReader();
        InputHandler input = new InputHandler(testfile, sr);
        sr.analysis();
        sr.output();
    }
}
