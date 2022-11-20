package Backend.Instructions;

import Backend.GRF;

public class Xor extends AbstractMIPSInstr {
    public Xor(int dst, int src1, int src2) {
        setSrc1(src1);
        setSrc2(src2);
        setDst(dst);
    }

    @Override
    public String toString() {
        return "xor $" + GRF.regName.get(RegDst) + ", $" + GRF.regName.get(RegSrc1)
                + ", $" + GRF.regName.get(RegSrc2) + "\n";
    }
}
