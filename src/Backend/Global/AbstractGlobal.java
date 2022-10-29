package Backend.Global;

public class AbstractGlobal {
    protected String ident;

    public AbstractGlobal() {
        ;
    }

    //适应Mars运行
    public void setIdent(String name) {
        ident = name.replace("@", "_");
    }

}
