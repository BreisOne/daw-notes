import java.time.LocalDate;

public class Titular {
    private String nombre;
    private LocalDate fechaNacimiento;
    private String DNI;
    final static char SEXO = 'H';
    private char sex;
    private String direccion;

    public  Titular(){
        this("", LocalDate.of(0,0,0),  SEXO,"", "");
    }
    public Titular(String nombre, LocalDate fechaNacimiento, char SEXO){
        this(nombre, fechaNacimiento, SEXO,"", "");
    }
    public Titular(String nombre, LocalDate fechaNacimiento, char SEXO, String DNI, String direccion){
        this.nombre = nombre;
        this.fechaNacimiento = fechaNacimiento;
        this.sex = SEXO;
        this.DNI = DNI;
        this.direccion = direccion;
    }

    public String getNombre(){

        return this.nombre;
    }
    public void setNombre(String nombre){

        this.nombre = nombre;
    }

    public LocalDate getFechaNacimiento(){

        return this.fechaNacimiento;
    }
    public void setFechaNacimiento(LocalDate fechaNacimiento){

        this.fechaNacimiento = fechaNacimiento;
    }

    public String getDNI(){
        return this.nombre;
    }

    public void setDNI(String DNI){

        this.DNI = DNI;
    }

    public String getSEXO(){

        return this.nombre;
    }
    public void setSEXO(char SEXO){

        this.sex = SEXO;
    }
    public String getDireccion(){

        return this.direccion;
    }
    public void setDireccion(String direccion){

        this.direccion = direccion;
    }

    //Metodos de la clase
    public boolean esMayorDeEdad(){

        return false;
    }
    public void comprobarSexo(char sexo){

    };




}
