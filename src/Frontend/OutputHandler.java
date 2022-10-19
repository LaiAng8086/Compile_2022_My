package Frontend;

import java.io.*;

public class OutputHandler {
    public static BufferedWriter out;
    public static boolean debug = false;
    public static boolean locDebug = true;
    public static boolean isFaultProcess = false;
    public static boolean syntaxOutput = true;

    static {
        try {
            if (isFaultProcess) {
                out = new BufferedWriter(new FileWriter("error.txt"));
            } else {
                out = new BufferedWriter(new FileWriter("output.txt"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void outALineWithoutEnter(String t) throws IOException {
        out.write(t);
    }

    public static void outALineWithEnter(String t) throws IOException {
        out.write(t + "\r\n");
    }

    public static void endOutput() throws IOException {
        out.close();
    }
}
