package LLVMIR.Type;

public class ArrayType extends AbstractType {
    private final AbstractType elementType;
    private final int elementNum;

    public ArrayType(AbstractType ty, int num) {
        elementType = ty;
        elementNum = num;
    }

    public int getSize() {
        return elementNum * elementType.getSize();
    }

    @Override
    public String toString() {
        return "[" + elementNum + " x " + elementType.toString() + "]";
    }
}
