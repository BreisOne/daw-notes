/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjHospital;

/**
 *
 * @author nuria
 */
public abstract class Persona {
    private String DNI;
    private String nombre;
    private int edad;
    private String direccion;

    public Persona(String DNI, String nombre, int edad, String direccion) {
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
    
    public abstract double calcularCosteAnual();
}
