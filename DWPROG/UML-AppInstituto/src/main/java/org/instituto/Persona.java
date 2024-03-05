package org.instituto;
import java.time.LocalDate;

public abstract class Persona {
    private String DNI;
    private String nombre;
    private int edad;
    private LocalDate fechaNacimiento;

    private LocalDate fechaIncorporacion;

    public  Persona(){
        this("","",0,LocalDate.of(0,0,0),LocalDate.of(0,0,0));
    }
    public  Persona(String DNI, String nombre, int edad, LocalDate fechaNacimiento, LocalDate fechaIncorporacion){
        this.DNI = DNI;
        this.nombre = nombre;
        this.edad = edad;
        this.fechaNacimiento = fechaNacimiento;
        this.fechaIncorporacion = fechaIncorporacion;
    }

    public String getDNI() {
        return DNI;
    }
    public void setDNI(String DNI) {
        this.DNI = DNI;
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

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public LocalDate getFechaIncorporacion() {
        return fechaIncorporacion;
    }

    public void setFechaIncorporacion(LocalDate fechaIncorporacion) {
        this.fechaIncorporacion = fechaIncorporacion;
    }

    public abstract void aplicarBonificacion();
}
