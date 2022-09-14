import Frontend.InputHandler;
import Frontend.Lexer.SrcReader;

import java.io.File;
import java.io.IOException;

public class Compiler {
    public static void main(String[] args) throws IOException {
        File testfile = new File("testfile.txt");
        SrcReader sr = new SrcReader();
        InputHandler input = new InputHandler(testfile, sr);
        sr.analysis();
        sr.output();
    }
}
