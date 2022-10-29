package Backend.Instructions;

import Backend.GRF;

public class LoadWord extends AbstractMIPSInstr {
    public LoadWord(int dst, int imm, int src1) {
        setDst(dst);
        setSrc1(src1);
        setImme(imm);
    }

    @Override
    public String toString() {
        return "lw $" + GRF.regName.get(RegDst) + ", " + Imme + "($" +
                GRF.regName.get(RegSrc1) + ")\n";
    }
}
