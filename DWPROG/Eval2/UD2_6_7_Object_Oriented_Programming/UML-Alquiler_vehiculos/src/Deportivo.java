import lombok.Getter;
import lombok.Setter;

public class Deportivo extends  Vehiculo {

    @Getter @Setter
    private int cilindrada;

    public  Deportivo (String matricula, String marca, String modelo, String color, double tarifa, int cilindrada){
        super(matricula, marca, modelo, color, tarifa);
        this.cilindrada = cilindrada;
    }
}
