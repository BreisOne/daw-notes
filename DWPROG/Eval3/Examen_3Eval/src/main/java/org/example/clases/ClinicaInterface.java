package org.example.clases;

import java.sql.Statement;

public interface ClinicaInterface {
    void insertVet(Statement statement, String dniVet, String nombreVet, int edadVet, String direccion, Double sueldo, String especialidad, String fechaContrat);
    void insertMasc(Statement statement, String nombreMascota, String especie, String raza, String fechaNacimiento, String fechRegistro, String dniVeterinario);
    void deleteVet(Statement statement, String dni);
    void deleteMasc(Statement statement, int id);
    void showPetData(Statement statement, String dniVet);
    void showVetFromMasc(Statement statement,String nombreMasc, String especie);

    // Se debe devolver la ruta al fichero exportado
    String exportVetHighSalary(Statement statement);
    void modifyVetSalary(Statement statement, String dniVet, double salario);
    void modifyVetMasc(Statement statement, String nombre, String especie, String nombreVet);
}

