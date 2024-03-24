public abstract class Persona {
    private String DNI;
    private String nombre;
    private String apellidos;
    private int edad;

    public Persona(String DNI, String nombre, String apellidos, int edad){
        this.DNI = DNI;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.edad = edad;
    }

    public  String getDNI(){
        return DNI;
    }
    public String getNombre(){
        return  nombre;
    }
    public  String getApellidos(){
        return apellidos;
    }

    public void setDNI(String DNI){
        this.DNI = DNI;
    }

    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public void setApellidos(String apellidos){
        this.apellidos = apellidos;
    }
    public void setEdad(int edad){
        this.edad = edad;
    }
}
