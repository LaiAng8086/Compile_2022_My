package Backend.Instructions;

import Backend.GRF;

public class Sra extends AbstractMIPSInstr {
    public Sra(int dst, int src1, long imm) {
        setSrc1(src1);
        setImme(imm);
        setDst(dst);
    }

    @Override
    public String toString() {
        return "sra $" + GRF.regName.get(RegDst) + ", $" + GRF.regName.get(RegSrc1)
                + ", " + Imme + "\n";
    }
}
