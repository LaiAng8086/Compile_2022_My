package Backend.Instructions;

import Backend.GRF;

public class StoreWord extends AbstractMIPSInstr {
    public StoreWord(int src1, int imm, int dst) {
        setDst(dst);
        setSrc1(src1);
        setImme(imm);
    }

    @Override
    /**
     * 注意: RegDst是基址寄存器，RegSrc1是欲保存的寄存器编号
     */
    public String toString() {
        return "sw $" + GRF.regName.get(RegSrc1) + ", " + Imme + "($"
                + GRF.regName.get(RegDst) + ")\n";
    }
}
