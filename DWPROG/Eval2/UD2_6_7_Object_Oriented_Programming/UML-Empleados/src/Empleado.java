import lombok.Getter;
import lombok.Setter;

public class Empleado {
    @Getter @Setter
    private String nombre;
    @Getter @Setter
    private int salario;
    @Getter @Setter
    private String fechaIncorporacion;

    public Empleado( String nombre, int salario, String fechaIncorporacion){
        this.nombre = nombre;
        this.salario = salario;
        this.fechaIncorporacion = fechaIncorporacion;
    }

    public String toString() {
        return "nombre=" + nombre +
                "salario=" + salario +
                "fecha incporación = " + fechaIncorporacion;
    }

}
