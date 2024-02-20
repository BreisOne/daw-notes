public class Refresco extends Bebida{
    private int porcAzucar;
    private boolean tienePromo;

    public Refresco(String id, String nombre, double precio, String marca,
                    String localizador, String tipoEnvase, int porcAzucar, boolean tienePromo) {
        super(id, nombre, precio, marca, localizador, tipoEnvase);
        this.porcAzucar = porcAzucar;
        this.tienePromo = tienePromo;
    }

    public int getPorcAzucar() {
        return porcAzucar;
    }

    public void setPorcAzucar(int porcAzucar) {
        this.porcAzucar = porcAzucar;
    }

    public boolean isTienePromo() {
        return tienePromo;
    }

    public void setTienePromo(boolean tienePromo) {
        this.tienePromo = tienePromo;
    }
    public double precioFinal(){
        double precio = this.precio;
        if (tienePromo){
            precio -= precio*0.15F;
        }
        if(tipoEnvase.equals("lata")){
            precio -= precio*0.05F;
        }
        if(porcAzucar>10){
            precio += precio*0.1F;
        }
        return precio;
    }

    @Override
    public String toString() {
        return "Refresco{" +
                "porcAzucar=" + porcAzucar +
                ", tienePromo=" + tienePromo +
                ", tipoEnvase='" + tipoEnvase + '\'' +
                ", id='" + id + '\'' +
                ", nombre='" + nombre + '\'' +
                ", precio=" + precio +
                ", marca='" + marca + '\'' +
                ", localizador='" + localizador + '\'' +
                '}';
    }
}
