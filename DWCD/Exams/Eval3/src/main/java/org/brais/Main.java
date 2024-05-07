package org.brais;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        ArrayList<Double> soluciones = new ArrayList<>();
        String continuar = "";

       do{
           try {

               System.out.println("Introduce los coeficientes a,b y c de la ecuación de segundo grado:");
               System.out.println("Introduce el valor de a");
               int a = scanner.nextInt();
               scanner.nextLine();

               System.out.println(("Introduce el valor de b"));
               int b = scanner.nextInt();
               scanner.nextLine();

               System.out.println("Introduce el calor de c:");
               int c = scanner.nextInt();
               scanner.nextLine();


               soluciones = Calculadora.raicesEcuacionSegundoGrado(a, b, c);

               System.out.println("Las soluciones de la ecuación de segundo grado son:");

               if (!soluciones.isEmpty()) {
                   for (double solucion : soluciones) {
                       System.out.println(solucion);
                   }
               } else {
                   System.out.println("No existen");
               }
           }catch(InputMismatchException e) {
               scanner.nextLine();
               System.out.println("Solo se adminten números");
           }

           do {
               System.out.println("Quieres continuar? (si, no)");
               continuar = scanner.nextLine().toLowerCase();

           }while(!continuar.equals("si") && !continuar.equals("no"));

       } while (continuar.equals("si"));

    }
}