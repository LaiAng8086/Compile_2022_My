package Backend.Instructions;

public class StoreWord2 extends AbstractMIPSInstr {
    public StoreWord2(int src1, String to) {
        setSrc1(src1);
        setLabel(to);
    }

    @Override
    public String toString() {
        return "sw $" + RegSrc1 + ", " + label + "\n";
    }
}
