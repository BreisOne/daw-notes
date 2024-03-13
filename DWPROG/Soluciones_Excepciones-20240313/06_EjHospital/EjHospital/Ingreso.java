/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjHospital;

import java.util.Date;

/**
 *
 * @author nccasares
 */
public class Ingreso {
    private Date fechaIngreso;
    private Date fechaAlta;
    private Area area;

    public Ingreso(Date fechaIngreso, Date fechaAlta, Area area) {
        this.fechaIngreso = fechaIngreso;
        this.fechaAlta = fechaAlta;
        this.area = area;
    }
    
    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public Date getFechaAlta() {
        return fechaAlta;
    }

    public void setFechaAlta(Date fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }
}
