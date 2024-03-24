package org.instituto;

import java.time.LocalDate;

public class Profesor extends Persona{
    private String tipoJornada;
    private double sueldo;
    private Especialidad especialidad;

    public Profesor(){
        super();
        this.tipoJornada = "";
        this.sueldo = 0;
        this.especialidad = new Especialidad();
    }
    public Profesor (String DNI, String nombre, int edad, LocalDate fechaNacimiento, LocalDate fechaIncorporacion,
                     String tipoJornada, double sueldo, Especialidad especialidad){

        super(DNI, nombre, edad, fechaNacimiento, fechaIncorporacion);
        this.tipoJornada = tipoJornada;
        this.sueldo = sueldo;
        this.especialidad = especialidad;

    }

    public String getTipoJornada() {
        return tipoJornada;
    }

    public void setTipoJornada(String tipoJornada) {
        this.tipoJornada = tipoJornada;
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

    public void aplicarBonificacion(){
        if(this.getFechaIncorporacion().getYear() - LocalDate.EPOCH.getYear()>3){
            this.sueldo += this.sueldo * 0.15;
        }
    }}
