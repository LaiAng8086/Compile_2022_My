package LLVMIR;

import LLVMIR.Type.AbstractType;
import LLVMIR.Type.ArrayType;
import LLVMIR.Type.IntType;
import LLVMIR.Type.VoidType;
import LLVMIR.Value.Constant.AbstractConstant;
import LLVMIR.Value.Constant.ConstantArray;
import LLVMIR.Value.Constant.ConstantInt;
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

    // 按照C语言规范，维数从右往左组装
    public static ArrayType buildArrayType(AbstractType basicTy, ArrayList<Integer> dims) {
        AbstractType ret = basicTy;
        for (int i = dims.size() - 1; i >= 0; i--) {
            ret = new ArrayType(ret, dims.get(i));
        }
        return (ArrayType) ret;
    }


    public static int accessArray(ConstantArray obj, ArrayList<Integer> dims) {
        AbstractConstant locate = obj;
        for (int i = 0; i < dims.size(); i++) {
            locate = ((ConstantArray) locate).getElementByIndex(dims.get(i));
        }
        return ((ConstantInt) locate).getVal();
    }

    public static ConstantArray buildAllZero1D(int num) {
        ArrayList<AbstractConstant> eles = new ArrayList<>();
        for (int i = 0; i < num; i++) {
            eles.add(new ConstantInt(0, 32));
        }
        return new ConstantArray("", new IntType(32),
                num, eles);
    }

    //注意：为了保证正确，应当为2维及以上
    public static ConstantArray buildAllZeroArray(ArrayList<Integer> dims) {
        if (dims.size() == 1) {
            return buildAllZero1D(dims.get(0));
        }
        ArrayType nowType = buildArrayType(new IntType(32), dims);
        int nowDims = dims.get(0);
        dims.remove(0);
        ArrayList<AbstractConstant> nowElements = new ArrayList<>();
        for (int i = 0; i < nowDims; i++) {
            nowElements.add(buildAllZeroArray(dims));
        }
        //按照一维去理解数组，num填当前维的元素个数
        return new ConstantArray("", nowType, nowDims, nowElements);
    }
}
