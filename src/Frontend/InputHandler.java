package Frontend;

import Frontend.Lexer.SrcReader;

import java.io.*;

public class InputHandler {
    private BufferedReader buf;

    public InputHandler(File f, SrcReader rd) throws IOException {
        buf = new BufferedReader(new FileReader(f));
        String newLine;
        while ((newLine = buf.readLine()) != null) {
            rd.addNewLine(newLine);
        }
        buf.close();
    }
}
