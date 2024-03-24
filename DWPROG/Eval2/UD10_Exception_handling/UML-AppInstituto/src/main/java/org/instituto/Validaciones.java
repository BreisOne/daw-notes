package org.instituto;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validaciones {
    static Scanner scanner = new Scanner(System.in);
    public static String validarDNI(String DNI){
        boolean DNIIsNotCorrect = true;
        while(DNIIsNotCorrect) {
            try {
                String regex = "^[0-9]{8}[A-Za-z]$";
                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(DNI);

                if (matcher.matches()) {
                    DNIIsNotCorrect = false;
                    return DNI;
                } else {
                    throw new CustomException(CustomException.DNI_CODE);
                }
            } catch (CustomException e) {
                System.out.println(e.getmError());
                System.out.println("Vuelve a introducir el DNI");
                DNI = scanner.nextLine();
            }
        }
        return DNI;
    }
    public static String validarNombre(String nombre){
        boolean nombreIsNotCorrect = true;
        while(nombreIsNotCorrect){
            try{
                String regex = "^[a-zA-Z]{1,20}$";
                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(nombre);

                if (matcher.matches()){
                    nombreIsNotCorrect = false;
                    return nombre;
                }else {
                    throw new CustomException(CustomException.NAME_CODE);
                }
            }catch (CustomException e){
                System.out.println(e.getmError());
                System.out.println("Vuelve a introducir el nombre");
                nombre = scanner.nextLine();
            }

        }
        return nombre;
    }
    public static int validarEdad(int edad){
        boolean EdadIsNotCorrect = true;
        while(EdadIsNotCorrect){
            try{
                String regex = "^\\d{0,3}$";
                String edadString = Integer.toString(edad);

                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(edadString);

                if(matcher.matches()){
                    EdadIsNotCorrect = false;
                    return edad;
                }else{
                    throw new CustomException(CustomException.AGE_CODE);
                }
            }catch (CustomException e){
                System.out.println(e.getmError());
                System.out.println("Vuelve a introducir la edad");
                edad = scanner.nextInt();
            }
        }
        return edad;
    }

    public static int validarSalario(int Salario){
        boolean salaryIsNotCorrect = true;
        while(salaryIsNotCorrect){
            try{
                String regex = "^[0-9]{5}(\\.[0-9]+)?$";
                String salarioString = Double.toString(Salario);

                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(salarioString);

                if(matcher.matches()){
                    salaryIsNotCorrect = false;
                    return Salario;
                }else{
                    throw new CustomException(CustomException.SALARY_CODE);
                }
            }catch (CustomException e){
                System.out.println(e.getmError());
                System.out.println("Vuelve a introducir un Salario");
                Salario = scanner.nextInt();
                scanner.nextLine();
            }
        }
        return Salario;
    }

    public static String validarFecha(String fecha){
        boolean fechaIsNotCorrect = true;
        while(fechaIsNotCorrect){
            try{
                String regex = "[0-9]{4}-[0-9]{2}-[0-9]{2}";

                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(fecha);

                if(matcher.matches()){
                    fechaIsNotCorrect = false;
                    return fecha;
                }else{
                    throw new CustomException(CustomException.DATE_CODE);
                }
            }catch (CustomException e){
                System.out.println(e.getmError());
                System.out.println("Vuelve a introducir una fecha con formato yyyy-mm-dd: ");
                fecha = scanner.nextLine();
            }
        }
        return fecha;
    }

    public static String validarJonada(String jornada){
        boolean fechaIsNotCorrect = true;
        while(fechaIsNotCorrect){
            try{
                String tiposJonadas = "Parcial completa";

                if(tiposJonadas.contains(jornada)){
                    fechaIsNotCorrect = false;
                    return jornada;
                }else{
                    throw new CustomException(CustomException.JORNADA_CODE);
                }
            }catch (CustomException e){
                System.out.println(e.getmError());
                System.out.println("Vuelve a introducir la jornada del profesor: ");
                jornada = scanner.nextLine();
            }
        }
        return jornada;
    }

    public static String validarCiclo(String ciclo){
        boolean fechaIsNotCorrect = true;
        while(fechaIsNotCorrect){
            try{
                String ciclos = "DAM DAW ASIR";

                if(ciclos.contains(ciclo)){
                    fechaIsNotCorrect = false;
                    return ciclo;
                }else{
                    throw new CustomException(CustomException.JORNADA_CODE);
                }
            }catch (CustomException e){
                System.out.println(e.getmError());
                System.out.println("Vuelve a introducir la jornada del profesor: ");
                ciclo = scanner.nextLine();
            }
        }
        return ciclo;
    }

    public static Double validarNotaMedia(Double notaMedia){
        boolean notaMediaIsNotCorrect = true;
        while(notaMediaIsNotCorrect){
            try{
                String regex = "[0-9]{1,2}(\\.[0-9]+)";
                String notaMediaString = Double.toString(notaMedia);

                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(notaMediaString);

                if(matcher.matches()){
                    notaMediaIsNotCorrect = false;
                    return notaMedia;
                }else{
                    throw new CustomException(CustomException.JORNADA_CODE);
                }
            }catch (CustomException e){
                System.out.println(e.getmError());
                System.out.println("Vuelve a introducir la jornada del profesor: ");
                notaMedia = scanner.nextDouble();
                scanner.nextLine();
            }
        }
        return notaMedia;
    }

    public static Double validarImporteMatricula(Double importeMatricula){
        boolean importeMatriculaIsNotCorrect = true;
        while(importeMatriculaIsNotCorrect){
            try{
                String regex = "[0-9]{1,2}(\\.[0-9]+)";
                String notaMediaString = Double.toString(importeMatricula);

                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(notaMediaString);

                if(matcher.matches()){
                    importeMatriculaIsNotCorrect = false;
                    return importeMatricula;
                }else{
                    throw new CustomException(CustomException.MATRICULA_CODE);
                }
            }catch (CustomException e){
                System.out.println(e.getmError());
                System.out.println("Vuelve a introducir el importe de la matricula: ");
                importeMatricula = scanner.nextDouble();
                scanner.nextLine();
            }
        }
        return importeMatricula;
    }



}
