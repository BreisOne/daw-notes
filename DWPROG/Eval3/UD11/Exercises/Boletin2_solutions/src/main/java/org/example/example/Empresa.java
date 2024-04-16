package org.example.example;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlElementWrapper;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlType;

import java.util.ArrayList;

@XmlRootElement(name = "empresa")
// Se indica el orden de aparición en el documento (indicando el nombre del campo en la clase)
@XmlType(propOrder = {"razonsocial", "cif", "empleados"})
public class Empresa {
    private String cif;
    private String razonsocial;
    private ArrayList<Empleado> empleados;

    public String getCif() {
        return cif;
    }

    public void setCif(String cif) {
        this.cif = cif;
    }

    @XmlElement(name = "razon_social")
    public String getRazonsocial() {
        return razonsocial;
    }

    public void setRazonsocial(String razonsocial) {
        this.razonsocial = razonsocial;
    }

    @XmlElementWrapper(name = "empleados")
    @XmlElement(name = "empleado")
    public ArrayList<Empleado> getEmpleados() {
        return empleados;
    }

    public void setEmpleados(ArrayList<Empleado> empleados) {
        this.empleados = empleados;
    }
}
