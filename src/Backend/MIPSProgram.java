package Backend;

import Backend.Global.AbstractGlobal;
import Backend.Instructions.AbstractMIPSInstr;
import Backend.Instructions.Label;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.LinkedList;

public class MIPSProgram {
    private LinkedList<AbstractMIPSInstr> text;
    private LinkedList<AbstractGlobal> data;
    public static BufferedWriter mipsOutput;
    private int curStackSize;

    public MIPSProgram() {
        data = new LinkedList<>();
        text = new LinkedList<>();
        curStackSize = 0;
    }

    public int getCurStackSize() {
        return curStackSize;
    }

    public void setCurStackSize(int newSize) {
        curStackSize = newSize;
    }

    public void addGlobalSetting(AbstractGlobal newn) {
        data.add(newn);
    }

    public void addInstr(AbstractMIPSInstr newn) {
        text.add(newn);
    }

    public static void outputInit() throws IOException {
        mipsOutput = new BufferedWriter(new FileWriter("mips.txt"));
    }

    public static void outString(String t) throws IOException {
        mipsOutput.write(t);
    }

    public static void endMIPSOut() throws IOException {
        mipsOutput.close();
    }

    public void output() throws IOException {
        outputInit();
        outString(".data\n");
        for (int i = 0; i < data.size(); i++) {
            outString("  " + data.get(i).toString());
        }
        outString(".text\n");
        outString("  jal _main\n");
        for (int i = 0; i < text.size(); i++) {
            if (text.get(i) instanceof Label) {
                outString(text.get(i).toString());
            } else {
                outString("  " + text.get(i));
            }
        }
        endMIPSOut();
    }

}
