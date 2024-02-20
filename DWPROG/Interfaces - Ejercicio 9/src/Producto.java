public class Producto {
    protected String id;
    protected String nombre;
    protected double precio;
    protected String marca;
    protected String localizador;

    public Producto( String id, String nombre,  double precio, String marca, String localizador){
        this.id = id;
        this.nombre = nombre;
        this.precio =  precio;
        this.marca = marca;
        this.localizador = localizador;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getLocalizador() {
        return localizador;
    }

    public void setLocalizador(String localizador) {
        this.localizador = localizador;
    }

    public String toString() {
        return "Producto{" +
                "id='" + id + '\'' +
                ", nombre='" + nombre + '\'' +
                ", precio=" + precio +
                ", marca='" + marca + '\'' +
                ", localizador='" + localizador + '\'' +
                '}';
    }
}
