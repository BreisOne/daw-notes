public class Operario extends Empleado{
    private String area;
    private String nave;

    public Operario(String nombre, int salario, String fechaIncorporacion, String area, String nave){
        super(nombre, salario, fechaIncorporacion);
        this.area = area;
        this.nave = nave;
    }
    public String toString() {
        return super.toString() +
                "area=" + area +
                "nave=" + nave;
    }
}
