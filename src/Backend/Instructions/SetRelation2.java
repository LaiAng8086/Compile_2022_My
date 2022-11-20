package Backend.Instructions;

import Backend.GRF;

public class SetRelation2 extends AbstractMIPSInstr {
    private String op;

    public SetRelation2(int dst, int src1, int imme, String rop) {
        setDst(dst);
        setSrc1(src1);
        setImme(imme);
        op = rop;
    }

    @Override
    public String toString() {
        return op + " $" + GRF.regName.get(getDst()) + ", $" +
                GRF.regName.get(getSrc1()) + ", " +
                getImme() + "\n";
    }
}
