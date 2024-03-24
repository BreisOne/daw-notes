/**
 *
 * @author nccasares
 */
public class Repartidor extends Empleado {

    private String zona;

    public Repartidor(String zona, String nombre, String DNI, int edad, double salario){
        super(nombre, DNI, edad, salario);
        this.zona = zona;
    }

    public String getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona = zona;
    }

    @Override
    public String toString() {
        return super.toString() + " zona=" + zona;
    }

    /**
     * Si tiene menos de 25 años y la zona es "zona 3",
     * aumentamos el sueldo al empleado
     * @return
     */
    @Override
    public boolean plus() {

        if (super.getEdad() < 25 && this.zona.equalsIgnoreCase("zona 3")) {
            double nuevoSalario = super.getSalario() + super.PLUS;
            super.setSalario(nuevoSalario);
            System.out.println("Se le ha añadido el plus, al empleado "+super.getNombre());
            return true;
        }

        return false;
    }
}
