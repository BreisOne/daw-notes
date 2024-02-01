public class Repartidor extends Empleado {
    private String zona;

    public Repartidor(String nombre, int edad, int salario, String zona){
        super(nombre, edad, salario);
        this.zona = zona;
    }

    public String getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona = zona;
    }

    public String plus() {
        if (edad < 25 && zona.equals("Zona 3")) {
            return "Tiene derecho al plus";
        }else {
            return "No tiene derecho al plus";
        }
    }
}
