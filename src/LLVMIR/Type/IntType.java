package LLVMIR.Type;

public class IntType extends AbstractType {
    private final int bits;

    public IntType(int width) {
        bits = width;
    }

    //注意：字节编码，直接规定int为4字节
    public int getSize() {
        return 4;
    }

    public int getBits() {
        return bits;
    }

    @Override
    public String toString() {
        return "i" + bits;
    }
}
