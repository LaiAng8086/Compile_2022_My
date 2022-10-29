package Backend.Instructions;

import Backend.GRF;

public class Move extends AbstractMIPSInstr {
    public Move(int src1, int src2) {
        setSrc1(src1);
        setSrc2(src2);
    }

    @Override
    public String toString() {
        return "move $" + GRF.regName.get(RegSrc1) + ", $" + GRF.regName.get(RegSrc2) + "\n";
    }
}
