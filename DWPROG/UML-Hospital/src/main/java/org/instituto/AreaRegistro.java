package org.instituto;

import java.time.LocalDate;
public class AreaRegistro {
    private LocalDate fechaIngreso;
    private  LocalDate fechaSalida;
    private Area areaIngreso;

    public AreaRegistro(){
        this(LocalDate.of(0,0,0), LocalDate.of(0,0,0), new Area());
    }

    public AreaRegistro(LocalDate fechaIngreso, LocalDate fechaSalida, Area areaIngreso){
        this.fechaIngreso = fechaIngreso;
        this.fechaSalida = fechaSalida;
        this.areaIngreso = areaIngreso;
    }

    public LocalDate getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(LocalDate fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public LocalDate getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(LocalDate fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public Area getAreaIngreso() {
        return areaIngreso;
    }

    public void setAreaIngreso(Area areaIngreso) {
        this.areaIngreso = areaIngreso;
    }
}
