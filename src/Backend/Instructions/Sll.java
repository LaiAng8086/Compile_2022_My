package Backend.Instructions;

import Backend.GRF;

public class Sll extends AbstractMIPSInstr {
    public Sll(int dst, int src1, long imm) {
        setSrc1(src1);
        setImme(imm);
        setDst(dst);
    }

    @Override
    public String toString() {
        return "sll $" + GRF.regName.get(RegDst) + ", $" + GRF.regName.get(RegSrc1)
                + ", " + Imme + "\n";
    }
}
