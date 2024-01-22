import lombok.Getter;
import lombok.Setter;

public class Vehiculo {
    @Getter  @Setter
     private String matricula;
    @Getter @Setter
    private String marca;
    @Getter @Setter
    private String modelo;
    @Getter @Setter
    private String color;    
    @Getter @Setter
    private double tarifa;

    public  Vehiculo( String matricula, String marca, String modelo, String color, double tarifa ){
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
        this.color = color;
        this.tarifa = tarifa;
    }

}
