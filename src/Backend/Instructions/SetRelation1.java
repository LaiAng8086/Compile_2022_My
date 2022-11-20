package Backend.Instructions;

import Backend.GRF;

public class SetRelation1 extends AbstractMIPSInstr {
    private String op;

    //双寄存器类型
    public SetRelation1(int dst, int src1, int src2,String rop) {
        setDst(dst);
        setSrc1(src1);
        setSrc2(src2);
        op = rop;
    }

    @Override
    public String toString() {
        return op + " $" + GRF.regName.get(getDst()) + ", $" +
                GRF.regName.get(getSrc1()) + ", $" +
                GRF.regName.get(getSrc2()) + "\n";
    }

}
