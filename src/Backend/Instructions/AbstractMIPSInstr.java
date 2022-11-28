package Backend.Instructions;

public class AbstractMIPSInstr {
    protected int RegSrc1;
    protected int RegSrc2;
    protected int RegDst;
    protected long Imme;
    protected String label;

    public AbstractMIPSInstr() {
        ;
    }

    public void setSrc1(int reg) {
        RegSrc1 = reg;
    }

    public void setSrc2(int reg) {
        RegSrc2 = reg;
    }

    public void setDst(int reg) {
        RegDst = reg;
    }

    public void setImme(long imm) {
        Imme = imm;
    }

    public void setLabel(String t) {
        label = t.replace("@", "_");    //适应Mars模拟器不能读@
    }

    public int getSrc1() {
        return RegSrc1;
    }

    public int getSrc2() {
        return RegSrc2;
    }

    public int getDst() {
        return RegDst;
    }

    public long getImme() {
        return Imme;
    }

    public String getLabel() {
        return label;
    }
}
