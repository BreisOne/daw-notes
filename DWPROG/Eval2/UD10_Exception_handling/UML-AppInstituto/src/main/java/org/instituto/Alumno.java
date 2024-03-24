package org.instituto;

import java.time.LocalDate;
public class Alumno extends Persona{
    private String ciclo;
    private double mediaNotas;
    private double importeMatricula;

    public Alumno(){
        super();
        this.ciclo = "";
        this.mediaNotas = 0;
        this.importeMatricula = 0;
    }
    public Alumno (String DNI, String nombre, int edad, LocalDate fechaNacimiento, LocalDate fechaIncorporacion,
                    String ciclo, double mediaNotas, double importeMatricula){

        super(DNI, nombre, edad, fechaNacimiento, fechaIncorporacion);
        this.ciclo = ciclo;
        this.mediaNotas = mediaNotas;
        this.importeMatricula = importeMatricula;

    }

    public String getCiclo() {
        return ciclo;
    }

    public void setCiclo(String ciclo) {
        this.ciclo = ciclo;
    }

    public double getMediaNotas() {
        return mediaNotas;
    }

    public void setMediaNotas(double mediaNotas) {
        this.mediaNotas = mediaNotas;
    }

    public double getImporteMatricula() {
        return importeMatricula;
    }

    public void setImporteMatricula(double importeMatricula) {
        this.importeMatricula = importeMatricula;
    }

    @Override
    public void aplicarBonificacion() {
        if(this.getFechaIncorporacion().getYear() - LocalDate.EPOCH.getYear()>2){

            this.importeMatricula -= this.importeMatricula*0.1;
        }
    }
}
