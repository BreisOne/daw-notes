public class Alimento extends Producto{

    protected String categoria;
    protected  boolean contieneGluten;
    public Alimento(String id, String nombre, double precio, String marca,
                    String localizador, String categoria, boolean conteieneGluten) {
        super(id, nombre, precio, marca, localizador);
        this.categoria = categoria;
        this.contieneGluten = conteieneGluten;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public boolean isContieneGluten() {
        return contieneGluten;
    }

    public void setContieneGluten(boolean contieneGluten) {
        this.contieneGluten = contieneGluten;
    }

    @Override
    public String toString() {
        return "Alimento{" +
                "categoria='" + categoria + '\'' +
                ", contieneGluten=" + contieneGluten +
                ", id='" + id + '\'' +
                ", nombre='" + nombre + '\'' +
                ", precio=" + precio +
                ", marca='" + marca + '\'' +
                ", localizador='" + localizador + '\'' +
                '}';
    }
}
