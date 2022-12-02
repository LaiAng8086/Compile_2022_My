package Optimization;

import Backend.MIPSProgram;
import LLVMIR.Module;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Constant.Function;

import java.util.ArrayList;

public class OptController {
    public static void middlePass() {
        ArrayList<Function> functions = Module.getInstance().getFunctions();
        for (Function now : functions) {
            for (BasicBlock bb : now.getBblocks()) {
                BlockCommonExpMerge qwq = new BlockCommonExpMerge(bb);
                qwq.mergeCommon();
                DataFlowAnalysis dana = new DataFlowAnalysis(bb);
                dana.copyForward();
                //在此之后复制传播后，必须再做一次常量传播，不然会出现双常数的运算指令，会出错！
                dana.constForward();
                dana.analyzeDataFlow();
                dana.deleteDeadCode();
                dana.clearPreviousAnalysis();   //注意清除！
                dana.analyzeDataFlow();
                reduceUselessJump.frontReduce(bb);  //将常值的有条件跳转改无条件跳转。
            }
        }

    }

    public static void targetPass(MIPSProgram mips) {
        reduceUselessJump.backReduce(mips.getText(), mips);
        MulOpt.replaceMul2(mips);
    }
}
