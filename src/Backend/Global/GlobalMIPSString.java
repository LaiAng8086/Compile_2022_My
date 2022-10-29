package Backend.Global;

public class GlobalMIPSString extends AbstractGlobal {
    private String content;

    public GlobalMIPSString(String name, String in) {
        content = in.replace("\\00", "");
        content = content.replace("\\0a", "\\n");
        setIdent(name);
    }

    @Override
    public String toString() {
        return ident + ": .asciiz " + content + "\n";
    }
}
