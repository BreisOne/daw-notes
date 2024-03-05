package org.instituto;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;
import java.util.concurrent.atomic.AtomicInteger;

public class Main {
    public static void main(String[] args) {
        ArrayList<Persona> miembros = new ArrayList<>();
        Scanner scanner = new Scanner(System.in);

        //Alumno alumno1 = new Alumno("12356578R", "Jaime", 15, new Date(20,05,2008),new Date( 30, 09, 2022), "DAW", 7.8, 200);
        //Alumno alumno2 = new Alumno("12375378R", "Maria", 16, new Date(15,07,2009),new Date( 30, 10, 2022), "ASIR", 7.8, 200);

        //Profesor profesorMatematicas = new Profesor("1543212578R", "Jacobo", 45, new Date(20,05,1995), new Date( 30, 09, 2015), "completa", 35000, matematicas);
        //Profesor profesorCastellano = new Profesor("1423212578R", "Lucia", 35, new Date(20,05,1985), new Date( 30, 12, 2011), "parcial", 25000, lenguaCatellana);

        Especialidad matematicas = new Especialidad(1, "matematicas");
        Especialidad lenguaCatellana = new Especialidad(2, "castellano");

        do{
                System.out.println("_______________________");
                System.out.println("Si quieres dar una alta teclea 1");
                System.out.println("Si quieres dar una baja teclea 2");
                System.out.println("Si quieres Hacer otra operación 3");

                int userInput = scanner.nextInt();
                scanner.nextLine();
                if(userInput == 1){

                System.out.println("Cual es el DNI?");
                String userDNI= Validaciones.validarDNI(scanner.nextLine());

                System.out.println("Cual es el nombre?");
                String userName= Validaciones.validarNombre(scanner.nextLine());

                System.out.println("Cual es su edad?");
                int userEdad= Validaciones.validarEdad(scanner.nextInt());
                scanner.nextLine();

                System.out.println("Cual es su fecha de nacimiento (y-m-d)?");
                String userFechaNacimiento = Validaciones.validarFecha(scanner.nextLine());
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate userFechaNacimientoDate = LocalDate.parse(userFechaNacimiento, formatter);

                System.out.println("Cuando se incorporó al instituto (y-m-d)?");
                String userFechaIncorporacion = Validaciones.validarFecha(scanner.nextLine());
                LocalDate userFechaIncorporacionDate = LocalDate.parse(userFechaIncorporacion, formatter);

                boolean userMiembroIsIncorrect = true;
                System.out.println("Es un profesor o un alumno?");
                String userMiembro = scanner.nextLine();

                do {
                    if(userMiembro.equalsIgnoreCase("profesor")){

                        System.out.println("Cual es el tipo de jornada Parcial o Completa?");
                        String profesorJornada = Validaciones.validarJonada(scanner.nextLine());

                        System.out.println("Cual es el tipo de jornada Parcial o Completa?");
                        int profesorSueldo = Validaciones.validarSalario(scanner.nextInt());
                        scanner.nextLine();

                        System.out.println("Cual es la especialidad del profesor? Matemáticas o LenguaCastellana");
                        String profesorNombreEspecialidad = scanner.nextLine();

                        Especialidad profesorEspecialidad = new Especialidad();

                        switch (profesorNombreEspecialidad.toLowerCase()){
                            case "matematicas":
                                profesorEspecialidad = matematicas;
                                break;
                            case "lenguacastellana":
                                profesorEspecialidad = lenguaCatellana;
                                break;
                        }

                        Profesor profesor= new Profesor(userDNI, userName, userEdad, userFechaNacimientoDate, userFechaIncorporacionDate,
                                profesorJornada, profesorSueldo, profesorEspecialidad);

                        profesor.aplicarBonificacion();
                        miembros.add(profesor);
                        userMiembroIsIncorrect = false;

                    }else if(userMiembro.equalsIgnoreCase("alumno")){

                        System.out.println("Cual ciclo del alumno DAW, DAM o ASIR?");
                        String alumnoCiclo= Validaciones.validarCiclo(scanner.nextLine());

                        System.out.println("Cual la nota media del alumno?");
                        double alumnoMedia = Validaciones.validarNotaMedia(scanner.nextDouble());
                        scanner.nextLine();

                        System.out.println("Cual es el importe de su matricula?");
                        double alumnoMatricula = Validaciones.validarImporteMatricula(scanner.nextDouble());
                        scanner.nextLine();

                        Alumno alumno = new Alumno(userDNI, userName, userEdad, userFechaNacimientoDate, userFechaIncorporacionDate,
                                alumnoCiclo, alumnoMedia, alumnoMatricula);

                        alumno.aplicarBonificacion();
                        miembros.add(alumno);
                        userMiembroIsIncorrect = false;

                    }else{
                        System.out.println("Introduce un tipo de miembro correcto");
                        userMiembro = scanner.nextLine();
                    }

                }while(userMiembroIsIncorrect);

            }else if(userInput == 2){

                System.out.println("Cual es el DNI del miembro que quieres dar de baja? ");
                String bajaDNI = scanner.nextLine();

                Persona miembroEliminar = miembros.stream()
                                                   .filter(miembro -> miembro.getDNI().equalsIgnoreCase(bajaDNI))
                                                   .findFirst().get();
                miembros.remove(miembroEliminar);

            } else if (userInput == 3) {

                System.out.println("Si quieres ver la edad media de los profesores teclea 1");
                System.out.println("Si quieres ver la nota media de los alumnos de DAM teclea 2");
                System.out.println("Si quieres ver el salario medio de los profesores 3");
                int segundaEleccion = scanner.nextInt();

                switch (segundaEleccion){
                    case 1:
                        mostrarEdadMediaProfesores(miembros);
                        break;
                    case 2:
                        notaMediaAlumnos(miembros);
                        break;
                    case 3:
                        salarioMedioProfesores(miembros);
                        break;

                    default:
                        System.out.println("No has elegido ninguna opción correcta");
                        break;
                }

            }else {
                System.out.println("Elige una opción valida por favor");
            }

        }while (true);
    }
    public static void mostrarEdadMediaProfesores(ArrayList<Persona> miembros){
        AtomicInteger cont = new AtomicInteger();
        AtomicInteger edadesProfesores = new AtomicInteger();

        miembros.stream()
                .filter(Profesor.class::isInstance)
                .forEach(miembro ->{
                edadesProfesores.addAndGet(miembro.getEdad());
                cont.getAndIncrement();}
        );
        System.out.println("La edad media de los profesores es: "+ edadesProfesores.get() / cont.get());
    };

    public static void notaMediaAlumnos(ArrayList<Persona> miembros){
        AtomicInteger cont = new AtomicInteger();
        AtomicInteger notasAlumnos = new AtomicInteger();

        miembros.stream()
                .filter(Alumno.class::isInstance)
                .filter(miembro -> ((Alumno) miembro).getCiclo().equalsIgnoreCase("DAM"))
                .forEach(miembro ->{
                    notasAlumnos.addAndGet(miembro.getEdad());
                    cont.getAndIncrement();}
                );
        System.out.println("La nota media de los alumnos es: "+ notasAlumnos.get() / cont.get());

    }
    public static void salarioMedioProfesores(ArrayList<Persona> miembros){
        AtomicInteger cont = new AtomicInteger();
        AtomicInteger salarioProfesores = new AtomicInteger();

        miembros.stream()
                .filter(Profesor.class::isInstance)
                .forEach(miembro ->{
                    salarioProfesores.addAndGet(miembro.getEdad());
                    cont.getAndIncrement();}
                );
        System.out.println("El salario medio de los profesores es: "+ salarioProfesores.get() / cont.get());

    }
}