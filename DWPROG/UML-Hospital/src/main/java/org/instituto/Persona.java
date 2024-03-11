package org.instituto;

import java.util.concurrent.atomic.AtomicInteger;

public abstract class Persona {
    private String DNI;
    private String nombre;
    private int edad;
    private String direccion;

    public Persona(){
        this("","",0,"");
    }
    public Persona( String DNI, String nombre, int edad, String direccion){
        this.DNI = DNI;
        this.nombre = nombre;
        this.edad = edad;
        this.direccion = direccion;
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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public abstract int costeAnual();
}
