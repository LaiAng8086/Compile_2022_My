package Backend.Instructions;

import Backend.GRF;

public class LoadAddress extends AbstractMIPSInstr {
    public LoadAddress(int dst, String from) {
        setDst(dst);
        setLabel(from);
    }

    //注意：为了全局变量有修改
    @Override
    public String toString() {
        return "la $" + GRF.regName.get(RegDst) + ", " + label + "\n";
    }
}
