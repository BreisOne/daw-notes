package Comerciales;

public class Comercial {
    private String nombre;
    private String apellidos;
    private int edad;
    private String zona;
    private RegistroComercial registrosProductos;

    public Comercial(){
        this("","",0,"", new RegistroComercial());
    }
    public Comercial( String nombre, String apellidos, int edad, String zona, RegistroComercial registrosProductos){
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.edad = edad;
        this.zona = zona;
        this.registrosProductos = registrosProductos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona = zona;
    }

    public RegistroComercial getRegistrosProductos() {
        return registrosProductos;
    }

    public void setRegistrosProductos(RegistroComercial registrosProductos) {
        this.registrosProductos = registrosProductos;
    }
}
