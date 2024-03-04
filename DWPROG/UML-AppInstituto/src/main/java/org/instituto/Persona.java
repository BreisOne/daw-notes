package org.instituto;

import java.util.Date;

public abstract class Persona {
    private String DNI;
    private String nombre;
    private int edad;
    private Date fechaNacimiento;

    private Date fechaIncorporacion;

    public  Persona(){
        this("","",0,new Date(),new Date());
    }
    public  Persona(String DNI, String nombre, int edad, Date fechaNacimiento, Date fechaIncorporacion){
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

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Date getFechaIncorporacion() {
        return fechaIncorporacion;
    }

    public void setFechaIncorporacion(Date fechaIncorporacion) {
        this.fechaIncorporacion = fechaIncorporacion;
    }

    public abstract void aplicarBonificacion();
}
