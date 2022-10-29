package Backend.Instructions;

import Backend.GRF;

public class Mfhi extends AbstractMIPSInstr {
    public Mfhi(int dst) {
        setDst(dst);
    }

    @Override
    public String toString() {
        return "mfhi $" + GRF.regName.get(RegDst) + "\n";
    }
}
