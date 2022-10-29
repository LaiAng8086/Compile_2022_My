package Backend.Instructions;

public class Label extends AbstractMIPSInstr {
    //适应Mars不能将@做标识符
    public Label(String t) {
        setLabel(t.replace("@", "_"));
    }

    @Override
    public String toString() {
        return label + ":\n";
    }
}
