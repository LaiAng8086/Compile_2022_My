package Backend.Instructions;

public class NoCondJump extends AbstractMIPSInstr {
    public NoCondJump(String target) {
        setLabel(target);
    }

    @Override
    public String toString() {
        return "j " + label + "\n";
    }
}
