package Backend.Instructions;

import Backend.GRF;

public class Addu extends AbstractMIPSInstr {
    public Addu(int dst, int src1, int src2) {
        setSrc1(src1);
        setSrc2(src2);
        setDst(dst);
    }

    @Override
    public String toString() {
        return "addu $" + GRF.regName.get(RegDst) + ", $" + GRF.regName.get(RegSrc1)
                + ", $" + GRF.regName.get(RegSrc2) + "\n";
    }
}
