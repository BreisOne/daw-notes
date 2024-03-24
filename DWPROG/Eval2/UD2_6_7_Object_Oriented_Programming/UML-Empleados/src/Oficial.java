public class Oficial extends Operario{
    private String lineaFabricacion;

    public Oficial( String nombre, int salario, String fechaIncorporacion, String area, String nave, String lineaFabricacion){
        super(nombre, salario, fechaIncorporacion, area, nave);
        this.lineaFabricacion = lineaFabricacion;
    }
    public String toString() {
        return super.toString() +
                "linea fabriaccion=" + lineaFabricacion;
    }
}
