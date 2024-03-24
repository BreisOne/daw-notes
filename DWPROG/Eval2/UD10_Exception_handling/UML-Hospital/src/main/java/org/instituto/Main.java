package org.instituto;

import java.time.LocalDate;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {

        ArrayList<Persona> genteHospital = new ArrayList<>();

        Area trauma = new Area(1, "Traumatología");
        Area hemato = new Area(2, "Hematología");
        Area criticos = new Area(3, "UCI");

        AreaRegistro ingresoTrauma = new AreaRegistro(LocalDate.of(2023,01,15), LocalDate.of(2023,01,31), trauma);
        AreaRegistro ingresoHemato = new AreaRegistro(LocalDate.of(2023, 02, 01), LocalDate.of(2023,02,15), hemato);
        AreaRegistro ingresoCriticos = new AreaRegistro(LocalDate.of(2023,03,15), LocalDate.of(2023,03,31), criticos);

        Paciente paciente1 = new Paciente("12345678I", "Luis Hernandez", 35, "Rua Alfonso Tomás, 14", LocalDate.of(2023,01,15), "COVID");
        paciente1.addAreaIngreso(ingresoTrauma);
        paciente1.addAreaIngreso(ingresoHemato);
        paciente1.addAreaIngreso(ingresoCriticos);

        Paciente paciente2 = new Paciente("32145678I", "Martin Gonzalez", 40, "Rua Alfonso Tomás, 76", LocalDate.of(2023,01,15), "Caida desde tejado");
        paciente2.addAreaIngreso(ingresoTrauma);

        Paciente paciente3 = new Paciente("32145678I", "Martin Gonzalez", 40, "Rua Alfonso Tomás, 76", LocalDate.of(2023,02,01), "Anemia");
        paciente3.addAreaIngreso(ingresoHemato);

        Trabajador medico = new Trabajador("32145678I", "María Gonzalez", 45, "Rua Alfonso X, 76", LocalDate.of(2023,02,01), trauma,"Jefe de Servicio" ,35000);
        Trabajador enfermero = new Trabajador("45675678I", "Antonio Gonzalez", 25, "Rua Alfonso X, 76", LocalDate.of(2023,03,23), hemato,"enfermera" ,25000);
        Trabajador celador = new Trabajador("5675678I", "Jesus Gonzalez", 30, "Rua Venezuela, 12", LocalDate.of(2023,03,15), criticos,"celador" ,20000);

        genteHospital.add(paciente1);
        genteHospital.add(paciente2);
        genteHospital.add(paciente3);
        genteHospital.add(medico);
        genteHospital.add(enfermero);
        genteHospital.add(celador);

    }


}