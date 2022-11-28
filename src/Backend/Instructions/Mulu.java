package Backend.Instructions;

import Backend.GRF;

public class Mulu extends AbstractMIPSInstr {
    long special;
    public Mulu(int dst, int src1, long imme) {
        setDst(dst);
        setSrc1(src1);
        special = imme;
    }

    @Override
    public String toString() {
        return "mulu $" + GRF.regName.get(RegDst) + ", $" + GRF.regName.get(RegSrc1)
                + ", " + special + "\n";
    }
}
