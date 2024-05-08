package org.example.clases;

import java.time.LocalDate;
import java.util.Date;

public class Veterinario {
    private String dni = "";
    private String nombre = "";
    private int edad;
    private String direccion = "";
    private double sueldo;
    private Especialidad especialidad;
    private LocalDate fechaContratacion;

    public Veterinario(String DNI, String nombre, int edad, String direccion, double sueldo, Especialidad especialidad, LocalDate fechaContratacion){
        this.dni = dni;
        this.nombre = nombre;
        this.edad = edad;
        this.direccion = direccion;
        this.sueldo = sueldo;
        this.especialidad = especialidad;
        this.fechaContratacion = fechaContratacion;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
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

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public Especialidad getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(Especialidad especialidad) {
        this.especialidad = especialidad;
    }

    public LocalDate getFechaContratacion() {
        return fechaContratacion;
    }

    public void setFechaContratacion(LocalDate fechaContratacion) {
        this.fechaContratacion = fechaContratacion;
    }

    @Override
    public String toString() {
        return "Veterinario{" +
                "dni='" + dni + '\'' +
                ", nombre='" + nombre + '\'' +
                ", edad=" + edad +
                ", direccion='" + direccion + '\'' +
                ", sueldo=" + sueldo +
                ", especialidad=" + especialidad +
                ", fechaContratacion=" + fechaContratacion +
                '}';
    }
}
