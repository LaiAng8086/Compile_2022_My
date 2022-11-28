package Frontend;

import java.io.*;

public class OutputHandler {
    public static BufferedWriter out;
    public static boolean self_test = false;
    public static boolean debug = false; //提交时记得改为false
    public static boolean locDebug = true;
    public static boolean isFaultProcess = false;
    public static boolean syntaxOutput = false;
    public static boolean LLVMOutput = true;    //中间代码导出开关
    public static boolean stageDebug = false;    //提交时记得关闭
    public static boolean MIPSOutput = true;    //MIPS汇编导出开关
    public static boolean Optimization = true;  //优化开关
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
