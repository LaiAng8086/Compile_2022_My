package LLVMIR.Type;

public class LabelType extends AbstractType {
    public int getSize() {
        return 0;
    }

    @Override
    public String toString() {
        return "label";
    }
}
