package Backend.Instructions;

import Backend.GRF;

public class Bgtz extends AbstractMIPSInstr {

    public Bgtz(int src, String tar) {
        setSrc1(src);
        setLabel(tar);
    }

    @Override
    public String toString() {
        return "bgtz $" + GRF.regName.get(getSrc1()) + ", " + getLabel() + "\n";
    }
}
