package LLVMIR;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.ArrayType;
import LLVMIR.Type.IntType;
import LLVMIR.Type.VoidType;
import LLVMIR.Value.Value;

import java.util.ArrayList;

public class IRUtil {
    public static Value getVoidValue() {
        return new Value("", new VoidType(), null);
    }

    public static AbstractType get1DArrayType(int width, int num) {
        IntType base = new IntType(width);
        return new ArrayType(base, num);
    }

    public static ArrayList<Value> getOnlyArg(Value arg) {
        ArrayList<Value> ret = new ArrayList<>();
        ret.add(arg);
        return ret;
    }
}
