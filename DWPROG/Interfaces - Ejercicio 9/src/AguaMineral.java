public class AguaMineral extends Bebida{
    private String origen;
    public AguaMineral(String id, String nombre, int precio, String marca, String localizador, String tipoEnvase, String origen) {
        super(id, nombre, precio, marca, localizador, tipoEnvase);
        this.origen = origen;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public float precioFinal(){
        float precio = this.precio;

        if (this.tipoEnvase.equals("cristal")){
            precio += precio*0.15;
        }
        if(this.marca.equals("aguarón")){
            precio += 0.3F;
        }
        return precio;
    }
    public String toString() {
        return "AguaMineral{" +
                "origen='" + origen + '\'' +
                ", id='" + id + '\'' +
                ", nombre='" + nombre + '\'' +
                ", precio=" + precio +
                ", marca='" + marca + '\'' +
                ", localizador='" + localizador + '\'' +
                '}';
    }
}
