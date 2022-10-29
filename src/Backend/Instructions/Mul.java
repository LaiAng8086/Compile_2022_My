package Backend.Instructions;

import Backend.GRF;

public class Mul extends AbstractMIPSInstr {
    public Mul(int dst, int src1, int src2) {
        setDst(dst);
        setSrc1(src1);
        setSrc2(src2);
    }

    @Override
    public String toString() {
        return "mul $" + GRF.regName.get(RegDst) + ", $" + GRF.regName.get(RegSrc1)
                + ", $" + GRF.regName.get(RegSrc2) + "\n";
    }
}
