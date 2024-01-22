import lombok.Getter;
import lombok.Setter;

public class Turismo extends Vehiculo{

    @Getter  @Setter
     private int numPuertas;
    @Getter @Setter
     private boolean automatico;

    public  Turismo(String matricula, String marca, String modelo, String color, double tarifa, int numPuertas, boolean automatico){
        super( matricula, marca, modelo, color, tarifa);
        this.numPuertas = numPuertas;
        this.automatico = automatico;
    }

}
