package Backend.Instructions;

import Backend.GRF;

public class LoadWord2 extends AbstractMIPSInstr {
    public LoadWord2(int dst, String from) {
        setDst(dst);
        setLabel(from);
    }

    @Override
    public String toString() {
        return "lw $" + GRF.regName.get(RegDst) + ", " + label + "\n";
    }
}
