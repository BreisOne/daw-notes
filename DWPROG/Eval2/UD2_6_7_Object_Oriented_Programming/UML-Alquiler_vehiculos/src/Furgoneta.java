import lombok.Getter;
import lombok.Setter;

public class Furgoneta extends  Vehiculo{
    @Getter @Setter
    private double carga;

    @Getter @Setter
    private double volumen;

    public Furgoneta(String matricula, String marca, String modelo, String color, double tarifa, double carga, double volumen){
        super(matricula, marca, modelo, color, tarifa);
        this.carga = carga;
        this.volumen = volumen;
    }

}
