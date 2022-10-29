package LLVMIR;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class LLVMControl {
    private int virtualRegID;
    public static BufferedWriter llvmOut;

    public LLVMControl() {
        virtualRegID = 0;
    }

    public int getRegName() {
        return virtualRegID++;
    }

    //认定大家都是从0开始，所以不用加一
    public void setRegNameByFunc(int paramsCnt) {
        virtualRegID = paramsCnt;
    }

    public static void outputInit() throws IOException {
        llvmOut = new BufferedWriter(new FileWriter("llvm_ir.txt"));
    }

    public static void outString(String t) throws IOException {
        llvmOut.write(t);
    }

    public static void endLLVMOut() throws IOException {
        llvmOut.close();
    }
}
