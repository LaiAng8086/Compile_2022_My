package LLVMIR.Type;

public class PointerType extends AbstractType {
    private AbstractType toType;    //The type this pointer refers to.

    public PointerType(AbstractType ref) {
        toType = ref;
    }

    public int getSize() {  //32bits address.
        return 4;
    }

    public AbstractType getPointee() {
        return toType;
    }

    @Override
    public String toString() {
        return toType + "*";
    }

}
