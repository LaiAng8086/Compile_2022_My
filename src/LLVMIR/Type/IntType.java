package LLVMIR.Type;

public class IntType extends AbstractType {
    private final int bits;

    public IntType(int width) {
        bits = width;
    }

    public int getSize() {
        return bits;
    }

    public int getBits() {
        return bits;
    }

    @Override
    public String toString() {
        return "i" + bits;
    }
}
