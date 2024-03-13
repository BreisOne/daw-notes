/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EjHospital;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.InputMismatchException;
import java.util.Iterator;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author nuria
 */
public class Principal {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        String dni, nombre, direccion, patologia, cargo;
        int edad, idEsp;
        double sueldo;
        Date fechaIng;
        ArrayList<Persona> miembros = new ArrayList<>();
        ArrayList<Area> esp = new ArrayList<>();
        Area a0 = new Area(0, "Cardiología");
        Area a1 = new Area(1, "Pediatría");
        Area a2 = new Area(2, "Traumatología");
        Area a3 = new Area(3, "Neumología");
        Area a4 = new Area(4, "Oncología");
        esp.add(a0);
        esp.add(a1);
        esp.add(a2);
        esp.add(a3);
        esp.add(a4);

        for (int i = 0; i < 5; i++) {
            boolean datosValidos = true;
            if (i % 2 == 0) {
                do {
                    try {
                        System.out.println("Introduzca nombre, Dni, edad, direccion");
                        nombre = sc.nextLine();
                        dni = sc.nextLine();
                        edad = sc.nextInt();
                        direccion = sc.nextLine();

                        System.out.println("Introduzca ahora patología actual y fecha de ingreso actual (dd/MM/yyyy)");
                        patologia = sc.nextLine();
                        fechaIng = sdf.parse(sc.nextLine());

                        datosValidos = true;
                        Paciente pac = new Paciente(fechaIng, patologia, dni, nombre, edad, direccion);

                        // GENERAR INGRESOS
                        pac.anhadirIngreso(0, new Ingreso(sdf.parse("01/02/2010"), sdf.parse("03/02/2010"), a3));
                        pac.anhadirIngreso(0, new Ingreso(sdf.parse("12/01/2022"), sdf.parse("23/01/2022"), a2));
                        pac.anhadirIngreso(0, new Ingreso(sdf.parse("25/02/2022"), sdf.parse("03/03/2022"), a0));

                        miembros.add(pac);

                    } catch (ParseException | InputMismatchException e) {
                        datosValidos = false;
                        System.out.println("ERROR: Los datos introducidos no son correctos");
                    }
                } while (!datosValidos);
            } else {
                do {
                    try {
                        System.out.println("Introduzca nombre, Dni, edad, direccion");
                        nombre = sc.nextLine();
                        dni = sc.nextLine();
                        edad = sc.nextInt();
                        direccion = sc.nextLine();

                        System.out.println("Introduzca ahora cargo y sueldo");
                        cargo = sc.nextLine();
                        sueldo = sc.nextDouble();

                        System.out.println("Las especialidades disponibles son:");
                        System.out.println(esp.toString());

                        System.out.println("Introduzca ahora el identificador de la especialidad");
                        idEsp = sc.nextInt();

                        System.out.println("Introduzca fecha de incorporación al centro");
                        fechaIng = sdf.parse(sc.nextLine());

                        datosValidos = true;
                        miembros.add(new Trabajador(cargo, sueldo, esp.get(idEsp), fechaIng, dni, nombre, edad, direccion));
                    } catch (ParseException | InputMismatchException e) {
                        datosValidos = false;
                        System.out.println("ERROR: Los datos introducidos no son correctos");
                    }
                } while (!datosValidos);
            }
        }

        int countEnfermeros = 0, sumaSueldos = 0;
        double maxSalario = 0;
        int diasIngresoPaciente = 0;

        for (int i = 0; i < miembros.size(); i++) {
            if (miembros.get(i) instanceof Trabajador) {
                if (((Trabajador) miembros.get(i)).getCargo().equalsIgnoreCase("Enfermero")) {
                    sumaSueldos += ((Trabajador) miembros.get(i)).getSueldo();
                    countEnfermeros++;
                }
                if (((Trabajador) miembros.get(i)).getCargo().equalsIgnoreCase("Medico")
                        && ((Trabajador) miembros.get(i)).getArea().getNombre().equalsIgnoreCase("Cardiología")
                        && ((Trabajador) miembros.get(i)).getSueldo() > maxSalario) {
                    maxSalario = ((Trabajador) miembros.get(i)).getSueldo();
                }
            }
            if (miembros.get(i) instanceof Paciente) {
                diasIngresoPaciente = 0;
                HashMap<Integer, Ingreso> ingresos = ((Paciente) miembros.get(i)).getIngresos();
                Iterator claves = ingresos.keySet().iterator();
                Ingreso ing;

                while (claves.hasNext()) {
                    Integer codigo = (Integer) claves.next();
                    ing = ingresos.get(codigo);

                    long restaFechas = ing.getFechaAlta().getTime() - ing.getFechaIngreso().getTime();
                    TimeUnit time = TimeUnit.DAYS;
                    diasIngresoPaciente += time.convert(restaFechas, TimeUnit.MILLISECONDS);
                }
                System.out.println("Estancia total del paciente " + miembros.get(i).getNombre() + ": " + diasIngresoPaciente);
            }
        }

        System.out.println("El salario máximo de los médicos es: " + maxSalario);
        System.out.println("El sueldo medio de enfermería es: " + sumaSueldos / countEnfermeros);
    }
}
