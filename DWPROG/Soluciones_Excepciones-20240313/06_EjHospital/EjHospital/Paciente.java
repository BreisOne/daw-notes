/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjHospital;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author nuria
 */
public class Paciente extends Persona {

    private Date fechaIngreso;
    private String patologia;
    private HashMap<Integer, Ingreso> ingresos;

    public Paciente(Date fechaIngreso, String patologia, String DNI, String nombre, int edad, String direccion) {
        super(DNI, nombre, edad, direccion);
        this.fechaIngreso = fechaIngreso;
        this.patologia = patologia;
        this.ingresos = new HashMap<>();
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getPatologia() {
        return patologia;
    }

    public void setPatologia(String patologia) {
        this.patologia = patologia;
    }

    public HashMap<Integer, Ingreso> getIngresos() {
        return ingresos;
    }

    public void setIngresos(HashMap<Integer, Ingreso> ingresos) {
        this.ingresos = ingresos;
    }

    public void anhadirIngreso(Integer id, Ingreso ingreso) {
        this.ingresos.put(id, ingreso);
    }

    @Override
    public double calcularCosteAnual() {
        Iterator claves = ingresos.keySet().iterator();
        Ingreso ing;
        double costeParcial, costeTotal = 0;
        
        while (claves.hasNext()) {
            Integer codigo = (Integer) claves.next();
            ing = this.ingresos.get(codigo);
            
            // OBTENGO DIAS DE INGRESO
            long restaFechas = ing.getFechaAlta().getTime() - ing.getFechaIngreso().getTime();
            TimeUnit time = TimeUnit.DAYS;
            double diasIngreso = time.convert(restaFechas, TimeUnit.MILLISECONDS);
            
            // CALCULO EL COSTE POR ESE INGRESO
            costeParcial = diasIngreso * 700;
            if (ing.getArea().getNombre().equalsIgnoreCase("Traumatología")) {
                costeParcial *= 1.02;
            }
            
            // LO SUMO AL TOTAL DEL PACIENTE
            costeTotal += costeParcial;
        }
        
        return costeTotal;
    }
}
