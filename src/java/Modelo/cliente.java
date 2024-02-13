
package Modelo;

public class cliente {
    private char cltId;
    private String cltCorreo;
    private String cltContraseña;

    public cliente() {
    }

    public char getCltId() {
        return cltId;
    }

    public void setCltId(char cltId) {
        this.cltId = cltId;
    }

    public String getCltCorreo() {
        return cltCorreo;
    }

    public void setCltCorreo(String cltCorreo) {
        this.cltCorreo = cltCorreo;
    }

    public String getCltContraseña() {
        return cltContraseña;
    }

    public void setCltContraseña(String cltContraseña) {
        this.cltContraseña = cltContraseña;
    }

    public cliente(char cltId, String cltCorreo, String cltContraseña) {
        this.cltId = cltId;
        this.cltCorreo = cltCorreo;
        this.cltContraseña = cltContraseña;
    }

   
}
