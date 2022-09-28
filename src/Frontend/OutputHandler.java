package Frontend;

import java.io.*;

public class OutputHandler {
    public static BufferedWriter out;
    public static boolean debug = false;

    static {
        try {
            out = new BufferedWriter(new FileWriter("output.txt"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void outALine(String t) throws IOException {
        out.write(t);
    }

    public static void endOutput() throws IOException {
        out.close();
    }
}
