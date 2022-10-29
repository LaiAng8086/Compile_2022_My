package Backend.Instructions;

public class Jal extends AbstractMIPSInstr {
    public Jal(String target) {
        setLabel(target);
    }

    @Override
    public String toString() {
        return "jal " + label + "\n";
    }
}
