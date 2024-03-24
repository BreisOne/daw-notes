package org.instituto;

import java.time.Duration;
import java.util.ArrayList;
import java.time.LocalDate;
import java.util.concurrent.atomic.AtomicInteger;

public class Paciente extends Persona{

    private LocalDate fechaIngreso;
    private String patologia;
    private ArrayList<AreaRegistro> areasIngreso;

    public Paciente(){
        super();
        this.fechaIngreso = LocalDate.of(0,0, 0);
        this.patologia = "";
    }

    public Paciente(String DNI, String nombre, int edad, String direccion, LocalDate fechaIngreso, String patologia) {
        super(DNI, nombre, edad, direccion);
        this.fechaIngreso = fechaIngreso;
        this.patologia = patologia;
    }

    public LocalDate getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(LocalDate fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getPatologia() {
        return patologia;
    }

    public void setPatologia(String patologia) {
        this.patologia = patologia;
    }

    public ArrayList<AreaRegistro> getAreasIngreso() {
        return areasIngreso;
    }

    public void setAreasIngreso(ArrayList<AreaRegistro> areasIngreso) {
        this.areasIngreso = areasIngreso;
    }
    public void addAreaIngreso ( AreaRegistro areaIngreso){
        this.areasIngreso.add(areaIngreso);
    }

    public boolean ingresoEnTrauma(){
        return  areasIngreso.stream().anyMatch(areaRegistro -> (areaRegistro.getAreaIngreso().getNombreEspecialidad() == "Traumatología"));
    };
    public int costeAnual(){

        //AtomicInteger totalDays = new AtomicInteger();
        //areasIngreso.forEach(areaRegistro -> {
          // int daysInArea = (int) Duration.between(areaRegistro.getFechaIngreso(), areaRegistro.getFechaSalida()).toDays();
            //totalDays.addAndGet(daysInArea);
        //});

        int totalDays = (int) Duration.between(fechaIngreso, areasIngreso.getLast().getFechaSalida()).toDays();

        //int costeAnual = totalDays.get() * 700;

        int costeAnual = totalDays * 700;

        if (ingresoEnTrauma()){
            costeAnual += (int) (costeAnual*0.02);
        }

        return costeAnual;
    }


}
