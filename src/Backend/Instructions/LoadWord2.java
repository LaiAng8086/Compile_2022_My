package Backend.Instructions;

public class LoadWord2 extends AbstractMIPSInstr {
    public LoadWord2(int dst, String from) {
        setDst(dst);
        setLabel(from);
    }

    @Override
    public String toString() {
        return "lw $" + RegDst + ", " + label + "\n";
    }
}
