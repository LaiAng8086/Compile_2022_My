package Backend.Instructions;

import Backend.GRF;

public class Jr extends AbstractMIPSInstr {
    public Jr(int dst) {
        setDst(dst);
    }

    @Override
    public String toString() {
        return "jr $" + GRF.regName.get(RegDst) + "\n";
    }
}
