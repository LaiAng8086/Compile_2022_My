package LLVMIR.Value.Instruction;

import LLVMIR.Type.AbstractType;
import LLVMIR.Value.BasicBlock;
import LLVMIR.Value.Value;

import java.util.HashMap;
import java.util.Objects;

public class ICmpInstruction extends AbstractInstruction {
    private String cmpOp;
    private AbstractType cmpType;

    public static HashMap<String, String> convert = new HashMap<>();

    static {
        convert.put("LSS", "slt");
        convert.put("LEQ", "sle");
        convert.put("GRE", "sgt");
        convert.put("GEQ", "sge");
        convert.put("EQL", "eq");
        convert.put("NEQ", "ne");
    }

    public ICmpInstruction(String name, AbstractType type, BasicBlock belong, String cmp, AbstractType cmpType,
                           Value op1, Value op2) {
        super("%l" + name, type, belong);
        cmpOp = cmp;
        this.cmpType = cmpType;
        operands.add(0, op1);
        operands.add(1, op2);
    }

    public String getCmpOp() {
        return cmpOp;
    }

    public String toString() {
        return name + " = icmp " + cmpOp + " " + cmpType + " " + getOp1().getName() + ", " + getOp2().getName() + "\n";
    }

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof ICmpInstruction)) {
            return false;
        }
        return super.equals(o) && cmpOp.equals(((ICmpInstruction) o).getCmpOp());
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), cmpOp);
    }
}
