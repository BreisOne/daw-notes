package org.brais;

import org.junit.jupiter.api.Test;

import java.util.ArrayList;
import java.util.Collections;

import static org.junit.jupiter.api.Assertions.*;

class CalculadoraTest {

    @Test
    void testRaicesCuadradas1() {
       ArrayList<Double> resultado = Calculadora.raicesEcuacionSegundoGrado(1,2,1);
       assertEquals(-1, resultado.get(0));
    }
    @Test
    void testRaicesCuadradas2() {
        ArrayList<Double> resultado = Calculadora.raicesEcuacionSegundoGrado(1,0,0);
        assertEquals(0, resultado.get(0));
    }
    @Test
    void testRaicesCuadradas3() {
        ArrayList<Double> resultado = Calculadora.raicesEcuacionSegundoGrado(2,-7,3);
        assertEquals(3, resultado.get(0));
        assertEquals(0.5, resultado.get(1));
    }
    @Test
    void testRaicesCuadradas4() {
        ArrayList<Double> resultado = Calculadora.raicesEcuacionSegundoGrado(1,-5,6);
        assertEquals(3, resultado.get(0));
        assertEquals(2, resultado.get(1));
    }

    @Test
    void testRaicesCuadradas5() {
        ArrayList<Double> resultado = Calculadora.raicesEcuacionSegundoGrado(1,1,0);
        assertEquals(0, resultado.get(0));
        assertEquals(-1, resultado.get(1));
    }

    @Test
    void testRaicesCuadradas6() {
        ArrayList<Double> resultado = Calculadora.raicesEcuacionSegundoGrado(1,1,1);
        assertTrue(resultado.isEmpty());

    }
    @Test
    void testRaicesCuadradas7() {
        ArrayList<Double> resultado = Calculadora.raicesEcuacionSegundoGrado(1,0,1);
        assertTrue(resultado.isEmpty());
    }
   @Test
    void testRaicesCuadradas8() {
        ArrayList<Double> resultado = Calculadora.raicesEcuacionSegundoGrado(0,1,1);
        assertEquals(-1, resultado.get(0));

    }


}