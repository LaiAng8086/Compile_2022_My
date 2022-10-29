package Backend.Instructions;

import Backend.GRF;

public class Mult extends AbstractMIPSInstr {
    public Mult(int src1, int src2) {
        setSrc1(src1);
        setSrc2(src2);
    }

    @Override
    public String toString() {
        return "mult $" + GRF.regName.get(RegSrc1) + ", $" + GRF.regName.get(RegSrc2) + "\n";
    }
}
