
/**
 *
 * @author nccasares
 */
public class Comercial extends Empleado {

    private double comision;

    public Comercial(double comision, String nombre, String DNI, int edad, double salario)  {
        super(nombre, DNI, edad, salario);
        this.comision = comision;
    }

    public double getComision() {
        return comision;
    }

    public void setComision(double comision) {
        this.comision = comision;
    }

    @Override
    public String toString() {
        return super.toString() + " comision=" + comision;
    }

    /**
     * Si tiene mas de 30 años y la comision es mayor que 200, aumentamos el
     * sueldo al empleado
     *
     * @return
     */
    @Override
    public boolean plus() {

        if (super.getEdad() > 30 && this.comision > 200) {
            //Con super. llamo a un metodo de la clase padre
            double nuevoSalario = super.getSalario() + super.PLUS;
            super.setSalario(nuevoSalario);
            System.out.println("Se le añadido el plus, al empleado " + super.getNombre());
            return true;
        }
        return false;

    }
}
