package LLVMIR.Type;

public class VoidType extends AbstractType {
    public VoidType() {

    }

    public int getSize() {
        return 0;
    }

    @Override
    public String toString() {
        return "void";
    }
}
