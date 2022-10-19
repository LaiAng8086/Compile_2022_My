package Frontend;

import java.io.*;

public class OutputHandler {
    public static BufferedWriter out;
    public static boolean self_test = false;
    public static boolean debug = false;
    public static boolean locDebug = true;
    public static boolean isFaultProcess = true;
    public static boolean syntaxOutput = false;

    static {
        try {
            if (isFaultProcess && !self_test) {
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
