package Backend.Instructions;

import Backend.GRF;

public class Mflo extends AbstractMIPSInstr {
    public Mflo(int dst) {
        setDst(dst);
    }

    @Override
    public String toString() {
        return "mflo $" + GRF.regName.get(RegDst) + "\n";
    }
}
