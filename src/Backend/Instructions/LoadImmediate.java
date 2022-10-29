package Backend.Instructions;

import Backend.GRF;

public class LoadImmediate extends AbstractMIPSInstr {
    public LoadImmediate(int dst, int imm) {
        setDst(dst);
        setImme(imm);
    }

    @Override
    public String toString() {
        return "li $" + GRF.regName.get(RegDst) + ", " + Imme + "\n";
    }
}
