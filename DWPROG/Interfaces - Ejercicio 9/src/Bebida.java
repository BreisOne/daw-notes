public class Bebida extends Producto {
     protected String tipoEnvase;

    public Bebida(String id, String nombre, double precio, String marca, String localizador, String tipoEnvase) {
        super(id, nombre, precio, marca, localizador);
        this.tipoEnvase = tipoEnvase;
    }

    public String getTipoEnvase() {
        return tipoEnvase;
    }
    public void setTipoEnvase(String tipoEnvase) {
        this.tipoEnvase = tipoEnvase;
    }
    public double precioFinal(){
        return precio;
    }

    @Override
    public String toString() {
        return "Bebida{" +
                "tipoEnvase='" + tipoEnvase + '\'' +
                ", id='" + id + '\'' +
                ", nombre='" + nombre + '\'' +
                ", precio=" + precio +
                ", marca='" + marca + '\'' +
                ", localizador='" + localizador + '\'' +
                '}';
    }
}
