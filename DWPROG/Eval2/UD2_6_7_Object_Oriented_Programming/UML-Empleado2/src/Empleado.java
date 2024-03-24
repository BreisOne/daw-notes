public abstract class Empleado {
    private String nombre;
    protected int edad;
    protected int salario;
    protected int plus;
    final static int PLUS = 300;


    public Empleado(String nombre, int edad, int salario){
        this(nombre, edad, salario, PLUS);
    }
    public Empleado(String nombre, int edad, int salario, int plus){
        this.nombre = nombre;
        this.edad = edad;
        this.salario = salario;
        this.plus = plus;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getSalario() {
        return salario;
    }

    public void setSalario(int salario) {
        this.salario = salario;
    }

    public String toString() {
        return  "nombre='" + nombre + '\'' +
                "edad=" + edad +
                "salario=" + salario +
                "plus=" + plus;
    }

    public abstract String plus();
}
