package org.instituto;

import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        ArrayList<Persona> miembros = new ArrayList<>();
        Scanner scanner = new Scanner(System.in);

        do {
            System.out.println("_______________________");
            System.out.println("Si quieres dar una alta teclea 1");
            System.out.println("Si quieres dar una baja teclea 2");
            System.out.println("Si quieres dar una baja teclea 3");

            int userInput = scanner.nextInt();
            scanner.nextLine();

            if(userInput == 1){

            }else if(userInput == 2){

            } else if (userInput == 3) {

            }else {

                System.out.println("Elige una opción valida por favor");
            }

        }while (true);

        Alumno alumno1 = new Alumno("12356578R", "Jaime", 15, new Date(20,05,2008),new Date( 30, 09, 2022), "DAW", 7.8, 200);
        Alumno alumno2 = new Alumno("12375378R", "Maria", 16, new Date(15,07,2009),new Date( 30, 10, 2022), "ASIR", 7.8, 200);

        Especialidad matematicas = new Especialidad(1, "matematicas");
        Especialidad lenguaCatellana = new Especialidad(1, "castellano");

        Profesor profesorMatematicas = new Profesor("1543212578R", "Jacobo", 45, new Date(20,05,1995), new Date( 30, 09, 2015), "completa", 35000, matematicas);
        Profesor profesorCastellano = new Profesor("1423212578R", "Lucia", 35, new Date(20,05,1985), new Date( 30, 12, 2011), "parcial", 25000, lenguaCatellana);
        miembros.add(alumno1);
        miembros.add(alumno2);
        miembros.add(profesorCastellano);
        miembros.add(profesorMatematicas);


    }
    public static
}