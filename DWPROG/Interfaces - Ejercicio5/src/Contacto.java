public class Contacto {
    private String nombre;
    private int tlf;

    public Contacto(String nombre, int tlf){
        this.nombre = nombre;
        this.tlf = tlf;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTlf() {
        return tlf;
    }

    public void setTlf(int tlf) {
        this.tlf = tlf;
    }

    public String toString() {
        return "Contacto{" +
                "nombre='" + nombre + '\'' +
                ", tlf=" + tlf +
                '}';
    }
}
