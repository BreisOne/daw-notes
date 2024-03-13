/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjHospital;

import java.util.Date;

/**
 *
 * @author nuria
 */
public class Trabajador extends Persona{
    private Date fechaIncorporacion;
    private double sueldo;
    private String cargo;
    private Area area;

    public Trabajador(String cargo, double sueldo, Area area, Date fechaIncorporacion, String DNI, String nombre, int edad, String direccion) {
        super(DNI, nombre, edad, direccion);
        this.fechaIncorporacion = fechaIncorporacion;
        this.sueldo = sueldo;
        this.cargo = cargo;
        this.area = area;
    }

    public Date getFechaIncorporacion() {
        return fechaIncorporacion;
    }

    public void setFechaIncorporacion(Date fechaIncorporacion) {
        this.fechaIncorporacion = fechaIncorporacion;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    @Override
    public double calcularCosteAnual() {
        return this.getSueldo()*14*1.05;
    }
}
