package org.instituto;
import java.time.LocalDate;
public class Trabajador extends Persona {
    private LocalDate fechaIncorporacion;
    private Area areaSanitaria;
    private String cargo;
    private int salario;

    public  Trabajador(){
        super();
        this.fechaIncorporacion = LocalDate.of(0,0,0);
        this.areaSanitaria = new Area();
        this.salario = 0;
    }
    public Trabajador(String DNI, String nombre, int edad, String direccion, LocalDate fechaIncorporacion, Area areaSanitaria, String cargo, int salario) {
        super(DNI, nombre, edad, direccion);
        this.fechaIncorporacion = fechaIncorporacion;
        this.areaSanitaria = areaSanitaria;
        this.cargo = cargo;
        this.salario = salario;
    }

    public LocalDate getFechaIncorporacion() {
        return fechaIncorporacion;
    }

    public void setFechaIncorporacion(LocalDate fechaIncorporacion) {
        this.fechaIncorporacion = fechaIncorporacion;
    }

    public Area getAreaSanitaria() {
        return areaSanitaria;
    }

    public void setAreaSanitaria(Area areaSanitaria) {
        this.areaSanitaria = areaSanitaria;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public int getSalario() {
        return salario;
    }

    public void setSalario(int salario) {
        this.salario = salario;
    }

    public int costeAnual(){
        int sueldoAnual=salario*14;
        return sueldoAnual += (int) (sueldoAnual*0.05);
    }
}
