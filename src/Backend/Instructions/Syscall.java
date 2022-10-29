package Backend.Instructions;

public class Syscall extends AbstractMIPSInstr {
    public Syscall() {
        ;
    }

    @Override
    public String toString() {
        return "syscall\n";
    }

}
