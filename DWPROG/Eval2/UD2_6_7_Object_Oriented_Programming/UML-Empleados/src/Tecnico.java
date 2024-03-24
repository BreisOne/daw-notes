public class Tecnico extends Operario{
    private String seccion;

    public Tecnico( String nombre, int salario, String fechaIncorporacion, String area, String nave, String seccion){
        super(nombre, salario, fechaIncorporacion, area, nave);
        this.seccion = seccion;
    }

    public String toString() {
        return super.toString() +
                "seccion=" + seccion;
    }
}
