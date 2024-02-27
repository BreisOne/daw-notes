import lombok.Getter;
import lombok.Setter;

public class Cliente {
    @Getter @Setter
    private String DNI;
    @Getter @Setter
    private String nombre;

    @Getter @Setter
    private String apellidos;

    public Cliente( String DNI, String nombre, String apellidos){
        this.DNI = DNI;
        this.nombre = nombre;
        this.apellidos = apellidos;
    }




}
