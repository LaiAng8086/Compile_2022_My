import Backend.MIPSProgram;
import Backend.TranslateToMIPS;
import Frontend.InputHandler;
import Frontend.Lexer.SrcReader;
import Frontend.OutputHandler;
import Frontend.Syntax.Parser.CompUnitParser;
import Frontend.Translator;
import LLVMIR.Module;
import Optimization.MulOpt;

import java.io.File;
import java.io.IOException;

public class Compiler {
    public static String fileName = "testfile.txt";

    // debug switch is in OutputHandler.java

    public static void main(String[] args) throws IOException {
        File testfile;
        if (!OutputHandler.self_test) {
            testfile = new File("testfile.txt");
        } else {
            testfile = new File(fileName);
        }
        SrcReader sr = new SrcReader();
        InputHandler input = new InputHandler(testfile, sr);
        sr.analysis();
        CompUnitParser compUnitParser = new CompUnitParser();
        compUnitParser.Analyzer();
        if (OutputHandler.isFaultProcess) {
            return;
        }
        if (OutputHandler.syntaxOutput) {
            compUnitParser.getResult().output();
        }
        OutputHandler.endOutput();
        if (OutputHandler.stageDebug) {
            System.out.println("Syntax analysis end.");
        }
        Translator trans = new Translator();
        trans.translateCompUnit(compUnitParser.getResult());
        if (OutputHandler.LLVMOutput) {
            Module.getInstance().output();
        }
        MIPSProgram mipsOut = new MIPSProgram();
        TranslateToMIPS getMips = new TranslateToMIPS(mipsOut);
        getMips.toMIPS();
        if (OutputHandler.Optimization) {
            MulOpt.replaceMul2(mipsOut);
        }
        if (OutputHandler.MIPSOutput) {
            MIPSProgram.outputInit();
            mipsOut.output();
            MIPSProgram.endMIPSOut();
        }
    }
}
