public class Directivo extends Empleado{
    private String cargo;
    private String departamento;

    public Directivo(String nombre, int salario, String fechaIncorporacion, String Cargo, String departamento){
        super(nombre, salario, fechaIncorporacion);
        this.cargo = cargo;
        this.departamento = departamento;
    }

    public String toString() {
        return super.toString() +
                "cargo=" + cargo +
                "departamneto=" + departamento;
    }
}
