package Backend.Global;

import java.util.ArrayList;

public class GlobalMIPSVar extends AbstractGlobal {
    private ArrayList<Integer> initvals;
    private int size;   //以字节为单位

    public GlobalMIPSVar(String name, int newSiz) {
        setIdent(name);
        size = newSiz;
        initvals = new ArrayList<>();
    }

    public void addInitval(int newn) {
        initvals.add(newn);
    }

    public void addAllInitvals(ArrayList<Integer> newn) {
        initvals.addAll(newn);
    }

    @Override
    public String toString() {
        if (initvals.size() > 0) {
            StringBuilder ret = new StringBuilder();
            ret.append(ident).append(": .word ");
            for (int i = 0; i < initvals.size(); i++) {
                if (i == 0) {
                    ret.append(initvals.get(i));
                } else {
                    ret.append(", ").append(initvals.get(i));
                }
            }
            ret.append("\n");
            return ret.toString();
        } else {
            return ident + ": .space " + size + "\n";
        }
    }
}
