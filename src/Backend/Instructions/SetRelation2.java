package Backend.Instructions;

import Backend.GRF;

public class SetRelation2 extends AbstractMIPSInstr {
    private String op;

    //一个寄存器+一个立即数版本 注：slt没有此种用途，因为基础指令只支持16位
    public SetRelation2(int dst, int src1, long imme, String rop) {
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
