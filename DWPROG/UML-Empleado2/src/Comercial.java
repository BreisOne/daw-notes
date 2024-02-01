public class Comercial extends Empleado{
    private double comision;

    public Comercial(String nombre, int edad, int salario, double comision){
        super(nombre, edad, salario);
        this.comision = comision;
    }

    public double getComision() {
        return comision;
    }

    public void setComision(double comision) {
        this.comision = comision;
    }

    public String toString() {
        return super.toString() +
                "comision=" + comision;
    }

    public String plus() {
        if (edad > 30 && comision> 200) {
            return "Tiene derecho al plus";
        }else {
            return "No tiene derecho al plus";
        }
    }
}
