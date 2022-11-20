package Backend.Instructions;

public class Bgtz extends AbstractMIPSInstr {
    private int regSrc;
    private String target;

    public Bgtz(int src, String tar) {
        regSrc = src;
        target = tar;
    }

    @Override
    public String toString() {
        return "bgtz $" + regSrc + ", " + target + "\n";
    }
}
