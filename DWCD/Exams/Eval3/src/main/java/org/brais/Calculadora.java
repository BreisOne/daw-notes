package org.brais;

import java.util.ArrayList;

public class Calculadora {
 public static ArrayList<Double> raicesEcuacionSegundoGrado(int a, int b, int c){

     ArrayList <Double> soluciones = new ArrayList<>();

     double discriminante = Math.pow(b, 2) - (4 * a * c);

     if(a != 0) {
         if (discriminante >= 0) {
             if (discriminante == 0) {
                 double solucion = (double) (-b) / (2 * a);
                 soluciones.add(solucion);
             } else {
                 double solucion1 = ((-b) + Math.sqrt(discriminante)) / (2 * a);
                 double solucion2 = ((-b) - Math.sqrt(discriminante)) / (2 * a);

                 soluciones.add(solucion1);
                 soluciones.add(solucion2);
             }
         }
     }else{

         double solucion = -c/b;
         soluciones.add(solucion);
     }

     return soluciones;
 }
}
