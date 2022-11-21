package Backend.Instructions;

import Backend.GRF;

public class Mul2 extends AbstractMIPSInstr {
    public Mul2(int dst, int src1, int imme) {
        setDst(dst);
        setSrc1(src1);
        setImme(imme);
    }

    @Override
    public String toString() {
        return "mul $" + GRF.regName.get(RegDst) + ", $" + GRF.regName.get(RegSrc1)
                + ", " + Imme + "\n";
    }
}
