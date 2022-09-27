import Frontend.InputHandler;
import Frontend.Lexer.SrcReader;
import Frontend.Lexer.TokenOutput;
import Frontend.OutputHandler;
import Frontend.Syntax.Parser.CompUnitParser;

import java.io.File;
import java.io.IOException;

public class Compiler {
    public static boolean self_test = false;
    public static String fileName = "testfile17.txt";

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
        CompUnitParser compUnitParser = new CompUnitParser();
        compUnitParser.Analyzer();
        compUnitParser.getResult().output();
        OutputHandler.endOutput();
    }
}
