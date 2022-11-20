package Backend.Instructions;

import Backend.GRF;

public class Xori extends AbstractMIPSInstr {
    public Xori(int dst, int src1, int imm) {
        setSrc1(src1);
        setImme(imm);
        setDst(dst);
    }

    @Override
    public String toString() {
        return "xori $" + GRF.regName.get(RegDst) + ", $" + GRF.regName.get(RegSrc1)
                + ", " + Imme + "\n";
    }
}
