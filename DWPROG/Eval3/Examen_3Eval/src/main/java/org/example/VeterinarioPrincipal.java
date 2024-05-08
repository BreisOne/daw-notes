package org.example;
import org.example.clases.Clinica;
import org.example.db.Menus;

import java.sql.Statement;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

public class VeterinarioPrincipal {


    public static void main(String[] args) {
        Statement statement = Clinica.crearBD();
        Clinica clinica = new Clinica();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        Scanner sc = new Scanner(System.in);
        int opcion = 0;

        do {
            Menus.showOptions();
            opcion = sc.nextInt();
            sc.nextLine();

            switch (opcion){
                case 1:
                    Menus.showOptionsInsert();
                    int userOption = sc.nextInt();
                    sc.nextLine();

                    if(userOption == 1){
                        System.out.println("Cual es el nombre de la mascota");
                        String nombreMascota = sc.nextLine();

                        System.out.println("Cual es el nombre de la especie");
                        String especie = sc.nextLine();

                        System.out.println("Cual es el nombre de la raza");
                        String raza = sc.nextLine();

                        System.out.println("Cual es el nombre de la fechaNacimiento");
                        String fechaNacimiento = sc.nextLine();

                        System.out.println("Cual es el nombre de la fechaRegistro");
                        String fechRegistro = sc.nextLine();

                        System.out.println("Cual es el dni de su veterinario");
                        String dniVeterinario = sc.nextLine();

                        //Veterinario veterinario = clinica.showVetFromName(statement, nombreVeterinario);

                        //Mascota mascota = new Mascota(idMascota, nombreMascota, especie, raza,
                                                        //LocalDate.parse(fechaNacimiento, formatter),
                                                        //LocalDate.parse(fechRegistro, formatter), veterinario);

                        clinica.insertMasc(statement, nombreMascota, especie, raza, fechaNacimiento, fechRegistro, dniVeterinario );

                    } else if (userOption == 2) {
                        System.out.println("Cual es el dni del veterinario");
                        String dniVet = sc.nextLine();

                        System.out.println("Cual es el nombre del veterinario");
                        String nombreVet = sc.nextLine();

                        System.out.println("Cual es la edad del veterinario");
                        int edadVet = sc.nextInt();
                        sc.nextLine();

                        System.out.println("Cual es la direccion del veterinario");
                        String direccion = sc.nextLine();

                        System.out.println("Cual es el sueldo del veterinario ");
                        double sueldo = sc.nextDouble();
                        sc.nextLine();

                        System.out.println("Cual es el id la especialidad del veterinario");
                        String especialidad = sc.nextLine();

                        System.out.println("Cual es la  fecha de contratación del veterinario");
                        String fechaContrat = sc.nextLine();


                        //Veterinario veterinario = new Veterinario(dniVet, nombreVet, edadVet, direccion, sueldo, especialidad,
                                                        //LocalDate.parse(fechaContrat, formatter));

                        clinica.insertVet(statement, dniVet, nombreVet, edadVet, direccion, sueldo, especialidad, fechaContrat);

                    } else if (userOption == 3) {
                        opcion = 5;
                    }else {
                        System.out.println("No has elegido una opción valida");
                    }
                    break;
                case 2:
                    Menus.showOptionsDelete();
                    int deleteOption = sc.nextInt();
                    sc.nextLine();

                    if(deleteOption == 1){

                        System.out.println("Cual es el id de la mascota que quieres eliminar");
                        int id = sc.nextInt();
                        sc.nextLine();

                        clinica.deleteMasc(statement, id);
                    } else if (deleteOption == 2) {

                        System.out.println("Cual es el DNI del veterinario que quieres eliminar");
                        String dni = sc.nextLine();
                        clinica.deleteVet(statement, dni);

                    } else if (deleteOption == 3) {
                        opcion = 5;
                    }else {
                        System.out.println("No has elegido una opción valida");
                    }
                    break;
                case 3:
                    Menus.showOptionsQueries();
                    int queryOption = sc.nextInt();
                    sc.nextLine();

                    if(queryOption == 1){

                        System.out.print("Cual es el nombre del veterinario?");
                        String nomVet = sc.nextLine();
                        clinica.showPetData(statement, nomVet);

                    } else if (queryOption == 2){
                        System.out.println("Cual es el nombre de la mascota?");
                        String nombreMasc = sc.nextLine();
                        System.out.println("De que especie es?");
                        String especie = sc.nextLine();

                        clinica.showVetFromMasc(statement, nombreMasc, especie);
                    } else if (queryOption == 3) {
                        clinica.exportVetHighSalary(statement);
                    }else if (queryOption == 4){
                        opcion = 5;
                    }else {
                        System.out.println("No has elegido una opción valida");
                    }
                    break;
                case 4:
                    Menus.showOptionsModify();
                    int modOption = sc.nextInt();
                    sc.nextLine();

                    if(modOption == 1){
                        System.out.println("Cual es el DNI del veterinario que quieres modificar");
                        String dni = sc.nextLine();

                        System.out.println("Cual es el nuevo salario que quieres introducir?");
                        double salario = sc.nextDouble();
                        clinica.modifyVetSalary(statement, dni, salario);

                    }else if( modOption == 2){
                        System.out.println("Cual es el nombre de la mascota");
                        String nombre = sc.nextLine();

                        System.out.println("Cual es el nombre de la especie");
                        String especie = sc.nextLine();

                        System.out.println("Cual es el nombre del veterinario que quieres asignarle");
                        String nombreVet = sc.nextLine();

                        clinica.modifyVetMasc(statement, nombre, especie, nombreVet);

                    }else if(modOption == 3){
                        opcion = 5;
                    }else {
                        System.out.println("No has elegido una opción valida");
                    }
                    break;
                case 5:
                    System.out.println("Adiós!!");
                default:
                    System.out.println("NO has elegido una opción Valida");
            }

        } while (opcion != 5);


    }
}
